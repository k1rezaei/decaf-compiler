from codegen.Utils import create_label, emit_load, emit_addi, emit_data, emit_label, emit_load_double, emit_li, \
    emit_move, emit_jump, emit_syscall, emit_comment, emit
import codegen.Utils as ut
from codegen.Utils import AttName, Address, align_stack, Type, stack_handler
from codegen.Error import TypeError
from codegen.parsetree import Node


def cgen_this(node):
    pass


def cgen_call(node):
    pass


def cgen_readline(node):  # after calling this function address of the string is in $S0
    emit_comment('cgen_readline()')
    ut.disFp -= 4
    node.attribute[AttName.address] = Address(ut.disFp, 0)
    node.attribute[AttName.type] = Type.string
    emit_addi("$sp", "$sp", "-4")
    emit_move("$s3", "$sp")  # $s3 saves top of stack
    emit_li("$v0", 8)
    emit_li("$a1", 1)  # length of read (1 byte)
    emit_li("$s1", ord("\n"))
    l1 = create_label()
    l2 = create_label()
    emit_label(l1)
    emit("addi $sp, $sp, -1")
    emit_move("$a0", "$sp")
    emit_syscall()  # read one char and store in top of stack
    emit("lbu $s0, 0($sp)")
    emit("bneq $s0, $s1, " + l1)  # check the end of line
    emit("sub $a0, $s3, $sp")
    emit_addi("$a0", "$a0", "1")  # amount ot get memory
    emit_li("$v0", 9)
    emit_syscall()  # first of allocated memory is in $v0
    emit_move("$v1", "$v0")  # store address of string in v1 (don't change this reg!)
    emit_addi("$a0", "$a0", "-1")
    emit_addi("$sp", "$s3", "-1")
    emit_label(l2)
    emit("lbu $s0, 0($sp)")
    emit("sb $s0, 0($v0)")
    emit_addi("$v0", "$v0", "1")
    emit_addi("$sp", "$sp", "-1")
    emit_addi("$a0", "$a0", "-1")
    emit("bnez $a0, " + l2)  # check that all characters have benn writen
    emit_li("$v0", 0)
    emit("sb $s0, 0($v0)")
    emit_move("$sp", "$s3")
    emit("sw $v1, 0($sp)")
    return node


def cgen_readint(node):
    emit_comment('cgen_readint')
    expr_set_node_attributes(node, Type.int)
    emit("li $v0, 5")
    emit("syscall")
    emit("sw $v0, " + str(ut.disFp) + "($fp)")
    return node


def expr_set_node_attributes(node, type):
    emit_comment('expr_set_node_attributes')
    emit_addi('$sp', '$sp', '-4')
    ut.disFp -= 4

    if type == Type.double:
        emit_addi('$sp', '$sp', '-4')
        ut.disFp -= 4

    node.attribute[AttName.address] = Address(ut.disFp, 0, type == Type.double)
    node.attribute[AttName.type] = type


def cgen_expr_assign(node):
    emit_comment('cgen_expr_assign')
    stack_handler.add_checkpoint()
    lvalue = cgen_lvalue(node.ref_child[0])
    rvalue_expr = cgen_expr(node.ref_child[2])

    rvalue_expr_type = rvalue_expr.attribute[AttName.type]
    if lvalue.attribute[AttName.type] != rvalue_expr_type:
        raise TypeError("in node: \n" + node.__repr__() + "\nrvalue and lvalue type must be equal.")

    lvalue_address = lvalue.attribute[AttName.address]
    rvalue_address = rvalue_expr.attribute[AttName.address]

    rvalue_address.load()
    emit_move('$t0', '$s0')

    lvalue_address.store()

    emit_move('$s0', '$t0')
    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, rvalue_expr_type)
    node.attribute[AttName.address].store()
    return node


def expr_ident(node):
    return node.ref_child[0].data


