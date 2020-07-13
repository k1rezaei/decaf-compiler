from codegen.grammar import parseTree
from codegen.Utils import Variable, Address, SymbolTable
from codegen.parsetree import Node
from codegen.Error import error

used_labels = 1
disFp = -4

symbolTable = SymbolTable(False)


def create_label(num):
    arr = []
    while num != 0:
        s = num % 27
        num //= 27
        arr.append(chr(s + ord('A')))
    arr.append("_")
    return "".join(arr)[::-1]


def emit(st):
    print(st)


def cgen_if1(expr, stmt1, stmt2):
    global used_labels, disFp
    l1 = create_label(used_labels)
    l2 = create_label(used_labels + 1)
    used_labels += 2
    top = disFp
    t1 = cgen_expr(expr)
    if t1.type != 'bool':  ##TODO {sharifi} In bayad bere attribute --> .attribute["type"]
        print("Error")
        exit(2)
    emit("lw $t0, " + t1.to_str())  ##TODO {sharifi} attribute
    emit("addi $sp, $sp, " + str(top - disFp))
    emit("beqz $t0, " + l1)
    cgen_stmt(stmt1)
    emit("addi $sp, $sp, " + str(top - disFp))
    emit("j " + l2)
    emit(l1 + ":")
    cgen_stmt(stmt2)
    emit("addi $sp, $sp, " + str(top - disFp))
    emit(l2 + ":")
    return


def cgen_if2(expr, stmt):
    global used_labels, disFp
    l1 = create_label(used_labels)
    used_labels += 1
    top = disFp
    t1 = cgen_expr(expr)
    if t1.type != 'bool':  ##TODO {sharifi} attribute
        print("Error")
        exit(2)
    emit("lw $t0, " + t1.to_str())  ##TODO {sharifi} attribute
    emit("addi $sp, $sp, " + str(top - disFp))
    emit("beqz $t0, " + l1)
    cgen_stmt(stmt)
    emit("addi $sp, $sp, " + str(top - disFp))
    emit(l1 + ":")
    return


def cgen_while(node):
    global used_labels, disFp
    expr = parseTree.nodes[node].child[0]
    stmt = parseTree.nodes[node].child[1]
    top = disFp
    l1 = create_label(used_labels)
    l2 = create_label(used_labels + 1)
    parseTree.nodes[node].attribute = l2
    used_labels += 2
    used_labels += 1
    t = cgen_expr(expr)
    if t.type != 'bool':  ##TODO {sharifi} attribute
        print("Error!")
        exit(2)
    emit(l1 + ":")
    emit("lw $t0, " + t.to_str())  ##TODO {sharifi} attribute
    emit("addi $sp, $sp, " + str(top - disFp))
    emit("beqz $t0, " + l2)
    cgen_stmt(stmt)
    emit("addi $sp, $sp, " + str(top - disFp))
    emit("j " + l1)
    emit(l2 + ":")
    return


def cgen_for(node):
    nod = parseTree.nodes[node]
    expr1 = nod.child[0]
    expr2 = nod.child[1]
    expr3 = nod.child[2]
    stm = nod.child[3]
    global used_labels, disFp
    top = disFp
    l1 = create_label(used_labels)
    l2 = create_label(used_labels + 1)
    parseTree.nodes[node].attribute["ex_label"] = l2
    parseTree.nodes[node].attribute["st_label"] = l1
    used_labels += 2
    cgen_expr(expr1)
    if top != disFp:
        emit("addi $sp, $sp, " + str(top - disFp))
    emit(l1 + ":")
    t = cgen_expr(expr2)
    if t.type != 'bool':
        print("Error!")
        exit(2)
    emit("lw $t0, " + t.to_str())  ##TODO {sharifi} attribute  
    if top != disFp:
        emit("addi $sp, $sp, " + str(top - disFp))
    emit("beqz $t0, " + l2)
    cgen_stmt(stm)
    if top != disFp:
        emit("addi $sp, $sp, " + str(top - disFp))
    cgen_expr(expr3)
    if top != disFp:
        emit("addi $sp, $sp, " + str(top - disFp))
    emit("j " + l1)
    emit(l2 + ":")
    return


