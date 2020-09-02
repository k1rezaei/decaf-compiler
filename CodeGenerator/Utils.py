from Error import error
from Error import FunctionError, ClassError

used_labels = 1
disFp = -4  # always we have $sp = $fp + disFp.


def create_label():
    global used_labels
    num = used_labels
    arr = []
    while num != 0:
        s = num % 26
        num //= 26
        arr.append(chr(s + ord('A')))
    arr.append("_")
    used_labels += 1
    return "".join(arr)[::-1]


def align_stack(top):
    global disFp
    if top != disFp:
        emit("addi $sp, $sp, " + str(top - disFp))
        disFp = top


def emit_add(v1, v2, v3):
    emit("add " + v1 + ", " + v2 + ", " + v3)


def emit_addi(v1, v2, v3):
    emit("addi " + v1 + ", " + v2 + ", " + v3)


def emit_move(dst, src):
    emit("move " + dst + ", " + src)


def emit_jump(label):
    emit("j " + label)


def emit_jal(label):
    emit("jal " + label)


def emit_jalr(reg):
    emit("jalr " + reg)


def emit_label(label):
    emit(label + " :")


def emit_load_address(dst, label):
    emit('la ' + dst + ' ' + label)


def emit_load(dst, src, offset=0):
    emit("lw " + dst + ", " + str(offset) + "(" + src + ")")


def emit_load_double(dst, src, offset=0):
    emit("l.s " + dst + ", " + str(offset) + "(" + src + ")")


def emit_li(dst, val):
    emit("li " + dst + ", " + str(val))


def emit_load_byte(dst, src, offset=0):
    emit("lb " + dst + ", " + str(offset) + "(" + src + ")")


def emit_syscall():
    emit("syscall")


data_section = '''.data
__read:
    .space 400
__newLine:
    .asciiz "\\n"
__space:
    .asciiz " "
 __true:
    .asciiz "true"
__false:
    .asciiz "false"
__null:
    .word 0
__chert:
    .word 0
'''


def emit_data(label, input):
    global data_section
    data_section += label + ':\n' + '    ' + input + '\n'


def print_data_section():
    global data_section
    print(data_section)


def add_vtables():
    class_names = class_handler.get_class_names()
    for name in class_names:
        input = ".word 0"
        function_labels = class_handler.get_functions_label_list(name)
        for _ in range(len(function_labels)):
            input += ",0"
        emit_data(name, input)


def fill_vtable():
    class_names = class_handler.get_class_names()
    for name in class_names:
        function_labels = class_handler.get_functions_label_list(name)
        if len(function_labels) != 0:
            emit("la $s1, " + name)
        for index in range(len(function_labels)):
            emit("la $s0, " + function_labels[index])
            emit("sw $s0, " + str(4 * index) + "($s1)")


_debug = False


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
# mode = 3 -> member of an array = (Address: .load esh address khoone avval array mide, Index address: Address mode 0)
class Address:
    def __init__(self, addr, mode, is_double):
        self.addr = addr
        self.mode = mode
        self.is_double = is_double

    def load_address(self):
        emit_comment('Address.load_address()')
        if self.mode == 0:
            emit("addi $s0, $fp, " + str(self.addr))
        elif self.mode == 1:
            emit("addi $s0, $t8" + str(self.addr))
        elif self.mode == 2:
            self.addr[0].load()
            emit("addi $s0, $s0, " + str(self.addr[1]))
        else:
            self.addr[0].load()
            emit_move('$t5', '$s0')
            self.addr[1].load()
            emit_addi('$s0', '$s0', '1')
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
        emit("lw $s0, 0($s0)")
        emit("mtc1 $s0, $f0")

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
        emit("mfc1 $t7, $f0")
        emit("sw $t7, 0($s0)")

    def to_str(self):
        if self.mode == 0:
            return str(self.addr) + "($fp)"
        return str(self.addr) + "($zero)"


