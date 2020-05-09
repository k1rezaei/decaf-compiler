import getopt
import string
import sys


ch = ''
next_ = []


class Token:
    def __init__(self, token, attribute):
        self.token = token
        self.att = attribute

    def __repr__(self):
        if self.att is not None:
            return self.token + " " + self.att + "\n"
        else:
            return self.token + "\n"


def get_next_char(input_file):
    if len(next_) != 0:
        c = next_[0]
        next_.remove(c)
        return c
    return input_file.read(1)


def scan_id(input_file, letters):
    global ch

    MAX_NUMBER_OF_LETTERS_IN_ID = 31
    lexeme = ''
    length = 0
    while ch in letters and length < MAX_NUMBER_OF_LETTERS_IN_ID:
        lexeme += ch
        ch = get_next_char(input_file)
        length += 1
    return lexeme


def scan_comment(input_file):
    global ch
    st = ['/']
    ch = get_next_char(input_file)
    if ch is '/':
        st.append('/')
        ch = get_next_char(input_file)
        while ch is not '\n' and ch:
            st.append(ch)
            ch = get_next_char(input_file)
        return Token('T_singleLineComment', "".join(st))
    elif ch is '*':
        ch = get_next_char(input_file)
        pre = [None, ch]
        st = ['/', '*']
        while True:
            st.append(ch)
            if pre[0] == '*' and pre[1] == '/':
                st.append('*')
                st.append('/')
                return Token('T_multipleLineComment', "".join(st))
            if ch is None:
                return Token('UNDEFINED_TOKEN', None)
            pre[0] = pre[1]
            pre[1] = ch
            ch = get_next_char(input_file)
    else:
        return Token('/', None)


def scan_number(input_file, digits, hex_):
    global ch
    st = [ch]
    ch = get_next_char(input_file)
    if st[0] is '0' and (ch is 'X' or ch is 'x'):
        st.append(ch)
        ch = get_next_char(input_file)
        val = False
        while ch in hex_:
            val = True
            st.append(ch)
            ch = get_next_char(input_file)
        if val:
            return Token('T_INTLITERAL', "".join(st))
        else:
            return Token('UNDEFINED_TOKEN', None)
    else:
        while ch in digits:
            st.append(ch)
            ch = get_next_char(input_file)
        if ch is not '.':
            return Token('T_INTLITERAL', "".join(st))
        else:
            st.append('.')
            ch = get_next_char(input_file)
            while ch in digits:
                st.append(ch)
                ch = get_next_char(input_file)
            if ch is 'e' or ch is 'E':
                st.append(ch)
                ch = get_next_char(input_file)
                nu = False
                if ch is '+' or ch is '-':
                    st.append(ch)
                    nu = True
                    ch = get_next_char(input_file)
                val = False
                while ch in digits:
                    val = True
                    st.append(ch)
                    ch = get_next_char(input_file)
                if val:
                    return Token('T_DOUBLELITERAL', "".join(st))
                else:
                    nu_ = 1
                    if nu:
                        next_.append(st[-1])
                        nu_ = 2
                    next_.append(ch)
                    ch = st[-nu_]
                    return Token('T_DOUBLELITERAL', "".join(st[:-nu_]))
            else:
                return Token('T_DOUBLELITERAL', "".join(st))


def scan_string(input_file):  # TODO
    global ch

    lexeme = '"'
    ch = get_next_char(input_file)
    while ch != '"' and ch != '\n' and ch:
        lexeme += ch
        ch = get_next_char(input_file)

    if not ch or ch == '\n':
        return Token('UNDEFINED_TOKEN', None)

    lexeme += '"'
    ch = get_next_char(input_file)

    return Token('T_STRINGLITERAL', lexeme)


def scan(input_file):
    global ch

    alphabet = list(string.ascii_lowercase) + list(string.ascii_uppercase)
    under_score = ['_']
    digits = list(string.digits)
    keywords = ['void', 'int', 'double', 'bool', 'string', 'class', 'interface', 'null', 'this', 'extends',
                'implements',
                'for', 'while', 'if', 'else', 'return', 'break', 'new', 'NewArray', 'Print', 'ReadInteger', 'ReadLine']
    math_opr1 = [';', ',', '(', ')', ']', '%', '*', '.', '-', '+', '{', '}']
    math_opr2 = ['!', '=', '>', '<']
    hex_ = list(string.hexdigits)
    tokens = []

    ch = get_next_char(input_file)
    while ch:  # ch is not EOF
        if ch in (alphabet + under_score):
            lexeme = scan_id(input_file, alphabet + under_score + digits)
            if lexeme in keywords:
                tokens.append(Token(lexeme, None))
            elif lexeme == 'true' or lexeme == 'false':
                tokens.append(Token('T_BOOLEANLITERAL', lexeme))
            else:
                tokens.append(Token('T_ID', lexeme))
        elif ch in math_opr1:
            tokens.append(Token(ch, None))
            ch = get_next_char(input_file)
        elif ch in math_opr2:
            st = [ch]
            ch = get_next_char(input_file)
            if ch is '=':
                ch = get_next_char(input_file)
                st.append('=')
                tokens.append(Token("".join(st), None))
            else:
                tokens.append(Token("".join(st), None))
        elif ch is '/':
            tokens.append(scan_comment(input_file))
            if tokens[-1].token == 'UNDEFINED_TOKEN':
                break
        elif ch is '&':
            ch = get_next_char(input_file)
            if ch is '&':
                ch = get_next_char(input_file)
                tokens.append(Token('&&', None))
            else:
                tokens.append(Token('UNDEFINED_TOKEN', None))
                break
        elif ch is '|':
            ch = get_next_char(input_file)
            if ch is '|':
                ch = get_next_char(input_file)
                tokens.append(Token('||', None))
            else:
                tokens.append(Token('UNDEFINED_TOKEN', None))
                break
        elif ch is '[':
            ch = get_next_char(input_file)
            if ch is ']':
                ch = get_next_char(input_file)
                tokens.append(Token('[]', None))
            else:
                tokens.append(Token('[', None))
        elif ch in digits:
            tokens.append(scan_number(input_file, digits, hex_))
            if tokens[-1].token == 'UNDEFINED_TOKEN':
                break
        elif ch == '"':
            tokens.append(scan_string(input_file))
            if tokens[-1].token == 'UNDEFINED_TOKEN':
                break
        else:  # white space
            ch = get_next_char(input_file)

    return tokens


def main(argv):
    inputfile = ''
    outputfile = ''
    try:
        opts, args = getopt.getopt(argv, "hi:o:", ["ifile=", "ofile="])
    except getopt.GetoptError:
        print('main.py -i <inputfile> -o <outputfile>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print('test.py -i inputfile> -o <outputfile>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            outputfile = arg

    with open("tests/" + inputfile, "r") as input_file:
        tokens = scan(input_file)

    with open("out/" + outputfile, "w") as output_file:
        for token in tokens:
            if token.token == 'T_singleLineComment' or token.token == 'T_multipleLineComment':
                continue
            output_file.write(str(token))


if __name__ == "__main__":
    main(sys.argv[1:])
