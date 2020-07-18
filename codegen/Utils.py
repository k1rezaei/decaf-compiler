from codegen.Error import error

used_labels = 1
disFp = -4  ### always we have $sp = $fp + disFp.


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


def align_stack(top):
    global disFp
    if top != disFp:
        emit("addi $sp, $sp, " + str(top - disFp))
        disFp = top


def emit_addi(v1, v2, v3):
    emit("addi " + v1 + ", " + v2 + ", " + v3)


def emit_move(dst, src):
    emit("move " + dst + ", " + src)


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
newLine:
    .asciiz "\\n"
space:
    .asciiz " "
null:
    .space 8

'''


def emit_data(label, input):
    global data_section
    data_section += '    ' + label + ':\n' + input + '\n'


def print_data_section():
    global data_section
    print(data_section)


_debug = True


def emit_comment(comment):
    global _debug
    if _debug:
        emit('# ' + comment)


def emit(st):
    print(st)


class Variable:
    def __init__(self, name, type, address, is_array=False):
        self.name = name
        self.type = type
        self.address = address
        self.is_array = is_array


####
# class for address types
# mode = 0 -> address from frame pointer
# mode = 1 -> global address
# mode = 2 -> field of an object = (address of obj from pointer, address of field in object)
# mode = 3 -> member of an array = (Address: .load esh address khoone avval array mide, address of index: Address)
class Address:
    def __init__(self, addr, mode, is_double=False):
        self.addr = addr
        self.mode = mode
        self.is_double = is_double

    def load_address(self):
        emit_comment('Address.load_address()')
        if self.mode == 0:
            emit("addi $s0, $fp, " + str(self.addr))
        elif self.mode == 1:
            emit("li $s0," + str(self.addr))
        elif self.mode == 2:
            emit("addi $s0, $fp, " + str(self.addr[0]))
            emit("lw $s0, 0($s0)")
            emit("addi $s0, $s0, " + str(self.addr[1]))
        else:
            self.addr[0].load()
            emit_move('$t5', '$s0')
            self.addr[1].load()
            emit_addi('$s0', '$s0', '1')
            if self.is_double:
                emit_li('$t6', 8)
            else:
                emit_li('$t6', 4)
            emit('mult $s0, $t6')
            emit('mflo $t6')

            emit("add $s0, $t5, $t6")
        return

    def load(self):
        emit_comment('Address.load()')
        if self.is_double:
            self.load_double()
        else:
            self.load_address()
            emit("lw $s0, 0($s0)")

    def load_double(self):
        self.load_address()
        emit("mtc1.d $s0, $f0")

    def store(self):
        emit_comment('Address.store()')
        if self.is_double:
            self.store_double()
        else:
            emit_move('$t7', '$s0')
            self.load_address()
            emit("sw $t7, 0($s0)")

    def store_double(self):
        self.load_address()
        emit_move('$t7', '$s0')
        emit("mfc1.d $s0, $f0")
        emit("sd $s0, 0($t7)")

    def to_str(self):
        if self.mode == 0:
            return str(self.addr) + "($fp)"
        return str(self.addr) + "($zero)"


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

    def add_variable(self, type, name, is_array=False):
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
        variable = Variable(name, type, address, is_array)
        self.variables.append(variable)

    def finish_params(self):
        if len(self.params) == 0:
            return
        last_addr = self.params[-1].address.addr
        last_addr = 4 - last_addr
        for variable in self.params:
            variable.address.addr += last_addr
        return

    def add_param(self, type, name, is_array=False):
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
        variable = Variable(name, type, address, is_array)
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


symbolTable = SymbolTable(False)
symbolTable.finish_params()


class Type:
    double = "double"
    int = "int"
    bool = "bool"
    string = "string"
    array = "array"
    null = "null"


class AttName:
    type = "type"
    address = "address"
    exit_label = "ex_label"  # this is for break statement
    array_member_type = "arr_member_type"
    array_dim = "arr_dim"


class StackHandler:
    def __init__(self):
        self.checkpoints = []

    def add_checkpoint(self):
        emit_comment('StackHandler.add_checkpoint')
        self.checkpoints.append(disFp)

    def back_to_last_checkpoint(self):
        emit_comment('StackHandler.back_to_last_checkpoint')
        if len(self.checkpoints) == 0:
            raise RuntimeError()
        align_stack(self.checkpoints[-1])
        self.checkpoints = self.checkpoints[:-1]


stack_handler = StackHandler()