####
# (1) For generating function code, build new Symbol table
# add parameters by add_param method and for finish adding params should call finish params.
# when code is making new scope should call add_scope function with type("loop", "")
# when removing scope should call remove_scope()
# for finding variable should call get_variable_by_name which returns Variable obj
class SymbolTable:
    def __init__(self, is_member_function):
        self.params = []
        self.variables = []
        self.scopes = []
        self.is_member_function = is_member_function

        # agar for/while hast "loop". (due to break)

    # vagarna khaali (Nadid)
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

    def add_variable(self, type, name, is_array=False, global_=False):
        if not self.check_validity_in_scope(name):
            error("variable already defined in this scope")

        addr = 0
        if len(self.variables) == 0:
            addr = -4
        else:
            addr = self.variables[-1].address.addr - 4
        mode = 0
        if global_:
            mode = 1
        address = Address(addr, mode, type == Type.double)
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
            addr = self.params[-1].address.addr - 4
        address = Address(addr, 0, type == Type.double)
        variable = Variable(name, type, address, is_array)
        self.params.append(variable)

        # will return an object of type Variable (Not change It!)

    def get_variable_by_name(self, name, global_=False):
        length = len(self.variables)
        for i in range(length - 1, -1, -1):
            if self.variables[i].name == name:
                return self.variables[i]
        if global_:
            error("undefined variable " + name + "!")
        param = self.get_variable_by_name_in_params(name)
        if param is not None:
            return param
        return globalSymbolTable.get_variable_by_name(name, global_=True)

    def get_variable_by_name_in_params(self, name):
        for variable in self.params:
            if variable.name == name:
                return variable

        if not self.is_member_function:
            return None

        obj = self.params[-1]
        try:
            variable = class_handler.get_variable(obj.type, name)
            return Variable(name, variable.type,
                            Address((Address(4, 0, False), variable.address), 2, variable.type == Type.double),
                            variable.is_array)
        except:
            return None

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


globalSymbolTable = SymbolTable(False)
globalSymbolTable.finish_params()
globalSymbolTable.add_scope()
symbolTable = SymbolTable(False)
symbolTable.finish_params()


class Type:
    double = "double"
    int = "int"
    bool = "bool"
    string = "string"
    array = "array"
    null = "null"


def is_class_type(type):
    non_class_types = [Type.double, Type.int, Type.bool, Type.string, Type.array]
    return type not in non_class_types


class AttName:
    type = "type"
    address = "address"
    exit_label = "ex_label"  # this is for break statement
    array_member_type = "arr_member_type"
    array_dim = "arr_dim"
    has_return = "has_ret"
    begin_line = "begin_line"


class StackHandler:
    def __init__(self):
        self.checkpoints = []
        self.fp_checkpoints = []

    def add_checkpoint(self):
        emit_comment('StackHandler.add_checkpoint')
        self.checkpoints.append(disFp)

    def back_to_last_checkpoint(self):
        emit_comment('StackHandler.back_to_last_checkpoint')
        if len(self.checkpoints) == 0:
            raise RuntimeError()
        align_stack(self.checkpoints[-1])
        self.checkpoints = self.checkpoints[:-1]

    def set_fp_equal_sp(self):
        global disFp
        emit_move('$fp', '$sp')
        self.fp_checkpoints.append(-disFp)
        disFp = 0

    def back_to_last_fp(self):
        global disFp
        if len(self.fp_checkpoints) == 0:
            raise RuntimeError()
        emit_move('$sp', '$fp')
        emit_addi('$fp', '$fp', str(self.fp_checkpoints[-1]))
        disFp = -self.fp_checkpoints[-1]
        self.fp_checkpoints = self.fp_checkpoints[:-1]


stack_handler = StackHandler()


class FunctionDecl:
    def __init__(self, return_type, input_types, name, label):
        self.return_type = return_type
        self.input_types = input_types
        self.name = name
        self.label = label
        self.is_overridden = False

    def print(self):
        print(self.return_type, self.name, self.input_types, self.label)


def is_primitive(type):
    return type in [Type.double, Type.string, Type.int, Type.bool]


def is_array(type):
    return not isinstance(type, str)


def convertible(type1, type2):  # type1 (Derived), type2 (Base)
    if is_primitive(type1) or is_primitive(type2):
        return type1 == type2

    if is_array(type1) or is_array(type2):
        return type1 == type2

    # class
    return class_analyzer.convertible(type2, type1)


def is_convertible(params, formal):
    if len(params) != len(formal):
        return False

    for i in range(len(params)):
        type1 = params[i]
        type2 = formal[i]

        if not convertible(type1, type2):
            return False

    return True


