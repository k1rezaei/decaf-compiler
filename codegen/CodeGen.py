# from codegen.grammar import parseTree


####
# class for address types
# mode = 0 -> address from frame pointer
# mode = 1 -> global address
class Address:
    def __init__(self, adr, mode, type):
        self.address = adr
        self.mode = mode
        self.type = type

    def to_str(self):
        if self.mode == 0:
            return str(self.address) + "($fp)"
        return str(self.address) + "($zero)"


used_labels = 0
disFp = 1


def create_label(num):
    arr = []
    while num != 0:
        s = num % 27
        num //= 27
        arr.append(chr(s + ord('A')))
    arr.append("_")
    return "".join(arr)[::-1]


def emit(st):
    pass


def CgenIf(expr, stmt1, stmt2):
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


def CgenIf(expr, stmt):
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


def Cgen(node):
    return 1
