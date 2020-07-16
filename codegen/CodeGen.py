from codegen import Expr
from codegen.Utils import SymbolTable
from codegen.grammar import parseTree

used_labels = 1
disFp = -4  ### always we have $sp = $fp + disFp.

symbolTable = SymbolTable(False)


def emit_jump(label):
    emit("j " + label)


def emit_label(label):
    emit(label + " :")


def emit_load(dst, src, offset=0):
    emit("lw " + dst + ", " + str(offset) + "(" + src + ")")


def emit_load_double(dst, src, offset=0):
    emit("l.d " + dst + ", " + str(offset) + "(" + src + ")")


def emit_li(dst, val):
    emit("li " + dst + ", " + str(val))


def emit_syscall():
    emit("syscall")


data_section = '''.data
null:
    .space 8

'''


def emit_data(label, input):
    global data_section
    data_section += '    ' + label + ':\n' + input + '\n'


def print_data_section():
    global data_section
    print(data_section)


def align_stack(top):
    global disFp
    if top != disFp:
        emit("addi $sp, $sp, " + str(top - disFp))
        disFp = top


def create_label():
    global used_labels
    num = used_labels
    arr = []
    while num != 0:
        s = num % 27
        num //= 27
        arr.append(chr(s + ord('A')))
    arr.append("_")
    used_labels += 1
    return "".join(arr)[::-1]


def emit(st):
    print(st)


def cgen_if1(expr, stmt1, stmt2):
    global disFp
    l1 = create_label()
    l2 = create_label()
    top = disFp
    t1 = cgen_expr(expr)
    if t1.attribute["type"] != "bool":
        print("Error")
        exit(2)
    t1.attribute["address"].load_address()
    emit("lw $t0, 0($s0)")
    align_stack(top)
    emit("beqz $t0, " + l1)
    cgen_stmt(stmt1)
    align_stack(top)
    emit("j " + l2)
    emit(l1 + ":")
    cgen_stmt(stmt2)
    align_stack(top)
    emit(l2 + ":")
    return


def cgen_if2(expr, stmt):
    global disFp
    l1 = create_label()
    top = disFp
    t1 = cgen_expr(expr)
    if t1.attribute["type"] != 'bool':
        print("Error")
        exit(2)
    t1.attribute["address"].load_address()
    emit("lw $t0, 0($s0)")
    align_stack(top)
    emit("beqz $t0, " + l1)
    cgen_stmt(stmt)
    align_stack(top)
    emit(l1 + ":")
    return


def cgen_while(node):
    global disFp
    expr = parseTree.nodes[node].child[0]
    stmt = parseTree.nodes[node].child[1]
    top = disFp
    l1 = create_label()
    l2 = create_label()
    parseTree.nodes[node].attribute["ex_label"] = l2
    t = cgen_expr(expr)
    if t.attribute["type"] != 'bool':
        print("Error!")
        exit(2)
    emit(l1 + ":")
    t.attribute["address"].load_address()
    emit("lw $t0, 0($s0)")
    align_stack(top)
    emit("beqz $t0, " + l2)
    cgen_stmt(stmt)
    align_stack(top)
    emit("j " + l1)
    emit(l2 + ":")
    return


def cgen_for(node):
    nod = parseTree.nodes[node]
    expr1 = nod.child[0]
    expr2 = nod.child[1]
    expr3 = nod.child[2]
    stm = nod.child[3]
    global disFp
    top = disFp
    l1 = create_label()
    l2 = create_label()
    parseTree.nodes[node].attribute["ex_label"] = l2
    cgen_expr(expr1)
    align_stack(top)
    emit(l1 + ":")
    t = cgen_expr(expr2)
    if t.attribute["type"] != 'bool':
        print("Error!")
        exit(2)
    t.attribute["address"].load_address()
    emit("lw $t0, 0($s0)")
    align_stack(top)
    emit("beqz $t0, " + l2)
    cgen_stmt(stm)
    align_stack(top)
    cgen_expr(expr3)
    align_stack(top)
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
    node = parseTree.node[variable_id]
    type_id = node.child[0]
    ident_id = node.child[1]
    type = get_type(type_id)
    name = get_name(ident_id)
    return name, type