def find_best_match(candidates):
    length = len(candidates)

    if length == 0:
        raise FunctionError("there is no correct function for your call")

    for i in range(length):
        function_decl = candidates[i]
        correct = True
        for j in range(length):
            if i == j:
                continue
            if is_convertible(candidates[j].input_types, function_decl.input_types):
                correct = False
        if correct:
            return function_decl

    raise FunctionError("cannot find unique function")


class FunctionHandler:
    def __init__(self):
        self.functions = []

    def get_function(self, name, input_types):
        candidates = []
        for function_decl in self.functions:
            if function_decl.name == name and is_convertible(input_types, function_decl.input_types):
                candidates.append(function_decl)

        return find_best_match(candidates)

    def add_function(self, function_decl):
        if self.has_signature(function_decl):
            raise FunctionError('function decl is same as another one')
        self.functions.append(function_decl)

    def has_signature(self, function_decl):
        for function in self.functions:
            if function.name == function_decl.name and is_convertible(function.input_types,
                                                                      function_decl.input_types) and is_convertible(
                function_decl.input_types, function.input_types):
                return True
        return False


function_handler = FunctionHandler()


def emit_array_length():
    emit('___array_length:')
    emit_load('$s0', '$fp', 4)
    emit_load('$v0', '$s0')
    emit('jr $ra')


def emit_btoi():
    emit('___btoi:')
    emit('lw $v0, 4($fp)')
    emit('jr $ra')


def emit_itob():
    emit('___itob:')
    emit('lw $s0, 4($fp)')
    emit('li $v0, 0')
    emit('beqz $s0, ___itob_jump')
    emit('li $v0, 1')
    emit('___itob_jump: jr $ra')


def emit_dtoi():
    emit('___dtoi:')
    emit('l.s $f0, 4($fp)')
    emit('round.w.s $f0, $f0')
    emit('mfc1 $v0, $f0')
    emit('jr $ra')


def emit_itod():
    emit('___itod:')
    emit('lw $s0, 4($fp)')
    emit('mtc1 $s0, $f0')
    emit('cvt.s.w $f0, $f0')
    emit('mfc1 $v0, $f0')
    emit('jr $ra')


class Class:
    def __init__(self, name):
        self.name = name
        self.parent = None
        self.child = []

    def set_parent(self, parent):
        self.parent = parent

    def add_child(self, child):
        self.child.append(child)

    def __repr__(self):
        return str(self.name)


class ClassAnalyzer:
    def __init__(self, parseTree):
        self.names = dict()
        self.classes = []
        i = 0

        # for save name of classes
        for decl in parseTree.nodes[0].ref_child:
            child = decl.ref_child[0]
            if child.data == "classdecl":
                name = child.ref_child[0].ref_child[0].data
                if name in self.names:
                    raise ClassError(
                        "class " + name + "has been defined above!"
                    )
                self.names[name] = i
                self.classes.append(Class(name))
                i = i + 1

        # for save inheritance data
        for decl in parseTree.nodes[0].ref_child:
            child = decl.ref_child[0]
            if child.data == "classdecl":
                par = child.ref_child[1]
                if par.data != "nothing":
                    par = par.ref_child[0].data
                    if par not in self.names:
                        raise ClassError(
                            "class " + child.ref_child[0].ref_child[0].data + " extends illegal class " +
                            par + "!"
                        )
                    else:
                        me = self.classes[self.names[child.ref_child[0].ref_child[0].data]]
                        par = self.classes[self.names[par]]
                        par.add_child(me)
                        me.set_parent(par)

        # check loop in extends
        if self.has_loop():
            raise ClassError(
                "You have loop in classes!"
            )
        # print(self.topological_sort())

    def has_loop(self):
        for i in range(len(self.classes)):
            visit = [False] * len(self.classes)
            visit[i] = True
            ret = self.for_loop(visit, self.classes[i])
            if ret:
                return ret
        return False

    def for_loop(self, visit, node):
        par = node.parent
        while par is not None:
            index = self.names[par.name]
            if visit[index]:
                return True
            visit[index] = True
            par = par.parent
        return False

    def convertible(self, str1, str2):
        if str2 == "null":
            return True

        if str1 == "null":
            return False

        node = self.classes[self.names[str2]]
        while node is not None:
            if node.name == str1:
                return True
            node = node.parent
        return False

    def parent(self, str1):
        par = self.classes[self.names[str1]].parent
        if par is not None:
            return par.name
        return None

    def topological_sort(self):
        sort = []
        for cl in self.classes:
            if cl.parent is None:
                sort.append(cl)
        i = 0
        while i < len(sort):
            for j in sort[i].child:
                sort.append(j)
            i = i + 1
        return sort

    def __repr__(self):
        for j in self.classes:
            print(j)
        return str(self.names)