def cgen_lvalue(node):
    emit_comment('cgen_lvalue')
    left_child = node.ref_child[0]
    right_child = None
    if len(node.ref_child) >= 3:
        right_child = node.ref_child[2]

    if left_child.data == 'ident':
        ident_name = expr_ident(left_child)
        variable = ut.symbolTable.get_variable_by_name(ident_name)
        node.attribute[AttName.type] = variable.type
        node.attribute[AttName.address] = variable.address
    elif right_child.data == 'ident':
        expr = cgen_expr(left_child)
        ident_name = expr_ident(right_child)
        # TODO inja niaze ke symbol table bara kelas biad (stackam havaset baseh inja)
    else:
        left_expr = cgen_expr(left_child)
        right_expr = cgen_expr(right_child)

        if left_expr.attribute[AttName.type] != Type.array:
            raise TypeError("in node: \n" + node.__repr__() + "\nleft-expr isn't an array.")
        if right_expr.attribute[AttName.type] != Type.int:
            raise TypeError("in node: \n" + node.__repr__() + "\nleft-expr isn't not an integer.")

        node.attribute[AttName.type] = Type.array
        array_member_type = left_expr.attribute[AttName.array_member_type]
        dimension = left_expr.attribute[AttName.array_dim] - 1
        if dimension > 0:
            node.attribute[AttName.array_dim] = dimension
            node.attribute[AttName.array_member_type] = array_member_type
        else:
            node.attribute[AttName.type] = array_member_type

        node.attribute[AttName.address] = Address((
            left_expr.attribute[AttName.address],
            right_expr.attribute[AttName.address]
        ), 3, array_member_type == Type.double and dimension == 0)

    return node


def cgen_constant_int(node):
    emit_comment('cgen_constant_int')
    expr_set_node_attributes(node, Type.int)
    child = node.ref_child[0]

    value = child.data
    if node.data == 'integer':
        value = int(value, 10)
    else:
        value = int(value, 16)

    emit_32li('$s0', value)

    node.attribute[AttName.address].store()
    return node