def cgen_variable_decl(node_id):
    global disFp, symbolTable
    node = parseTree.nodes[node_id]
    variable_id = node.child[0]
    name, type = cgen_variable(variable_id)
    symbolTable.add_variable(type, name)
    if type == "double":
        disFp -= 8
        emit("addi $sp, $sp, -8")
    else:
        disFp -= 4
        emit("addi $sp, $sp, -4")
    return


def cgen_readline(node):  # after calling this function address of the string is in $S0
    emit("addi $s3, $sp, 0")  # $s3 saves top of stack
    emit_li("$v0", 8)
    emit_li("$a1", 1)  # length of read (1 byte)
    emit_li("$s1", ord("\n"))
    l1 = create_label()
    l2 = create_label()
    emit_label(l1)
    emit("addi $sp, $sp, -1")
    emit("addi $a0, $sp, 0")
    emit_syscall()  # read one char and store in top of stack
    emit("lbu $s0, 0($sp)")
    emit("bneq $s0, $s1, " + l1)  # check the end of line
    emit("sub $a0, $s3, $sp")
    emit("addi $a0, $a0, 1")  # amount ot get memory
    emit_li("$v0", 9)
    emit_syscall()  # first of allocated memory is in $v0
    emit("addi $v1, $v0, 0")  # store address of string in v1 (don't change this reg!)
    emit("addi $a0, $a0, -1")
    emit("addi $sp, $s3, -1")
    emit_label(l2)
    emit("lbu $s0, 0($sp)")
    emit("sb $s0, 0($v0)")
    emit("addi $v0, $v0, 1")
    emit("addi $sp, $sp, -1")
    emit("addi $a0, $a0, -1")
    emit("bnez $a0, l2")  # check that all characters have benn writen
    # TODO : store a zero character at "0($v0)". I don't know how to do it.
    emit("addi $s0, $v1, 0")
    emit("addi $sp, $s3, 0")
    node.attribute["type"] = "string"
    return node


def cgen_readint(node):
    global disFp
    disFp -= 4
    emit("li $v0, 5")
    emit("syscall")
    emit("sw $v0, " + str(disFp) + "($fp)")
    emit("addi $s0, $fp, " + str(disFp))
    node.attribute["type"] = "integer"
    return node


def cgen_if(if_id):
    node = parseTree.nodes[if_id]
    length = len(node.child)
    if length == 2:
        cgen_if2(node.child[0], node.child[1])
    elif length == 3:
        cgen_if1(node.child[0], node.child[1], node.child[2])
    # TODO {sharifi} mage bazam halat dare? : bara mohkam kariye


def cgen_print_stmt(print_id):
    global disFp
    top = disFp

    node = parseTree.nodes[print_id]
    for child_id in node.child:
        expr = cgen_expr(child_id)
        address = expr.attribute["address"]
        type = expr.attribute["type"]
        address.load_address()
        if type is "double":
            emit_load_double("$f12", "$s0")
            emit_li("$v0", 3)
            emit_syscall()
        elif type is "string":  ## TODO {keivan} is it correct? :>
            emit_load("$a0", "$s0")
            emit_li("$v0", 4)
            emit_syscall()
        else:
            emit_load("$a0", "$s0")
            emit_li("$v0", 1)
            emit_syscall()

        align_stack(top)


def cgen_expr(node_id):
    node = parseTree.nodes[node_id]
    return Expr.cgen_expr(node)


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
    elif child.data is "printstmt":
        cgen_print_stmt(child_id)


# TODO cgen_return_stmt


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

    align_stack(top)

    symbolTable.remove_scope()


def cgen_break(node):
    parent = parseTree.nodes[node].parent
    while parent is not None:
        data = parseTree.nodes[parent].data
        if data == "whilestmt" or data == "forstmt":
            break
        parent = parseTree.nodes[parent].parent

    if parent is None:
        print("Error!")
        exit(2)

    emit("j " + parseTree.nodes[node].attribute["ex_label"])
    return
