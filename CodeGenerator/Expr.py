import Utils as ut
from Error import TypeError, FunctionError
from Utils import emit_jalr, Address, Type, stack_handler, is_class_type, emit_load_byte, \
    class_handler, emit_load_address
from Utils import function_handler, create_label, emit_addi, emit_data, emit_label, \
    emit_load_double, emit_li, emit_move, emit_jump, emit_syscall, emit_comment, emit


def expr_set_node_attributes(node, type):
    node.set_address(new_address_on_top_of_stack(type == Type.double))
    node.set_type(type)


def new_address_on_top_of_stack(is_double):
    emit_comment('expr_set_node_attributes')
    emit_addi('$sp', '$sp', '-4')
    ut.disFp -= 4
    address = Address(ut.disFp, 0, is_double)
    return address


def cgen_this(node):
    emit_comment('cgen_this()')
    node.set_type(ut.this_type)
    node.set_address(get_this_address())
    return node


def get_this_address():
    return Address(4, 0, False)


def cgen_call(node):
    emit_comment('cgen_call()')
    left_child = node.ref_child[0]

    stack_handler.add_checkpoint()

    if left_child.data == 'expr':
        expr = cgen_expr(node.ref_child[0])
        function_name = expr_ident(node.ref_child[2])
        actual_node = node.ref_child[3]

        if not is_class_type(expr.get_type()) and expr.get_type() != Type.array:
            raise TypeError("in node: \n" + node.__repr__() + "\nexpr's type isn't class or array type.")

        if expr.get_type == Type.array and function_name != 'length':
            raise TypeError("in node: \n" + node.__repr__() + "\nwhen expr is array function_name must be length")

        argument_list = expr_atual_get_args_list(actual_node, [expr])

        argument_type_list = get_args_type_list(argument_list)

        push_arguments_to_stack(argument_list)

        ra_address = push_ra_to_stack()

        if expr.get_type() == Type.array:
            emit_load_address('$s0', '___array_length')
            return_type = Type.int
        else:
            function, function_address = get_class_function_and_its_address(expr.get_address(), function_name,
                                                                            expr.get_type(),
                                                                            argument_type_list[1:])
            function_address.load()
            return_type = function.return_type

    else:
        function_name = expr_ident(left_child)
        actual_node = node.ref_child[1]

        argument_list = expr_atual_get_args_list(actual_node, [])

        argument_type_list = get_args_type_list(argument_list)

        if ut.this_type is None:
            function = function_handler.get_function(function_name, argument_type_list)
            function_address = None
            push_arguments_to_stack(argument_list)
        else:
            try:
                function, function_address = get_class_function_and_its_address(get_this_address(), function_name,
                                                                                ut.this_type, argument_type_list)
                push_arguments_to_stack(argument_list)
                get_this_address().load()
                new_address_on_top_of_stack(ut.this_type == Type.double).store()
            except FunctionError:
                function = function_handler.get_function(function_name, argument_type_list)
                function_address = None
                push_arguments_to_stack(argument_list)

        return_type = function.return_type

        ra_address = push_ra_to_stack()
        if function_address is None:
            emit_load_address('$s0', function.label)
        else:
            function_address.load()

    stack_handler.set_fp_equal_sp()

    emit_jalr('$s0')

    stack_handler.back_to_last_fp()

    ra_address.load()
    emit_move('$ra', '$s0')
    emit_move('$s0', '$v0')
    stack_handler.back_to_last_checkpoint()

    if isinstance(return_type, str):
        expr_set_node_attributes(node, return_type)
    else:
        expr_set_node_attributes(node, Type.array)
        node.set_array_member_type(return_type[0])
        node.set_array_dim(return_type[1])

    node.get_address().store()
    return node


def expr_atual_get_args_list(actual_node, initial_list):
    argument_list = initial_list
    for expr_node in actual_node.ref_child:
        argument_list.append(cgen_expr(expr_node))
    return argument_list


def get_class_function_and_its_address(object_address, function_name, class_name, argument_type_list):
    (function, offset) = class_handler.get_function(class_name, function_name, argument_type_list)
    vtable_address = Address((
        object_address,
        0
    ), 2, False)
    function_address = Address((
        vtable_address,
        offset
    ), 2, False)

    return function, function_address


def push_ra_to_stack():
    emit_move('$s0', '$ra')
    ra_address = new_address_on_top_of_stack(Type.int == Type.double)
    ra_address.store()
    return ra_address