def emit_32li(dst, value):
    emit('lui ' + dst + ', ' + str(value // (2 ** 16)))
    emit('addiu ' + dst + ', ' + dst + ', ' + str(value % (2 ** 16)))


def cgen_constant_double(node):
    emit_comment('cgen_constant_double')
    expr_set_node_attributes(node, Type.double)
    child = node.ref_child[0]

    value = child.data
    label = create_label()
    emit_data(label, '.double ' + value)

    emit('la $t0, ' + label)
    emit_load_double('$f0', '$t0')

    node.attribute[AttName.address].store()
    return node


def cgen_constant_bool(node):
    emit_comment('cgen_constant_bool')
    expr_set_node_attributes(node, Type.bool)
    child = node.ref_child[0]

    if child.data == 'true':
        emit("li $s0, 1")
    elif child.data == 'false':
        emit("li $s0, 0")

    node.attribute[AttName.address].store()
    return node


def cgen_constant_string(node):
    emit_comment('cgen_constant_string')
    expr_set_node_attributes(node, Type.string)
    child = node.ref_child[0]

    value = child.data
    label = create_label()
    emit_data(label, '.asciiz ' + value)  # TODO avvalesh sizesho mizare?!?!
    emit_data(create_label(), '.space ' + str(8 - (len(value) - 2) % 8))

    emit('la $s0, ' + label)
    node.attribute[AttName.address].store()
    return node


def cgen_constant_null(node):
    emit_comment('cgen_constant_null')
    expr_set_node_attributes(node, Type.null)

    emit("la $s0, null")

    node.attribute[AttName.address].store()
    return node


def cgen_constant(node):
    emit_comment('cgen_constant')
    child = node.ref_child[0]

    if child.data == 'intconstant':
        return cgen_constant_int(child.ref_child[0])
    elif child.data == 'doubleconstant':
        return cgen_constant_double(child)
    elif child.data == 'boolconstant':
        return cgen_constant_bool(child)
    elif child.data == 'stringconstant':
        return cgen_constant_string(child)
    elif child.data == 'null':
        return cgen_constant_null(child)


def cgen_expr_not(node):
    emit_comment('cgen_expr_not')
    child = cgen_expr(node.ref_child[1])

    if child.attribute[AttName.type] != Type.bool:
        raise TypeError("in node: \n" + node.__repr__() + "\n expr's type is not bool.")

    child_address = child.attribute[AttName.address]
    child_address.load()

    emit("li $t0, 1")
    emit("sub $s0, $t0, $s0")

    child_address.store()

    return child


def cgen_expr_neg(node):
    emit_comment('cgen_expr_neg')
    child = cgen_expr(node.ref_child[1])
    child_type = child.attribute[AttName.type]
    child_address = child.attribute[AttName.address]
    child_address.load()

    if child_type == Type.int:
        emit("sub $s0, $zero, $s0")
    elif child_type == Type.double:
        emit("neg.d $f0, $f0")
    else:
        raise TypeError("in node: \n" + node.__repr__() + "\n expr's type is not int or double.")

    child_address.store()
    return child


def cgen_expr_new(node):
    # TODO in class phase
    pass


def expr_type(node):
    type_pri = node.ref_child[0]

    if type_pri.data != 'ident':
        return type_pri.data, len(node.ref_child) - 1

    return type_pri.ref_child[0].data, len(node.ref_child) - 1


def cgen_new_array(node):
    # TODO kollan moghe memory allocate kardan bayad havasemoon bashe %8=0 bashe ke mogheyi ke double migirim ok bashe?
    emit_comment('cgen_new_array')
    stack_handler.add_checkpoint()
    len_expr = cgen_expr(node.ref_child[1])
    (member_type, dimension) = expr_type(node.ref_child[2])

    if len_expr.attribute[AttName.type] != Type.int:
        raise TypeError("in node: \n" + node.__repr__() + "\n length of new_array isn't int.")

    len_expr_address = len_expr.attribute[AttName.address]
    len_expr_address.load()

    if member_type == Type.double:
        emit_li('$t0', '8')
    else:
        emit_li('$t0', '4')

    emit_addi('$s0', '$s0', '1')
    emit('mult $s0, $t0')
    emit('mflo $a0')
    emit_li('$v0', 9)
    emit_syscall()

    emit('sw $s0, 0($v0)')  # Set length

    emit_move('$s0', '$v0')

    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, Type.array)
    node.attribute[AttName.address].store()
    return node


def expr_or_and(node, operation):
    # operation = 'and' or 'or'
    stack_handler.add_checkpoint()

    left_child = cgen_expr(node.ref_child[0])
    right_child = cgen_expr(node.ref_child[2])

    if left_child.attribute[AttName.type] != Type.bool or right_child.attribute[AttName.type] != Type.bool:
        raise TypeError("in node: \n" + node.__repr__() + "\n one of exprs' type is not bool.")

    left_child_address = left_child.attribute[AttName.address]
    right_child_address = right_child.attribute[AttName.address]

    left_child_address.load()
    emit("move $s1, $s0")
    right_child_address.load()
    emit(operation + " $s0, $s0, $s1")

    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, Type.bool)
    node.attribute[AttName.address].store()

    return node


def cgen_expr_bitor(node):
    emit_comment('cgen_expr_bitor')
    return expr_or_and(node, 'or')


def cgen_expr_bitand(node):
    emit_comment('cgen_expr_bitand')
    return expr_or_and(node, 'and')


def cgen_expr_equal(node):
    emit_comment('cgen_expr_equal')
    stack_handler.add_checkpoint()

    left_child = cgen_expr(node.ref_child[0])
    right_child = cgen_expr(node.ref_child[2])

    left_child_address = left_child.attribute[AttName.address]
    right_child_address = right_child.attribute[AttName.address]

    if left_child.attribute[AttName.type] != right_child.attribute[AttName.type]:
        emit("li $s0, 0")
    elif left_child.attribute[AttName.type] == Type.double:
        expr_float_cmp(left_child_address, right_child_address, 'eq')
    # elif left_child.attribute[AttName.type] in (Type.array, Type.string):
    #    pass
    # TODO string, array alan farz shodan ke refrence shoon check beshe
    else:
        left_child_address.load()
        emit("move $s1, $s0")
        right_child_address.load()
        emit("and $t0, $s0, $s1")

        emit("slt $t1, $t0, $zero")
        emit("slt $t0, $zero, $t0")
        emit("or $t0, $t0, $t1")

        emit("li $t1, 1")
        emit("sub $s0, $t1, $t0")
        emit("")

    stack_handler.back_to_last_checkpoint()

    expr_set_node_attributes(node, Type.bool)
    node.attribute[AttName.address].store()
    return node


