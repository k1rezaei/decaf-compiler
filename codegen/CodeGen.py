from codegen.grammar import parseTree
from codegen.Utils import Variable, Address, SymbolTable
from codegen.Error import error
used_labels = 1
disFp = 1

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


def CgenIf1(expr, stmt1, stmt2):
    global used_labels, disFp
    l1 = create_label(used_labels)
    l2 = create_label(used_labels + 1)
    used_labels += 2
    top = disFp
    t1 = Cgen(expr)
    if t1.type != 'bool':
        print("Error")
        exit(2)
    emit("lw $t0, " + t1.to_str())
    emit("addi $sp, $sp, " + str(top - disFp))
    emit("beqz $t0, " + l1)
    Cgen(stmt1)
    emit("addi $sp, $sp, " + str(top - disFp))
    emit("j " + l2)
    emit(l1 + ":")
    Cgen(stmt2)
    emit("addi $sp, $sp, " + str(top - disFp))
    emit(l2 + ":")
    return


def CgenIf2(expr, stmt):
    global used_labels, disFp
    l1 = create_label(used_labels)
    used_labels += 1
    top = disFp
    t1 = Cgen(expr)
    if t1.type != 'bool':
        print("Error")
        exit(2)
    emit("lw $t0, " + t1.to_str())
    emit("addi $sp, $sp, " + str(top - disFp))
    emit("beqz $t0, " + l1)
    Cgen(stmt)
    emit("addi $sp, $sp, " + str(top - disFp))
    emit(l1 + ":")
    return


def CgenWhile(node):
    global used_labels, disFp
    expr = parseTree.nodes[node].child[0]
    stmt = parseTree.nodes[node].child[1]
    top = disFp
    l1 = create_label(used_labels)
    l2 = create_label(used_labels + 1)
    parseTree.nodes[node].attribute = l2
    used_labels += 2
    used_labels += 1
    t = Cgen(expr)
    if t.type != 'bool':
        print("Error!")
        exit(2)
    emit(l1 + ":")
    emit("lw $t0, " + t.to_str())
    emit("addi $sp, $sp, " + str(top - disFp))
    emit("beqz $t0, " + l2)
    Cgen(stmt)
    emit("addi $sp, $sp, " + str(top - disFp))
    emit("j " + l1)
    emit(l2 + ":")
    return


def CgenFor(node):
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
    Cgen(expr1)
    if top != disFp:
        emit("addi $sp, $sp, " + str(top - disFp))
    emit(l1 + ":")
    t = Cgen(expr2)
    if t.type != 'bool':
        print("Error!")
        exit(2)
    emit("lw $t0, " + t.to_str())
    if top != disFp:
        emit("addi $sp, $sp, " + str(top - disFp))
    emit("beqz $t0, " + l2)
    Cgen(stm)
    if top != disFp:
        emit("addi $sp, $sp, " + str(top - disFp))
    Cgen(expr3)
    if top != disFp:
        emit("addi $sp, $sp, " + str(top - disFp))
    emit("j " + l1)
    emit(l2 + ":")
    return


def cgen_variable(variable_id):
    node = parseTree.node[variable_id]
    type_id = node.child[0]
    ident_id = node.child[1]
    type = get_type(type_id)
    name = get_name(node_id)



def cgen_variable_decl(node_id):
    node = parseTree.nodes[node_id]
    variable_id = node.child[0]
    cgen_variable(variable_id)
    

def CgenBreak(node):
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


def Cgen(node):
    nod = parseTree.nodes[node]
    st = nod.data
    if st is "whilestme":
        CgenWhile(node)
    elif st is "nothing":
        return None
    elif st is "forstmt":
        CgenFor(node)
    elif st is "ifstmt":
        j = len(nod.child)
        if j == 2:
            CgenIf2(nod.child[0], nod.child[1])
        elif j == 3:
            CgenIf1(nod.child[0], nod.child[1], nod.child[2])
    elif st is "breakstmt":
        CgenBreak(node)
    else:
        return Address(124, 0, 'bool')
