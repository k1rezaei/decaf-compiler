import Utils as ut
from Error import error, TypeError, FunctionError
from Expr import cgen_expr
from Utils import AttName, align_stack, Type
from Utils import ClassAnalyzer, ClassDecl, Variable
from Utils import FunctionDecl
from Utils import emit_btoi, emit_itob, emit_dtoi, emit_itod, emit_array_length
from Utils import emit_comment, create_label, emit_load, emit_addi, emit_label, \
    emit_load_double, \
    emit_li, emit_move, emit_jump, emit_syscall, emit


def cgen_if1(expr, stmt1, stmt2):
    emit_comment('cgen_if1')
    l1 = create_label()
    l2 = create_label()
    top = ut.disFp
    t1 = cgen_expr(expr)
    if t1.attribute[AttName.type] != Type.bool:
        raise TypeError(
            "error in node " + str(expr) + "\n type of the decision statement must be bool!"
        )
    t1.attribute[AttName.address].load_address()
    emit_load("$t0", "$s0")
    align_stack(top)
    emit("beqz $t0, " + l1)
    st1 = cgen_stmt(stmt1)
    ret = 0
    if st1.attribute[AttName.has_return]:
        ret += 1
    align_stack(top)
    emit_jump(l2)
    emit_label(l1)
    st2 = cgen_stmt(stmt2)
    if st2.attribute[AttName.has_return]:
        ret += 1
    align_stack(top)
    emit_label(l2)
    return ret


def cgen_if2(expr, stmt):
    emit_comment('cgen_if2')
    l1 = create_label()
    top = ut.disFp
    t1 = cgen_expr(expr)
    if t1.attribute[AttName.type] != Type.bool:
        raise TypeError(
            "error in node " + str(expr) + "\n type of the decision statement must be bool!"
        )
    t1.attribute[AttName.address].load_address()
    emit_load("$t0", "$s0")
    align_stack(top)
    emit("beqz $t0, " + l1)
    cgen_stmt(stmt)
    align_stack(top)
    emit_label(l1)
    return


def cgen_while(node):
    emit_comment('cgen_while')
    expr = node.ref_child[0]
    stmt = node.ref_child[1]
    top = ut.disFp
    l1 = create_label()
    l2 = create_label()
    node.attribute[AttName.exit_label] = l2
    emit_label(l1)
    t = cgen_expr(expr)
    if t.attribute[AttName.type] != Type.bool:
        raise TypeError(
            "error in node " + str(node) + "\n type of the decision statement must be bool!"
        )
    t.attribute[AttName.address].load_address()
    emit_load("$t0", "$s0")
    align_stack(top)
    emit("beqz $t0, " + l2)
    cgen_stmt(stmt)
    align_stack(top)
    emit_jump(l1)
    emit_label(l2)

    emit_li("$t6", top)
    ut.emit_add("$t6", "$t6", "$fp")
    emit_move("$sp", "$t6")
    return


def cgen_for(node):
    emit_comment('cgen_for')
    expr1 = node.ref_child[0]
    expr2 = node.ref_child[1]
    expr3 = node.ref_child[2]
    stmt = node.ref_child[3]
    top = ut.disFp
    l1 = create_label()
    l2 = create_label()
    node.attribute[AttName.exit_label] = l2
    if expr1.data != "nothing":
        cgen_expr(expr1)
    align_stack(top)
    emit_label(l1)
    t = cgen_expr(expr2)
    if t.attribute[AttName.type] != Type.bool:
        raise TypeError(
            "error in node " + str(node) + "\n type of the decision statement must be bool!"
        )
    t.attribute[AttName.address].load_address()
    emit_load("$t0", "$s0")
    align_stack(top)
    emit("beqz $t0, " + l2)
    cgen_stmt(stmt)
    align_stack(top)
    if expr3.data != "nothing":
        cgen_expr(expr3)
    align_stack(top)
    emit_jump(l1)
    emit_label(l2)

    emit_li("$t6", top)
    ut.emit_add("$t6", "$t6", "$fp")
    emit_move("$sp", "$t6")

    return


# get type of a type node
def get_type(node):
    if node.data == 'void':
        return 'void'
    type_pri = node.ref_child[0].ref_child[0].data
    if type_pri == 'ident':
        type_pri = node.ref_child[0].ref_child[0].ref_child[0].data
    if type_pri == 'ident':
        raise TypeError("type_pri is 'ident'")
    if len(node.ref_child) == 1:
        return False, type_pri
    else:
        return True, type_pri, len(node.ref_child) - 1


def get_name(node):
    return node.ref_child[0].data


def cgen_variable(node):
    emit_comment('cgen_variable')
    type = get_type(node.ref_child[0])
    name = get_name(node.ref_child[1])
    return name, type


