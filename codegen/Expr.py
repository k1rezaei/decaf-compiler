from codegen.CodeGen import emit, cgen_readint, cgen_readline, emit_data, create_label, emit_load_double
from codegen.grammar import parseTree
from codegen.Utils import Variable, Address, SymbolTable, Type, AttName
from codegen.parsetree import Node
from codegen.Error import TypeError


def cgen_call(node):
    pass


def cgen_this(node):
    pass


def cgen_lvalue(node):
    pass


def cgen_constant_int(node):
    expr_set_node_attributes(node, Type.int)
    child = node.ref_child[0]

    value = child.data
    if node.data == 'integer':
        value = int(value, 10)
    else:
        value = int(value, 16)

    emit('lui $s0, ' + str(value // (2 ** 16)))
    emit('addiu $s0, $s0, ' + str(value % (2 ** 16)))

    node.attribute[AttName.address].store()
    return node


def cgen_constant_double(node):
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
    expr_set_node_attributes(node, Type.bool)
    child = node.ref_child[0]

    if child.data == 'true':
        emit("li $s0, 1")
    elif child.data == 'false':
        emit("li $s0, 0")

    node.attribute[AttName.address].store()
    return node


def cgen_constant_string(node):
    expr_set_node_attributes(node, Type.string)
    child = node.ref_child[0]

    value = child.data
    label = create_label()
    emit_data(label, '.asciiz ' + value)
    emit_data(create_label(), '.space ' + str(8 - (len(value) - 2) % 8))

    emit('la $s0, ' + label)
    node.attribute[AttName.address].store()
    return node


def cgen_constant_null(node):
    expr_set_node_attributes(node, Type.null)

    emit("la $s0, null")

    node.attribute[AttName.address].store()
    return node


def cgen_constant(node):
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
    pass


def cgen_newarray(node):
    pass


def cgen_expr_assign(node):
    pass


def expr_set_node_attributes(node, type):
    global disFp
    emit("addi $sp, -4")
    disFp -= 4

    if type == Type.double:
        emit("addi $sp, -4")
        disFp -= 4

    node.attribute[AttName.address] = Address(disFp, 0)
    node.attribute[AttName.type] = type


def expr_or_and(node, operation):
    # operation = 'and' or 'or'
    expr_set_node_attributes(node, Type.bool)
    address = node.attribute[AttName.address]

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
    address.store()

    return node


def cgen_expr_bitor(node):
    return expr_or_and(node, 'or')


def cgen_expr_bitand(node):
    return expr_or_and(node, 'and')


def cgen_expr_equal(node):
    expr_set_node_attributes(node, Type.bool)
    address = node.attribute[AttName.address]

    left_child = cgen_expr(node.ref_child[0])
    right_child = cgen_expr(node.ref_child[2])

    left_child_address = left_child.attribute[AttName.address]
    right_child_address = right_child.attribute[AttName.address]

    if left_child.attribute[AttName.type] != right_child.attribute[AttName.type]:
        emit("li $s0, 0")
    elif left_child.attribute[AttName.type] == Type.double:
        left_child_address.load()
        emit("mov.d $f2, $f0")
        right_child_address.load()
        emit("c.eq.d $f0, $f2")
        # TODO chejoori mishe be flagesh dastresi dasht :-?
    elif left_child.attribute[AttName.type] in (Type.array, Type.string):
        pass
        # TODO :((
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

    address.store()
    return node


def cgen_expr_nequal(node):
    node = cgen_expr_equal(node)
    address = node.attribute[AttName.address]

    address.load()
    emit("li $t0, 1")
    emit("sub $t0, $s0")
    address.store()
    return node


def cgen_expr_grq(node):
    pass


def cgen_expr_gr(node):
    pass


def cgen_expr_le(node):
    pass


def cgen_expr_leq(node):
    pass


def expr_add_sub(node, operation):
    # operation = 'add' or 'sub'
    left_child = cgen_expr(node.ref_child[0])
    right_child = cgen_expr(node.ref_child[2])
    left_child_type = left_child.attribute[AttName.type]

    expr_set_node_attributes(node, left_child_type)
    address = node.attribute[AttName.address]

    left_child_address = left_child.attribute[AttName.address]
    right_child_address = right_child.attribute[AttName.address]

    if left_child_type != right_child.attribute[type] or left_child_type not in (Type.double, Type.int):
        raise TypeError(
            "in node: \n" + node.__repr__() + "\n exprs' types are not good for " + operation + " operation.")
    elif left_child_type == Type.int:
        left_child_address.load()
        emit("move $s1, $s0")
        right_child_address.load()
        emit(operation + " $s0, $s0, $s1")
    elif left_child_type == Type.double:
        left_child_address.load()
        emit("mov.d $f2, $f0")
        right_child_address.load()
        emit(operation + ".d $f0, $f0, $f2")

    address.store()
    return node


def cgen_expr_add(node):
    return expr_add_sub(node, 'add')


def cgen_expr_sub(node):
    return expr_add_sub(node, 'sub')


def expr_mul_mod_div(node, operation):
    # operation = 'div' or 'mod' or 'mul'
    left_child = cgen_expr(node.ref_child[0])
    right_child = cgen_expr(node.ref_child[2])
    left_child_type = left_child.attribute[AttName.type]

    expr_set_node_attributes(node, left_child_type)
    address = node.attribute[AttName.address]

    left_child_address = left_child.attribute[AttName.address]
    right_child_address = right_child.attribute[AttName.address]

    if left_child_type != right_child.attribute[type] or left_child_type not in (Type.double, Type.int) or (
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
            emit("div $s0, $s1")

        if operation == 'mod':
            emit("mfhi $s0")
        else:
            emit("mflo $s0")
    elif left_child_type == Type.double:
        left_child_address.load()
        emit("mov.d $f2, $f0")
        right_child_address.load()
        emit(operation + ".d $f0, $f0, $f2")

    address.store()
    return node


def cgen_expr_mul(node):
    return expr_mul_mod_div(node, 'mul')


def cgen_expr_div(node):
    return expr_mul_mod_div(node, 'div')


def cgen_expr_mod(node):
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
                return cgen_newarray(node)

    return Node("", 0)