def expr_float_cmp(left_child_address, right_child_address, operation):
    left_child_address.load()
    emit("mov.d $f2, $f0")
    right_child_address.load()
    emit("c." + operation + ".d $f2, $f0")
    label = create_label()
    emit_li('$s0', 1)
    emit('bc1t ' + label)
    emit_li('$s0', 0)
    emit_label(label)


def cgen_expr_nequal(node):
    emit_comment('cgen_expr_nequal')
    node = cgen_expr_equal(node)
    address = node.attribute[AttName.address]

    address.load()
    emit("li $t0, 1")
    emit("sub $t0, $t0, $s0")
    address.store()
    return node


def cgen_expr_grq(node):
    emit_comment('cgen_expr_grq')
    (node.ref_child[0], node.ref_child[2]) = (node.ref_child[2], node.ref_child[0])
    return cgen_expr_leq(node)


def cgen_expr_gr(node):
    emit_comment('cgen_expr_gr')
    (node.ref_child[0], node.ref_child[2]) = (node.ref_child[2], node.ref_child[0])
    return cgen_expr_le(node)


def cgen_expr_le(node):
    emit_comment('cgen_expr_le')
    stack_handler.add_checkpoint()

    left_child = cgen_expr(node.ref_child[0])
    right_child = cgen_expr(node.ref_child[2])

    left_child_address = left_child.attribute[AttName.address]
    right_child_address = right_child.attribute[AttName.address]

    if left_child.attribute[AttName.type] != right_child.attribute[AttName.type]:
        raise TypeError("in node: \n" + node.__repr__() + "\nTwo exprs must have same type.")
    elif left_child.attribute[AttName.type] == Type.double:
        expr_float_cmp(left_child_address, right_child_address, 'lt')
    elif left_child.attribute[AttName.type] == Type.string:
        pass
        # TODO :((
    elif left_child.attribute[AttName.type] == Type.int:
        left_child_address.load()
        emit_move("$s1", "$s0")
        right_child_address.load()
        emit("slt $s0, $s1, $s0")
    else:
        raise TypeError("in node: \n" + node.__repr__() + "\nExprs' type isn't comparable.")

    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, Type.bool)
    node.attribute[AttName.address].store()
    return node


def cgen_expr_leq(node):
    emit_comment('cgen_expr_leq')
    stack_handler.add_checkpoint()
    node = cgen_expr_leq(node)
    node.attribute[AttName.address].load()
    emit_move("$s2", "$s0")

    stack_handler.back_to_last_checkpoint()

    node = cgen_expr_equal(node)
    node.attribute[AttName.address].load()
    emit("or $s0, $s0, $s2")
    node.attribute[AttName.address].store()
    return node


def expr_add_sub(node, operation):
    # operation = 'add' or 'sub'
    stack_handler.add_checkpoint()
    left_child = cgen_expr(node.ref_child[0])
    right_child = cgen_expr(node.ref_child[2])
    left_child_type = left_child.attribute[AttName.type]

    left_child_address = left_child.attribute[AttName.address]
    right_child_address = right_child.attribute[AttName.address]

    if left_child_type != right_child.attribute[AttName.type] or left_child_type not in (Type.double, Type.int):
        raise TypeError(
            "in node: \n" + node.__repr__() + "\n exprs' types are not good for " + operation + " operation.")
    elif left_child_type == Type.int:
        left_child_address.load()
        emit("move $s1, $s0")
        right_child_address.load()
        emit(operation + " $s0, $s1, $s0")
    elif left_child_type == Type.double:
        left_child_address.load()
        emit("mov.d $f2, $f0")
        right_child_address.load()
        emit(operation + ".d $f0, $f2, $f0")

    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, left_child_type)
    node.attribute[AttName.address].store()
    return node


def cgen_expr_add(node):
    emit_comment('cgen_expr_add')
    return expr_add_sub(node, 'add')