def cgen_variable_decl(node):
    emit_comment('cgen_variable_decl')
    name, type = cgen_variable(node.ref_child[0])
    if type[0]:
        type = type[1:]
        ut.symbolTable.add_variable(type, name, True)
    else:
        type = type[1]
        ut.symbolTable.add_variable(type, name)

    ut.disFp -= 4
    emit("addi $sp, $sp, -4")


def cgen_global_variable(node):
    emit_comment('cgen_variable_decl')
    name, type = cgen_variable(node.ref_child[0])
    if type[0]:
        type = type[1:]
        ut.globalSymbolTable.add_variable(type, name, True, global_=True)
    else:
        type = type[1]
        ut.globalSymbolTable.add_variable(type, name, global_=True)


def cgen_function_decl(node, label, is_member_function=False, class_name=''):
    emit_label(label)
    ut.symbolTable = ut.SymbolTable(is_member_function)
    for i in range(len(node.ref_child[2].ref_child) - 1, -1, -1):
        name, type = cgen_variable(node.ref_child[2].ref_child[i])
        if type[0]:
            type = type[1:]
            ut.symbolTable.add_param(type, name, True)
        else:
            type = type[1]
            ut.symbolTable.add_param(type, name)

    if is_member_function:
        name = 'this'
        type = class_name
        ut.symbolTable.add_param(type, name)
        ut.this_type = class_name
    else:
        ut.this_type = None

    ut.symbolTable.finish_params()
    ut.disFp = 0
    emit_move('$fp', '$sp')
    ret = cgen_stmt_block(node.ref_child[3])
    emit_move("$sp", "$fp")
    emit("jr $ra")
    # if not ret.attribute[AttName.has_return] and (node.ref_child[0].data != "void") and (label != "_____main"):
    #     raise ReturnWarning(
    #         "Function in node " + str(node) + " return anything in a path!"
    #     )
    return


def cgen_if(node):
    emit_comment('cgen_if')
    length = len(node.ref_child)
    if length == 2:
        cgen_if2(node.ref_child[0], node.ref_child[1])
        node.attribute[AttName.has_return] = False
    elif length == 3:
        ret = cgen_if1(node.ref_child[0], node.ref_child[1], node.ref_child[2])
        node.attribute[AttName.has_return] = (ret == 2)
    else:
        error(
            "An illegal pattern used in if statement!"
        )
    return node


def print_double():
    l1 = create_label()
    l2 = create_label()
    emit('la $s0, __epsilon')
    emit('l.s $f1, 0($s0)')
    emit('abs.s $f7, $f0')
    emit('c.eq.s $f7, $f0')
    emit('bc1t ' + l1)
    emit('sub.s $f0, $f0, $f1')
    emit_jump(l2)
    emit_label(l1)
    emit('add.s $f0, $f0, $f1')
    emit_label(l2)
    emit('cvt.w.s $f1, $f0')
    emit('mfc1 $a0, $f1')
    emit_li('$v0', 1)
    emit_syscall()
    emit('la $a0, __dot')
    emit_li('$v0', 4)
    emit_syscall()
    emit('abs.s $f0, $f0')
    emit('cvt.w.s $f1, $f0')
    emit('cvt.s.w $f1, $f1')
    emit('sub.s $f0, $f0, $f1')
    emit('la $s0, __ten')
    emit('l.s $f3, 0($s0)')
    for i in range(4):
        emit('mul.s $f0, $f0, $f3')
        emit('cvt.w.s $f1, $f0')
        emit('mfc1 $a0, $f1')
        emit('cvt.s.w $f1, $f1')
        emit('sub.s $f0, $f0, $f1')
        emit_li('$v0', 1)
        emit_syscall()


def cgen_print_stmt(node):
    emit_comment('cgen_print_stmt')
    top = ut.disFp

    for child in node.ref_child:
        expr = cgen_expr(child)
        address = expr.attribute[AttName.address]
        type = expr.attribute[AttName.type]
        address.load_address()
        if type == Type.double:
            emit_load_double("$f12", "$s0")
            emit_li("$v0", 2)
            emit_syscall()
            #print_double()
        elif type == "string":
            emit_load("$a0", "$s0")
            emit_li("$v0", 4)
            emit_syscall()
        elif type == Type.bool:
            l1 = create_label()
            l2 = create_label()
            emit_load('$s0', '$s0')
            emit('beqz $s0, ' + l1)
            emit('la $a0, __true')
            emit_jump(l2)
            emit_label(l1)
            emit('la $a0, __false')
            emit_label(l2)
            emit_li("$v0", 4)
            emit_syscall()
        else:
            emit_load("$a0", "$s0")
            emit_li("$v0", 1)
            emit_syscall()

        align_stack(top)

    emit('la $a0, __newLine')
    emit_li("$v0", 4)
    emit_syscall()