def push_arguments_to_stack(argument_list):
    for node in argument_list[::-1]:
        node.get_address().load()
        new_address_on_top_of_stack(node.get_type() == Type.double).store()


def get_args_type_list(argument_list):
    argument_type_list = []
    for node in argument_list:
        node_type = node.get_type()
        if node_type == Type.array:
            node_type = (node.get_array_member_type(), node.get_array_dim())
        argument_type_list.append(node_type)
    return argument_type_list


def cgen_readline(node):  # after calling this function address of the string is in $S0
    emit_comment('cgen_readline()')
    l1 = create_label()
    l2 = create_label()
    l3 = create_label()
    l4 = create_label()
    ut.disFp -= 4
    node.set_address(Address(ut.disFp, 0, False))
    node.set_type(Type.string)
    emit_addi("$sp", "$sp", "-4")
    emit('''li $v0, 8
li $a1, 400
la $a0, __read
syscall
li $a1, 1
li $a2, 0''')
    emit_label(l1)
    emit('''lbu $a2, 0($a0)
li $a3, 10''')
    emit("beq $a2, $a3, " + l2)
    emit_li('$a3', 13)
    emit("beq $a2, $a3, " + l2)
    emit_li('$a3', 0)
    emit("beq $a2, $a3, " + l2)
    emit_addi('$a1', '$a1', '1')
    emit_addi('$a0', '$a0', '1')
    emit_jump(l1)
    emit_label(l2)
    emit('''li $v0, 9
move $a0, $a1
syscall
move $v1, $v0
la $a0, __read''')
    emit_label(l3)
    emit('''lbu $a2, 0($a0)
sb $zero, 0($a0)
li $a3, 10''')
    emit("beq $a2, $a3, " + l4)
    emit_li('$a3', 13)
    emit("beq $a2, $a3, " + l4)
    emit_li('$a3', 0)
    emit("beq $a2, $a3, " + l4)
    emit('''sb $a2, 0($v0)
addi $v0, $v0, 1
addi $a0, $a0, 1''')
    emit_jump(l3)
    emit_label(l4)
    emit("sw $v1, 0($sp)")
    return node