# get type of a type node
def get_type(type_id):
    node = parseTree.nodes[type_id]
    type_pri_id = node.child[0]
    node = parseTree.node[type_pri_id]
    type_id_direct = node.child[0]
    node = parseTree.nodes[type_id_direct]
    return node.data
    pass


def get_name(ident_id):
    node = parseTree.nodes[ident_id]
    ident_id_direct = node.child[0]
    node = parseTree.nodes[ident_id_direct]
    return node.data
    pass


def cgen_variable(variable_id):
    global disFp, symbolTable
    node = parseTree.node[variable_id]
    type_id = node.child[0]
    ident_id = node.child[1]
    type = get_type(type_id)
    name = get_name(ident_id)
    symbolTable.add_variable(type, name)
    if type == "double":
        disFp -= 4
    else:
        disFp -= 8
    return


def cgen_variable_decl(node_id):
    node = parseTree.nodes[node_id]
    variable_id = node.child[0]
    cgen_variable(variable_id)


def cgen_expr_add(node):
    pass


def cgen_readline(node):
    pass


def cgen_readint(node):
    pass


def cgen_call(node):
    pass


def cgen_this(node):
    pass


def cgen_lvalue(node):
    pass


def cgen_constant(node):
    pass


def cgen_expr_not(node):
    pass


def cgen_expr_neg(node):
    pass


def cgen_expr_new(node):
    pass


def cgen_newarray(node):
    pass


def cgen_expr_assign(node):
    pass


def cgen_expr_bitor(node):
    pass


def cgen_expr_bitand(node):
    pass


def cgen_expr_equal(node):
    pass


def cgen_expr_grq(node):
    pass


def cgen_expr_gr(node):
    pass


def cgen_expr_le(node):
    pass


def cgen_expr_leq(node):
    pass


def cgen_expr_sub(node):
    pass


def cgen_expr_mul(node):
    pass


def cgen_expr_div(node):
    pass


def cgen_expr_mod(node):
    pass


def cgen_expr(node_id):
    node = parseTree.nodes[node_id]

    if len(node.child) == 1:
        child = node.ref_child[0]

        if child.data == 'expr':
            return cgen_expr(node.child[0])
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
        elif child.data == 'not':
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
                return cgen_expr(node.child[0])
            elif left_child.data == 'newarray':
                return cgen_newarray(node)

    return Node("", 0)


def cgen_if(if_id):
    node = parseTree.nodes[if_id]
    length = len(node.child)
    if length == 2:
        cgen_if2(node.child[0], node.child[1])
    elif length == 3:
        cgen_if1(node.child[0], node.child[1], node.child[2])
    # TODO {sharifi} mage bazam halat dare?


def cgen_stmt(node_id):
    node = parseTree.nodes[node_id]
    child_id = node.child[0]
    child = parseTree.nodes[child_id]

    if child.data is "stmt":
        cgen_stmt(child_id)
    elif child.data is "forstmt":
        cgen_for(child_id)
    elif child.data is "whilestmt":
        cgen_while(child_id)
    elif child.data is "ifstmt":
        cgen_if(child_id)
    elif child.data is "stmtblock":
        cgen_stmt_block(child_id)
    elif child.data is "expr":
        cgen_expr(child_id)
    elif child.data is "breakstmt":
        cgen_break(child_id)
    # TODO cgen_print_stmt, cgen_return_stmt


def cgen_stmt_block(node_id):
    global symbolTable
    symbolTable.add_scope()
    node = parseTree.nodes[node_id]

    global disFp
    top = disFp

    for id in node.child:
        child_node = parseTree.nodes[id]
        if child_node.data is "variabledecl":
            cgen_variable_decl(child_node)
        else:
            cgen_stmt(child_node)

    if top != disFp:
        emit("addi $sp, $sp, " + str(top - disFp))

    symbolTable.remove_scope()


def cgen_break(node):
    parent = parseTree.nodes[node].parent
    while parent is not None:
        data = parseTree.nodes[parent].data
        if data == "whilestmt" or data == "forstmt":
            break
        parent = parseTree.nodes[parent].parent

    if parent is None:
        print("Erro!")
        exit(2)

    emit("j " + parseTree.nodes[node].attribute["ex_label"])
    return