def cgen_stmt(node):
    emit_comment('cgen_stmt')

    child = node.ref_child[0]
    top = ut.disFp

    if child.data == "stmt":
        ret = cgen_stmt(child)
        node.attribute[AttName.has_return] = ret.attribute[AttName.has_return]
    elif child.data == "forstmt":
        cgen_for(child)
        node.attribute[AttName.has_return] = False
    elif child.data == "whilestmt":
        cgen_while(child)
        node.attribute[AttName.has_return] = False
    elif child.data == "ifstmt":
        ret = cgen_if(child)
        node.attribute[AttName.has_return] = ret.attribute[AttName.has_return]
    elif child.data == "stmtblock":
        ret = cgen_stmt_block(child)
        node.attribute[AttName.has_return] = ret.attribute[AttName.has_return]
    elif child.data == "expr":
        cgen_expr(child)
        align_stack(top)
        node.attribute[AttName.has_return] = False
    elif child.data == "breakstmt":
        cgen_break(child)
        node.attribute[AttName.has_return] = False
    elif child.data == "printstmt":
        cgen_print_stmt(child)
        node.attribute[AttName.has_return] = False
    elif child.data == "returnstmt":
        ret = cgen_return_stmt(child)
        node.attribute[AttName.has_return] = ret

    return node


def cgen_return_stmt(node):
    # checking validity of statement
    func = node.ref_parent
    while func is not None and func.data != "functiondecl":
        func = func.ref_parent

    # return isn't in any function!
    if func is None:
        raise FunctionError(
            "Error in return node " + str(node) + ", return node must be use in a funcion!"
        )

    # return for void functions
    if node.ref_child[0].data == "nothing":
        if func.ref_child[0].data == "void":
            emit_move("$sp", "$fp")
            emit("jr $ra")
            return
        else:
            raise TypeError(
                "Error in return statement for function in node" + str(func) + ", function type must be void"
            )

    # return for non void functions
    type = get_type(func.ref_child[0])  # type of parent function
    expr = cgen_expr(node.ref_child[0])  # expr node of return

    # checking equality of types
    # if not type[0]:  # type isn't array
    #     if type[1] != expr.attribute[AttName.type]:
    #         raise TypeError(
    #             "Error in return statement in node" + str(node) + ", type of function and return isn't match!"
    #         )
    # else:  # type is array
    #     if type[1] != expr.attribute[AttName.array_member_type]:  # checking type of members
    #         raise TypeError(
    #             "Error in return statement in node" + str(node) + ", type of function and returned array isn't match!"
    #         )
    #     if type[2] != expr.attribute[AttName.array_dim]:  # checking dimension
    #         raise TypeError(
    #             "Error in return statement in node" + str(node) +
    #             ", dimension of returned array isn't match to function array dimension!"
    #         )

    # load return statement to $v0 and jump to callee
    expr.attribute[AttName.address].load()
    emit_move("$v0", "$s0")
    emit_move("$sp", "$fp")
    emit("jr $ra")

    return node.ref_child[0].data != "nothing"


def cgen_stmt_block(node):
    emit_comment('cgen_stmt_block')
    ut.symbolTable.add_scope()
    top = ut.disFp
    node.attribute[AttName.has_return] = False

    for child_node in node.ref_child:
        if child_node.data == "variabledecl":
            cgen_variable_decl(child_node)
        else:
            ret = cgen_stmt(child_node)
            if ret.attribute[AttName.has_return]:
                node.attribute[AttName.has_return] = True

    align_stack(top)

    ut.symbolTable.remove_scope()
    return node


def cgen_break(node):
    emit_comment('cgen_break')
    parent = node.ref_parent
    while parent is not None:
        data = parent.data
        if data == "whilestmt" or data == "forstmt":
            break
        parent = parent.ref_parent

    if parent is None:
        error("Error in break statement, break isn't in a loop!")

    emit_jump(parent.attribute[AttName.exit_label])
    return


def init_built_in():
    ### double itod(int)
    f_btoi = FunctionDecl('int', ['bool'], 'btoi', '___btoi')
    f_itob = FunctionDecl('bool', ['int'], 'itob', '___itob')
    f_dtoi = FunctionDecl('int', ['double'], 'dtoi', '___dtoi')
    f_itod = FunctionDecl('double', ['int'], 'itod', '___itod')

    ut.function_handler.add_function(f_btoi)
    ut.function_handler.add_function(f_itob)
    ut.function_handler.add_function(f_dtoi)
    ut.function_handler.add_function(f_itod)

    emit_array_length()
    emit_btoi()
    emit_itob()
    emit_dtoi()
    emit_itod()