def cgen_readint(node):
    L1 = create_label()
    L2 = create_label()
    L3 = create_label()
    L4 = create_label()
    L5 = create_label()
    L6 = create_label()
    L7 = create_label()
    L8 = create_label()
    L9 = create_label()
    L10 = create_label()
    L7_ = create_label()
    L_1 = create_label()
    L_2 = create_label()
    L_3 = create_label()
    L_4 = create_label()
    L_5 = create_label()
    L_6 = create_label()
    L_7 = create_label()
    exitt = create_label()
    exit = create_label()
    LL1 = create_label()
    LL2 = create_label()
    LL3 = create_label()
    LL4 = create_label()
    LL5 = create_label()
    LL6 = create_label()
    LL7 = create_label()
    LL8 = create_label()
    expr_set_node_attributes(node, Type.int)

    emit_li('$v0', 8)
    emit_li('$a1', 400)
    emit('la $a0, __read')
    emit_li('$t0', 0)
    emit_li('$t1', 0)
    emit_li('$t4', 10)
    emit_syscall()
    emit_load_byte('$t2', '$a0')
    emit_addi('$a0', '$a0', '1')
    emit_li('$t3', 13)
    emit('bne $t3, $t2, ' + LL1)
    emit_jump(exit)
    emit_label(LL1)
    emit_li('$t3', 0)
    emit('bne $t3, $t2, ' + LL2)
    emit_jump(exit)
    emit_label(LL2)
    emit_li('$t3', 10)
    emit('bne $t3, $t2, ' + L1)
    emit_jump(exit)
    emit_label(L1)
    emit_li('$t3', 45)
    emit('bne $t3, $t2, ' + L2)
    emit_li('$t1', 1)
    emit_jump(L3)
    emit_label(L2)
    emit_li('$t3', 43)
    emit('bne $t3, $t2, ' + L4)
    emit_label(L3)
    emit_load_byte('$t2', '$a0')
    emit_addi('$a0', '$a0', '1')
    emit_label(L4)
    emit_li('$t3', 13)
    emit('bne $t2, $t3, ' + LL3)
    emit_jump(exit)
    emit_label(LL3)
    emit_li('$t3', 0)
    emit('bne $t2, $t3, ' + LL4)
    emit_jump(exit)
    emit_label(LL4)
    emit_li('$t3', 10)
    emit('bne $t2, $t3, ' + L_7)
    emit_jump(exit)
    emit_label(L_7)
    emit_addi('$t2', '$t2', '-48')
    emit_li('$t3', 0)
    emit('bge $t2, $t3, ' + L5)
    emit_li('$t1', -1)
    emit_jump(L_1)
    emit_label(L5)
    emit_li('$t3', 10)
    emit('bgt $t3, $t2, ' + L6)
    emit_li('$t1', -1)
    emit_jump(L_1)
    emit_label(L6)
    emit_li('$t3', 0)
    emit_move('$t0', '$t2')
    emit('bne $t2, $t3, ' + L_1)
    emit_load_byte('$t2', '$a0')
    emit_addi('$a0', '$a0', '1')
    emit_li('$t3', 13)
    emit('bne $t2, $t3, ' + LL5)
    emit_jump(exit)
    emit_label(LL5)
    emit_li('$t3', 0)
    emit('bne $t2, $t3, ' + LL6)
    emit_jump(exit)
    emit_label(LL6)
    emit_li('$t3', 10)
    emit('bne $t2, $t3, ' + L7)
    emit_jump(exit)
    emit_label(L7)
    emit_li('$t3', 88)
    emit('beq $t2, $t3, ' + L7_)
    emit_li('$t3', 120)
    emit('beq $t2, $t3, ' + L7_)
    emit_jump(L8)
    emit_label(L7_)
    emit_li('$t4', 16)
    emit_jump(L_1)
    emit_label(L8)
    emit_li('$t3', 48)
    emit('bge $t2, $t3, ' + L9)
    emit_li('$t1', -1)
    emit_jump(L_1)
    emit_label(L9)
    emit_li('$t3', 57)
    emit('ble $t2, $t3, ' + L10)
    emit_li('$t1', -1)
    emit_jump(L_1)
    emit_label(L10)
    emit_addi('$t2', '$t2', '-48')
    emit_move('$t0', '$t2')
    emit_label(L_1)
    emit_load_byte('$t2', '$a0')
    emit_addi('$a0', '$a0', '1')
    emit_li('$t3', 13)
    emit('bne $t2, $t3, ' + LL7)
    emit_jump(exitt)
    emit_label(LL7)
    emit_li('$t3', 0)
    emit('bne $t2, $t3, ' + LL8)
    emit_jump(exitt)
    emit_label(LL8)
    emit_li('$t3', 10)
    emit('bne $t2, $t3, ' + L_2)
    emit_jump(exitt)
    emit_label(L_2)
    emit_li('$t3', 48)
    emit('blt $t2, $t3, ' + L_5)
    emit_li('$t3', 57)
    emit('bgt $t2, $t3, ' + L_3)
    emit_addi('$t2', '$t2', '-48')
    emit('mul $t0, $t0, $t4')
    emit('add $t0, $t0, $t2')
    emit_jump(L_1)
    emit_label(L_3)
    emit_li('$t3', 65)
    emit('blt $t2, $t3, ' + L_5)
    emit_li('$t3', 70)
    emit('bgt $t2, $t3, ' + L_4)
    emit_addi('$t2', '$t2', '-55')
    emit('bge $t2, $t4, ' + L_5)
    emit('mul $t0, $t0, $t4')
    emit('add $t0, $t0, $t2')
    emit_jump(L_1)
    emit_label(L_4)
    emit_li('$t3', 97)
    emit('blt $t2, $t3, ' + L_5)
    emit_li('$t3', 102)
    emit('bgt $t2, $t3, ' + L_5)
    emit_addi('$t2', '$t2', '-87')
    emit('bge $t2, $t4, ' + L_5)
    emit('mul $t0, $t0, $t4')
    emit('add $t0, $t0, $t2')
    emit_jump(L_1)
    emit_label(L_5)
    emit_li('$t1', -1)
    emit_jump(L_1)
    emit_label(exitt)
    emit_li('$t4', -1)
    emit('bne $t4, $t1, ' + L_6)
    emit_li('$t0', 0)
    emit_jump(exit)
    emit_label(L_6)
    emit_li('$t4', 1)
    emit('bne $t4, $t1, ' + exit)
    emit('sub $t0, $zero, $t0')
    emit_label(exit)
    emit_move('$s0', '$t0')
    node.get_address().store()
    return node


def expr_convertable(destination_type, source_type):
    # member array ro typeshoono check nemikone (chon asan voroodi nemigire)
    if destination_type == source_type:
        return True

    return is_class_type(destination_type) and is_class_type(source_type) and ut.class_analyzer.convertible(
        destination_type, source_type)