# tooye codegen new shode
class_analyzer = None

this_type = None


class ClassDecl:
    def __init__(self, name):
        self.name = name
        self.variables = []
        self.functions = []
        self.is_overridden = []
        self.top_vars = 0
        self.top_funcs = 0

    def set_parent_variables(self, variables):
        for var in variables:
            self.variables.append(var)
        self.top_vars = len(variables)

    def add_variable(self, variable):
        for i in range(self.top_vars, len(self.variables)):
            if self.variables[i].name == variable.name:
                raise ClassError('same variable  name in class')
        self.variables.append(variable)
        variable.address = 4 * len(self.variables)

    def get_variable(self, name):  # it will return the offet from class.
        for i in range(len(self.variables) - 1, -1, -1):
            if self.variables[i].name == name:
                return self.variables[i]
        raise ClassError('this class does not have this field')

    def set_parent_functions(self, functions):
        for func in functions:
            self.functions.append(FunctionDecl(func.return_type, func.input_types, func.name, func.label))
        self.top_funcs = len(self.functions)

    def add_function(self, function):
        for i in range(self.top_funcs, len(self.functions)):
            if self.functions[i].name == function.name:
                raise FunctionError("class " + self.name + " has declaration for function " + function.name + "twice!")

        override = False

        for i in range(self.top_funcs):
            if self.functions[i].name == function.name:
                override = True
                if self.functions[i].return_type != function.return_type or self.functions[
                    i].input_types != function.input_types:
                    raise FunctionError(
                        "class " + self.name + " has overridden a function but with different signature")
                if self.functions[i].is_overridden:
                    raise FunctionError("function" + function.name + ' has overridden twice in class ' + self.name)
                self.functions[i].label = function.label
                self.functions[i].is_overridden = True

        if override:
            return

        self.functions.append(function)

    # it will return (function_decl, offset) of function name in class
    def get_function(self, name):
        offset = 0
        for function in self.functions:
            if function.name == name:
                return function, 4 * offset
            offset = offset + 1
        raise FunctionError('function with name ' + name + ' is not in class ' + self.name)


class ClassHandler:
    def __init__(self):
        self.class_decls = []

    def add_class_decl(self, class_decl):
        self.class_decls.append(class_decl)

    def get_variable(self, class_name, var_name):  # class name (static type)
        for class_decl in self.class_decls:
            if class_decl.name == class_name:
                return class_decl.get_variable(var_name)

        raise ClassError('can not find variable in class')

    def get_class_decl(self, class_name):
        for class_decl in self.class_decls:
            if class_decl.name == class_name:
                return class_decl
        raise ClassError("class " + class_name + " not found")

    def get_object_size(self, class_name):
        class_decl = self.get_class_decl(class_name)
        return 4 * len(class_decl.variables) + 4

    def get_vtable_size(self, class_name):
        class_decl = self.get_class_decl(class_name)
        return 4 * len(class_decl.functions)

    def get_functions_label_list(self, class_name):  # ba in tartib dar vTable benevisid. (in label haro mide)
        class_decl = self.get_class_decl(class_name)
        label_list = []
        for function in class_decl.functions:
            label_list.append(function.label)
        return label_list

    def get_function(self, class_name, name, input_types):  # inja ham behet function_decl midam ham offset esh
        # dar vTable
        class_decl = self.get_class_decl(class_name)
        function_decl, offset = class_decl.get_function(name)
        if not is_convertible(input_types, function_decl.input_types):
            raise FunctionError("you are calling function " + name + " with wrong signature ")
        return function_decl, offset

    def get_class_names(self):
        names = []
        for class_decl in self.class_decls:
            names.append(class_decl.name)
        return names


class_handler = ClassHandler()
