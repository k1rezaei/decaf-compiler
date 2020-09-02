def error(message):
    raise SymbolTableError(message)


class TypeError(Exception):
    def __init__(self, message):
        self.message = message


class SymbolTableError(Exception):
    def __init__(self, message):
        self.message = message


class FunctionError(Exception):
    def __init__(self, message):
        self.message = message


class ClassError(Exception):
    def __init__(self, message):
        self.message = message


class ReturnWarning(Warning):
    def __init__(self, message):
        self.message = message