def cgen_expr_assign(node):
    emit_comment('cgen_expr_assign')
    stack_handler.add_checkpoint()
    lvalue = cgen_lvalue(node.ref_child[0])
    rvalue_expr = cgen_expr(node.ref_child[2])

    rvalue_expr_type = rvalue_expr.get_type()
    lvalue_type = lvalue.get_type()

    if not expr_convertable(lvalue_type, rvalue_expr_type):
        raise TypeError(
            "in node: \n" + lvalue.__repr__() + rvalue_expr.__repr__() + "\nrvalue and lvalue type must be equal.")

    if rvalue_expr_type == Type.array:
        if (not expr_convertable(lvalue.get_array_member_type(),
                                 rvalue_expr.get_array_member_type())) or \
                rvalue_expr.get_array_dim() != lvalue.get_array_dim():
            raise TypeError(
                "in node: \n" + lvalue.__repr__() + rvalue_expr.__repr__() + "\nrvalue and lvalue member-type and "
                                                                             "arr-dimension must be equal.")

    lvalue_address = lvalue.get_address()
    rvalue_address = rvalue_expr.get_address()

    rvalue_address.load()
    emit_move('$t0', '$s0')

    lvalue_address.store()

    emit_move('$s0', '$t0')
    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, lvalue_type)
    node.get_address().store()

    if rvalue_expr_type == Type.array:
        node.set_array_dim(lvalue.get_array_dim())
        node.set_array_member_type(lvalue.get_array_member_type())

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
        if variable.is_array:
            node.set_type(Type.array)
            node.set_array_member_type(variable.type[0])
            node.set_array_dim(variable.type[1])
        else:
            node.set_type(variable.type)

        node.set_address(variable.address)
    elif right_child.data == 'ident':
        stack_handler.add_checkpoint()
        expr = cgen_expr(left_child)
        ident_name = expr_ident(right_child)

        variable = ut.class_handler.get_variable(expr.get_type(), ident_name)

        expr.get_address().load()

        stack_handler.back_to_last_checkpoint()
        new_address = new_address_on_top_of_stack(False)
        new_address.store()

        if variable.is_array:
            node.set_type(Type.array)
            node.set_array_member_type(variable.type[0])
            node.set_array_dim(variable.type[1])
        else:
            node.set_type(variable.type)

        node.set_address(Address((
            new_address,
            variable.address
        ), 2, node.get_type() == Type.double))
    else:
        left_expr = cgen_expr(left_child)
        stack_handler.add_checkpoint()

        right_expr = cgen_expr(right_child)

        if left_expr.get_type() != Type.array:
            raise TypeError("in node: \n" + node.__repr__() + "\nleft-expr isn't an array.")
        if right_expr.get_type() != Type.int:
            raise TypeError("in node: \n" + node.__repr__() + "\nright-expr isn't an integer.")

        node.set_type(Type.array)
        array_member_type = left_expr.get_array_member_type()
        dimension = left_expr.get_array_dim() - 1
        if dimension > 0:
            node.set_array_dim(dimension)
            node.set_array_member_type(array_member_type)
        else:
            node.set_type(array_member_type)

        right_expr.get_address().load()
        stack_handler.back_to_last_checkpoint()
        new_address = new_address_on_top_of_stack(False)
        new_address.store()

        node.set_address(Address((
            left_expr.get_address(),
            new_address
        ), 3, array_member_type == Type.double and dimension == 0))

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

    node.get_address().store()
    return node