def cgen_expr_sub(node):
    emit_comment('cgen_expr_sub')
    return expr_add_sub(node, 'sub')


def expr_mul_mod_div(node, operation):
    # operation = 'div' or 'mod' or 'mul'
    stack_handler.add_checkpoint()
    left_child = cgen_expr(node.ref_child[0])
    right_child = cgen_expr(node.ref_child[2])
    left_child_type = left_child.attribute[AttName.type]

    left_child_address = left_child.attribute[AttName.address]
    right_child_address = right_child.attribute[AttName.address]

    if left_child_type != right_child.attribute[AttName.type] or left_child_type not in (Type.double, Type.int) or (
            operation == 'mod' and left_child_type != Type.int):
        raise TypeError(
            "in node: \n" + node.__repr__() + "\n exprs' types are not good for " + operation + " operation.")
    elif left_child_type == Type.int:
        left_child_address.load()
        emit("move $s1, $s0")
        right_child_address.load()
        if operation == 'mul':
            emit("mult $s0, $s1")
        else:
            emit("div $s1, $s0")

        if operation == 'mod':
            emit("mfhi $s0")
        else:
            emit("mflo $s0")
    elif left_child_type == Type.double:
        left_child_address.load()
        emit("mov.d $f2, $f0")
        right_child_address.load()
        emit(operation + ".d $f0, $f2, $f0")  # TODO ino check kon div mesle inke kollan barax bood

    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, left_child_type)
    node.attribute[AttName.address].store()
    return node


def cgen_expr_mul(node):
    emit_comment('cgen_expr_mul')
    return expr_mul_mod_div(node, 'mul')


def cgen_expr_div(node):
    emit_comment('cgen_expr_div')
    return expr_mul_mod_div(node, 'div')


def cgen_expr_mod(node):
    emit_comment('cgen_expr_mod')
    return expr_mul_mod_div(node, 'mod')


def cgen_expr(node):
    if len(node.child) == 1:
        child = node.ref_child[0]

        if child.data == 'expr':
            return cgen_expr(child)
        elif child.data == 'readline':
            return cgen_readline(child)
        elif child.data == 'readint':
            return cgen_readint(child)
        elif child.data == 'call':
            return cgen_call(child)
        elif child.data == 'this':
            return cgen_this(child)
        elif child.data == 'lvalue':
            return cgen_lvalue(child)
        elif child.data == 'constant':
            return cgen_constant(child)

    elif len(node.child) == 2:
        child = node.ref_child[0]

        if child.data == 'not':
            return cgen_expr_not(node)
        elif child.data == 'neg':
            return cgen_expr_neg(node)
        elif child.data == 'new':
            return cgen_expr_new(node)

    elif len(node.child) == 3:
        mid_child = node.ref_child[1]

        if mid_child.data == 'assign':
            return cgen_expr_assign(node)
        elif mid_child.data == 'bitor':
            return cgen_expr_bitor(node)
        elif mid_child.data == 'bitand':
            return cgen_expr_bitand(node)
        elif mid_child.data == 'equal':
            return cgen_expr_equal(node)
        elif mid_child.data == 'nequal':
            return cgen_expr_nequal(node)
        elif mid_child.data == 'grq':
            return cgen_expr_grq(node)
        elif mid_child.data == 'gr':
            return cgen_expr_gr(node)
        elif mid_child.data == 'le':
            return cgen_expr_le(node)
        elif mid_child.data == 'leq':
            return cgen_expr_leq(node)
        elif mid_child.data == 'sub':
            return cgen_expr_sub(node)
        elif mid_child.data == 'add':
            return cgen_expr_add(node)
        elif mid_child.data == 'mul':
            return cgen_expr_mul(node)
        elif mid_child.data == 'div':
            return cgen_expr_div(node)
        elif mid_child.data == 'mod':
            return cgen_expr_mod(node)
        elif mid_child.data == 'expr':
            left_child = node.ref_child[0]

            if left_child.data == 'parop':
                return cgen_expr(node.ref_child[1])
            elif left_child.data == 'newarray':
                return cgen_new_array(node)