def init_global_variables(start):
    for decl in start.ref_child:
        child = decl.ref_child[0]
        if child.data == "variabledecl":
            cgen_global_variable(child)


def init_functions(start):
    init_built_in()
    for decl in start.ref_child:
        child = decl.ref_child[0]
        if child.data == "functiondecl":
            function_decl = parse_function(child)
            ut.function_handler.add_function(function_decl)

    it = 4
    for decl in start.ref_child:
        child = decl.ref_child[0]
        if child.data == "functiondecl":
            function_decl = ut.function_handler.functions[it]
            if function_decl.name == 'main':
                cgen_function_decl(child, '_____main')
            else:
                cgen_function_decl(child, function_decl.label)
            it = it + 1


def get_formals(formal_node):
    types = []
    for variable in formal_node.ref_child:
        type = get_type(variable.ref_child[0])
        if len(type) > 2:
            types.append(type[1:])
        else:
            types.append(type[1])
    return types


def init_class_decls(start):
    class_nodes = dict()
    for decl in start.ref_child:
        child = decl.ref_child[0]
        if child.data == 'classdecl':
            class_name = get_name(child.ref_child[0])
            class_nodes[class_name] = child

    for _class in ut.class_analyzer.topological_sort():
        class_name = _class.name
        class_decl = ClassDecl(class_name)
        par_name = ut.class_analyzer.parent(class_name)
        if par_name is not None:
            class_decl.set_parent_variables(ut.class_handler.get_class_decl(par_name).variables)
            class_decl.set_parent_functions(ut.class_handler.get_class_decl(par_name).functions)

        class_node = class_nodes[class_name]
        for field in class_node.ref_child:
            if field.data != 'field':
                continue
            decl = field.ref_child[0]
            if decl.data == 'variabledecl':
                variable = decl.ref_child[0]

                type = get_type(variable.ref_child[0])
                name = get_name(variable.ref_child[1])
                is_array = type[0]

                if len(type) > 2:
                    type = type[1:]
                else:
                    type = type[1]

                class_decl.add_variable(Variable(name, type, -1, is_array))

        ut.class_handler.add_class_decl(class_decl)
        for field in class_node.ref_child:
            if field.data != 'field':
                continue
            decl = field.ref_child[0]
            if decl.data == 'functiondecl':
                function_decl = parse_function(decl)
                function_decl.label = class_decl.name + "__" + function_decl.name

                class_decl.add_function(function_decl)
                # cgen_function_decl(decl, function_decl.label, True, class_decl.name)

    '''for class_decl in ut.class_handler.class_decls:
        print(class_decl.name)
        for variable in class_decl.variables:
            print(variable.type, variable.name, variable.address, variable.is_array)

    print(ut.class_handler.get_variable('E', 'b').address)
    '''


def parse_function(decl):
    return_node = decl.ref_child[0]
    return_type = get_type(return_node)

    if len(return_type) > 2:
        return_type = return_type[1:]
    else:
        return_type = return_type[1]

    id_node = decl.ref_child[1]
    func_name = get_name(id_node)

    formal_node = decl.ref_child[2]
    input_types = get_formals(formal_node)

    function_decl = FunctionDecl(return_type, input_types, func_name, create_label())
    return function_decl


def init_member_functions(start):
    class_nodes = dict()
    for decl in start.ref_child:
        child = decl.ref_child[0]
        if child.data == 'classdecl':
            class_name = get_name(child.ref_child[0])
            class_nodes[class_name] = child

    for _class in ut.class_analyzer.topological_sort():
        class_name = _class.name
        class_decl = ut.class_handler.get_class_decl(class_name)
        class_node = class_nodes[class_name]
        for field in class_node.ref_child:
            if field.data != 'field':
                continue
            decl = field.ref_child[0]
            if decl.data == 'functiondecl':
                function_decl = parse_function(decl)
                function_decl.label = class_decl.name + "__" + function_decl.name

                cgen_function_decl(decl, function_decl.label, True, class_decl.name)



def cgen(parseTree):
    ut.class_analyzer = ClassAnalyzer(parseTree)
    emit('.text')
    emit('j main')
    init_global_variables(parseTree.nodes[0])
    init_class_decls(parseTree.nodes[0])
    init_functions(parseTree.nodes[0])
    init_member_functions(parseTree.nodes[0])
    emit("main: move $t8, $sp")
    emit_addi("$sp", "$sp", str(- 4 * (len(ut.globalSymbolTable.variables) + 1)))
    ut.fill_vtable()
    emit('jal _____main')
    emit_li('$v0', 10)
    emit_syscall()
    emit('')
    ut.add_vtables()
    ut.print_data_section()
