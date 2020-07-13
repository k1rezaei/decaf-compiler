from codegen.grammar import parseTree

used_labels = 1
disFp = 1


####
# class for address types
# mode = 0 -> address from frame pointer
# mode = 1 -> global address
# mode = 2 -> field of an object = (address of obj from pointer, address of field in object)
class Address:
    def __init__(self, addr, mode):
        self.addr = addr
        self.mode = mode

    def to_str(self):
        if self.mode == 0:
            return str(self.addr) + "($fp)"
        return str(self.addr) + "($zero)"


class Variable:
    def __init__(self, name, type, address):
        self.name = name
        self.type = type
        self.address = address


### (1) For generating function code, build new Symbol table
### add parameters by add_param method and for finish adding params should call finish params.
### when code is making new scope should call add_scope function with type("loop", "")
### when removing scope should call remove_scope()
### for finding variable should call get_variable_by_name which returns Variable obj
class SymbolTable:
    def __init__(self, is_member_function):
        self.params = []
        self.variables = []
        self.scopes = []
        self.is_member_function = is_member_function

    ### agar for/while hast "loop". (due to break)
    ### vagarna khaali (Nadid)
    def add_scope(self, type=""):
        self.scopes.append((len(self.variables), type))

    def remove_scope(self, type=""):
        if len(self.scopes) == 0:
            error("symbol Table is Already Empty")

        removed = False
        while len(self.scopes) > 0:
            scope_type = self.scopes[-1][1]
            self.remove(self.scopes[-1][0])
            self.scopes.pop()
            if scope_type == type:
                removed = True
                break

        if not removed:
            error("Error in removing scopes in Symbol Table")

    def remove(self, index):
        while len(self.variables) > index:
            self.variables.pop()

    # daroon cgen marboot be variable decleration in bayad seda zadeshe.
    def add_variable(self, type, name):
        if not self.check_validity_in_scope(name):
            error("variable already defined in this scope")

        addr = 0
        if len(self.variables) == 0:
            addr = -8
        else:
            if self.variables[-1].type == "double":
                addr = self.variables[-1].address.addr - 8
            else:
                addr = self.variables[-1].address.addr - 4
        address = Address(addr, 0)
        variable = Variable(name, type, address)
        self.variables.append(variable)

    def finish_params(self):
        if len(self.params) == 0:
            return
        last_addr = self.params[-1].address.addr
        last_addr = 4 - last_addr
        for variable in self.params:
            variable.address.addr += last_addr
        return

    def add_param(self, type, name):
        if not self.check_validity_in_params(name):
            error("parameter names are same")

        addr = 0
        if len(self.params) == 0:
            addr = 0
        else:
            if self.params[-1].type == "double":
                addr = self.params[-1].address.addr - 8
            else:
                addr = self.params[-1].address.addr - 4
        address = Address(addr, 0)
        variable = Variable(name, type, address)
        self.params.append(variable)

    ### will return an object of type Variable (Not change It!)
    def get_variable_by_name(self, name):
        length = len(self.variables)
        for i in range(length - 1, -1, -1):
            if self.variables[i].name == name:
                return self.variables[i]

        return self.get_variable_by_name_in_params(name)

    def get_variable_by_name_in_params(self, name):
        for variable in self.params:
            if variable.name == name:
                return variable

        if not self.is_member_function:
            error("undefined variable " + name)

        ##TODO (field of classes)

    def check_validity_in_scope(self, name):
        if len(self.scopes) == 0:
            error("scope is not defined yet")
        index = self.scopes[-1][0]
        for i in range(index, len(self.variables)):
            if self.variables[i].name == name:
                return False
        return True

    def check_validity_in_params(self, name):
        for variable in self.params:
            if variable.name == name:
                return False
        return True


### Error Haro Ba Peygham Bezarid Taa Debug Rahat tar she.
def error(message):
    print(message)
    exit(0)


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