def emit_32li(dst, value):
    emit('lui ' + dst + ', ' + str(value // (2 ** 16)))
    emit('addiu ' + dst + ', ' + dst + ', ' + str(value % (2 ** 16)))


def cgen_constant_double(node):
    emit_comment('cgen_constant_double')
    expr_set_node_attributes(node, Type.double)
    child = node.ref_child[0]

    value = str(child.data).lower()
    label = create_label()

    emit_data(label, '.float ' + value)

    emit('la $t0, ' + label)
    emit_load_double('$f0', '$t0')

    node.get_address().store()
    return node


def cgen_constant_bool(node):
    emit_comment('cgen_constant_bool')
    expr_set_node_attributes(node, Type.bool)
    child = node.ref_child[0]

    if child.data == 'true':
        emit("li $s0, 1")
    elif child.data == 'false':
        emit("li $s0, 0")

    node.get_address().store()
    return node


def cgen_constant_string(node):
    emit_comment('cgen_constant_string')
    expr_set_node_attributes(node, Type.string)
    child = node.ref_child[0]

    value = child.data
    label = create_label()
    emit_data(label, '.asciiz ' + value)
    emit_data(create_label(), '.space ' + str(4 - (len(value) - 2) % 4))

    emit('la $s0, ' + label)
    node.get_address().store()
    return node


def cgen_constant_null(node):
    emit_comment('cgen_constant_null')
    expr_set_node_attributes(node, Type.null)

    emit("la $s0, __null")

    node.get_address().store()
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
    stack_handler.add_checkpoint()

    child = cgen_expr(node.ref_child[1])

    if child.get_type() != Type.bool:
        raise TypeError("in node: \n" + node.__repr__() + "\n expr's type is not bool.")

    child_address = child.get_address()
    child_address.load()

    emit("li $t0, 1")
    emit("sub $s0, $t0, $s0")

    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, Type.bool)
    node.get_address().store()
    return node


def cgen_expr_neg(node):
    emit_comment('cgen_expr_neg')
    stack_handler.add_checkpoint()

    child = cgen_expr(node.ref_child[1])
    child_type = child.get_type()
    child_address = child.get_address()
    child_address.load()

    if child_type == Type.int:
        emit("sub $s0, $zero, $s0")
    elif child_type == Type.double:
        emit("neg.s $f0, $f0")
    else:
        raise TypeError("in node: \n" + node.__repr__() + "\n expr's type is not int or double.")

    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, child_type)
    node.get_address().store()
    return node


def cgen_expr_new(node):
    class_name = expr_ident(node.ref_child[1])
    expr_set_node_attributes(node, class_name)
    obj_size = ut.class_handler.get_object_size(class_name)
    emit_li('$a0', obj_size)
    emit_li('$v0', 9)
    emit_syscall()
    emit_move('$s0', '$v0')
    node.get_address().store()
    emit('la $s0, ' + class_name)
    emit('sw $s0, 0($v0)')
    return node


def expr_type(node):
    type_pri = node.ref_child[0].ref_child[0].data
    if type_pri == 'ident':
        type_pri = node.ref_child[0].ref_child[0].ref_child[0].data
    return type_pri, len(node.ref_child) - 1


def cgen_new_array(node):
    emit_comment('cgen_new_array')
    stack_handler.add_checkpoint()
    len_expr = cgen_expr(node.ref_child[1])
    (member_type, dimension) = expr_type(node.ref_child[2])

    if len_expr.get_type() != Type.int:
        raise TypeError("in node: \n" + node.__repr__() + "\n length of new_array isn't int.")

    len_expr_address = len_expr.get_address()
    len_expr_address.load()

    emit_li('$t0', '4')

    emit_addi('$s0', '$s0', '1')
    emit('mult $s0, $t0')
    emit('mflo $a0')
    emit_li('$v0', 9)
    emit_syscall()

    # Set length
    emit_addi('$s0', '$s0', '-1')
    emit('sw $s0, 0($v0)')
    emit_addi('$s0', '$s0', '1')

    emit_move('$s0', '$v0')

    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, Type.array)
    node.get_address().store()
    node.set_array_dim(dimension + 1)
    node.set_array_member_type(member_type)
    return node


