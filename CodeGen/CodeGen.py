from CodeGen.Expr import cgen_expr, expr_set_node_attributes
from CodeGen.Utils import emit_comment, create_label, emit_load, emit_addi, emit_data, emit_label, emit_load_double, \
    emit_li, emit_move, emit_jump, emit_syscall, emit
import CodeGen.Utils as ut
from CodeGen.Utils import AttName, Address, align_stack, Type
from CodeGen.Error import error, TypeError


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
    cgen_stmt(stmt1)
    align_stack(top)
    emit_jump(l2)
    emit_label(l1)
    cgen_stmt(stmt2)
    align_stack(top)
    emit_label(l2)
    return


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
    return


# get type of a type node
def get_type(node):
    # node = parseTree.nodes[type_id]
    # type_pri_id = node.child[0]
    # node = parseTree.node[type_pri_id]
    # type_id_direct = node.child[0]
    # node = parseTree.nodes[type_id_direct]
    type_pri = node.ref_child[0].ref_child[0].data
    if len(node.ref_child) == 1:
        return False, type_pri
    else:
        return True, type_pri, len(node.ref_child) - 1


def get_name(node):
    # node = parseTree.nodes[ident_id]
    # ident_id_direct = node.child[0]
    # node = parseTree.nodes[ident_id_direct]
    return node.ref_child[0].data
    pass


def cgen_variable(node):
    emit_comment('cgen_variable')
    # node = parseTree.node[variable_id]
    # type_id = node.child[0]
    # ident_id = node.child[1]
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

    if type == "double":
        ut.disFp -= 8
        emit("addi $sp, $sp, -8")
    else:
        ut.disFp -= 4
        emit("addi $sp, $sp, -4")
    return


def cgen_if(node):
    emit_comment('cgen_if')
    length = len(node.ref_child)
    if length == 2:
        cgen_if2(node.ref_child[0], node.ref_child[1])
    elif length == 3:
        cgen_if1(node.ref_child[0], node.ref_child[1], node.ref_child[2])
    else:
        error(
            "An illegal pattern used in if statement!"
        )


def cgen_print_stmt(node):
    emit_comment('cgen_print_stmt')
    top = ut.disFp

    for child in node.ref_child:
        expr = cgen_expr(child)
        address = expr.attribute[AttName.address]
        type = expr.attribute[AttName.type]
        address.load_address()
        if type == "double":
            emit_load_double("$f12", "$s0")
            emit_li("$v0", 3)
            emit_syscall()
        elif type == "string":
            emit_load("$a0", "$s0")
            emit_li("$v0", 4)
            emit_syscall()
        else:  # TODO {keivan} type haye bad ro check nakardi (mesl bool)!
            emit_load("$a0", "$s0")
            emit_li("$v0", 1)
            emit_syscall()

        align_stack(top)
        emit('la $a0, space')
        emit_li('$v0', 4)
        emit_syscall()

    emit('la $a0, newLine')
    emit_li("$v0", 4)
    emit_syscall()


def cgen_stmt(node):
    emit_comment('cgen_stmt')

    child = node.ref_child[0]
    top = ut.disFp

    if child.data == "stmt":
        cgen_stmt(child)
    elif child.data == "forstmt":
        cgen_for(child)
    elif child.data == "whilestmt":
        cgen_while(child)
    elif child.data == "ifstmt":
        cgen_if(child)
    elif child.data == "stmtblock":
        cgen_stmt_block(child)
    elif child.data == "expr":
        cgen_expr(child)
        align_stack(top)
    elif child.data == "breakstmt":
        cgen_break(child)
    elif child.data == "printstmt":
        cgen_print_stmt(child)


# TODO cgen_return_stmt


def cgen_stmt_block(node):
    emit_comment('cgen_stmt_block')
    ut.symbolTable.add_scope()
    top = ut.disFp

    for child_node in node.ref_child:
        if child_node.data == "variabledecl":
            cgen_variable_decl(child_node)
        else:
            cgen_stmt(child_node)

    align_stack(top)

    ut.symbolTable.remove_scope()


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


def cgen(parseTree):
    emit('.text')
    emit('main: addi $fp, $sp, -4')  # TODO
    cgen_stmt_block(parseTree.nodes[0].ref_child[0].ref_child[0].ref_child[3])
    emit('li $v0, 10')
    emit_syscall()
    ut.print_data_section()