def expr_or_and(node, operation):
    # operation = 'and' or 'or'
    stack_handler.add_checkpoint()

    left_child = cgen_expr(node.ref_child[0])
    right_child = cgen_expr(node.ref_child[2])

    if left_child.get_type() != Type.bool or right_child.get_type() != Type.bool:
        raise TypeError("in node: \n" + node.__repr__() + "\n one of exprs' type is not bool.")

    left_child_address = left_child.get_address()
    right_child_address = right_child.get_address()

    left_child_address.load()
    emit("move $s1, $s0")
    right_child_address.load()
    emit(operation + " $s0, $s0, $s1")

    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, Type.bool)
    node.get_address().store()

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

    left_child_address = left_child.get_address()
    right_child_address = right_child.get_address()

    if not expr_convertable(left_child.get_type(), right_child.get_type()) and not expr_convertable(
            right_child.get_type(), left_child.get_type()):
        emit_li("$s0", 0)
    elif left_child.get_type() == Type.double:
        expr_float_cmp(left_child_address, right_child_address, 'eq')
    elif left_child.get_type() == Type.string:
        left_child_address.load()
        emit_move('$s1', '$s0')
        right_child_address.load()
        emit_move('$s2', '$s0')
        emit_li('$s0', 1)

        first_label = create_label()
        second_label = create_label()
        out_label = create_label()

        emit_label(first_label)
        emit_load_byte('$t0', '$s1')
        emit_load_byte('$t1', '$s2')
        emit_addi('$s1', '$s1', '1')
        emit_addi('$s2', '$s2', '1')
        emit('beq $t0, $t1, ' + second_label)
        emit_li('$s0', 0)
        emit_label(second_label)
        emit('beqz $t0, ' + out_label)
        emit('beqz $t1, ' + out_label)
        emit_jump(first_label)
        emit_label(out_label)

    else:
        left_child_address.load()
        emit_move('$s1', '$s0')
        right_child_address.load()
        emit("xor $t0, $s0, $s1")

        emit("slt $t1, $t0, $zero")
        emit("slt $t0, $zero, $t0")
        emit("or $t0, $t0, $t1")

        emit("li $t1, 1")
        emit("sub $s0, $t1, $t0")
        emit("")

    stack_handler.back_to_last_checkpoint()

    expr_set_node_attributes(node, Type.bool)
    node.get_address().store()
    return node


def expr_float_cmp(left_child_address, right_child_address, operation):
    left_child_address.load()
    emit("mov.s $f2, $f0")
    right_child_address.load()
    emit("c." + operation + ".s $f2, $f0")
    label = create_label()
    emit_li('$s0', 1)
    emit('bc1t ' + label)
    emit_li('$s0', 0)
    emit_label(label)


def cgen_expr_nequal(node):
    emit_comment('cgen_expr_nequal')
    node = cgen_expr_equal(node)
    address = node.get_address()

    address.load()
    emit("li $t0, 1")
    emit("sub $s0, $t0, $s0")
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

    left_child_address = left_child.get_address()
    right_child_address = right_child.get_address()

    if left_child.get_type() != right_child.get_type():
        raise TypeError("in node: \n" + node.__repr__() + "\nTwo exprs must have same type.")
    elif left_child.get_type() == Type.double:
        expr_float_cmp(left_child_address, right_child_address, 'lt')
    elif left_child.get_type() == Type.int:
        left_child_address.load()
        emit_move("$s1", "$s0")
        right_child_address.load()
        emit("slt $s0, $s1, $s0")
    else:
        raise TypeError("in node: \n" + node.__repr__() + "\nExprs' type isn't comparable.")

    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, Type.bool)
    node.get_address().store()
    return node


def cgen_expr_leq(node):
    emit_comment('cgen_expr_leq')
    stack_handler.add_checkpoint()
    node = cgen_expr_le(node)
    node.get_address().load()
    emit_move("$s2", "$s0")

    stack_handler.back_to_last_checkpoint()

    node = cgen_expr_equal(node)
    node.get_address().load()
    emit("or $s0, $s0, $s2")
    node.get_address().store()
    return node


def expr_add_sub(node, operation):
    # operation = 'add' or 'sub'
    stack_handler.add_checkpoint()
    left_child = cgen_expr(node.ref_child[0])
    right_child = cgen_expr(node.ref_child[2])
    left_child_type = left_child.get_type()

    left_child_address = left_child.get_address()
    right_child_address = right_child.get_address()

    if left_child_type != right_child.get_type() or left_child_type not in (Type.double, Type.int):
        raise TypeError(
            "in node: \n" + node.__repr__() + "\n exprs' types are not good for " + operation + " operation.")
    elif left_child_type == Type.int:
        left_child_address.load()
        emit("move $s1, $s0")
        right_child_address.load()
        emit(operation + " $s0, $s1, $s0")
    elif left_child_type == Type.double:
        left_child_address.load()
        emit("mov.s $f2, $f0")
        right_child_address.load()
        emit(operation + ".s $f0, $f2, $f0")

    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, left_child_type)
    node.get_address().store()
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
    left_child_type = left_child.get_type()

    left_child_address = left_child.get_address()
    right_child_address = right_child.get_address()

    if left_child_type != right_child.get_type() or left_child_type not in (Type.double, Type.int) or (
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
        emit("mov.s $f2, $f0")
        right_child_address.load()
        emit(operation + ".s $f0, $f2, $f0")

    stack_handler.back_to_last_checkpoint()
    expr_set_node_attributes(node, left_child_type)
    node.get_address().store()
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
