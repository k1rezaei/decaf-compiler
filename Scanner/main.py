import sys, getopt
import string

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
    return input_file.read(1)


ch = ''


def scan_id(input_file, letters):
    global ch

    MAX_NUMBER_OF_LETTERS_IN_ID = 31
    lexeme = ''
    length = 0
    while ch in letters and length < MAX_NUMBER_OF_LETTERS_IN_ID:
        lexeme += ch
        ch = get_next_char(input_file)
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
    st = []
    if ch is '+' or ch is '-':
        st.append(ch)
        ch = get_next_char(input_file)
    if ch in digits:
        nex = get_next_char(input_file)
        if ch is '0' and (nex is 'X' or nex is 'x'):
            st.append('0')
            st.append(nex)
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
            st.append(ch)
            ch = nex
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
                    if ch is '+' or ch is '-':
                        st.append(ch)
                        ch = get_next_char(input_file)
                    val = False
                    while ch in digits:
                        val = True
                        st.append(ch)
                        ch = get_next_char(input_file)
                    if val:
                        return Token('T_DOUBLELITERAL', "".join(st))
                    else:
                        return Token('UNDEFINED_TOKEN', None)
                else:
                    return Token('T_DOUBLELITERAL', "".join(st))
    else:
        return Token("".join(st), None)


def scan(input_file):
    global ch

    alphabet = list(string.ascii_lowercase) + list(string.ascii_uppercase)
    under_score = ['_']
    digits = list(string.digits)
    keywords = ['void', 'int', 'double', 'bool', 'string', 'class', 'interface', 'null', 'this', 'extends', 'implements',
                'for', 'while', 'if', 'else', 'return', 'break', 'new', 'NewArray', 'Print', 'ReadInteger', 'ReadLine']
    math_opr1 = [';', ',', '(', ')', ']', '%', '*', '.']
    math_opr2 = ['!', '=', '>', '<']
    hex_ = list(string.hexdigits)
    tokens = []

    ch = get_next_char(input_file)
    while ch:  # ch is not EOF
        if ch in (alphabet + under_score):
            lexeme = scan_id(input_file, alphabet + under_score + digits)
            if lexeme in keywords:
                tokens.append(lexeme)
            elif lexeme == 'true' or lexeme == 'false':
                tokens.append('T_BOOLEANLITERAL ' + lexeme)
            else:
                tokens.append('T_ID ' + lexeme)
        elif ch in math_opr1:
            ch = get_next_char(input_file)
            tokens.append(Token(ch, None))
        elif ch in math_opr2:
            st = [ch]
            ch = get_next_char(input_file)
            if ch is '=':
                ch = get_next_char(input_file)
                st.append('=')
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
        elif ch in digits or ch is '+' or ch is '-':
            tokens.append(scan_number(input_file, digits, hex_))
            if tokens[-1].token == 'UNDEFINED_TOKEN':
                break
        elif ch is '"':
            st = ['"']
            ch = get_next_char(input_file)
            val = True
            while ch != '"':
                if ch is '\n' or ch is None:
                    tokens.append(Token('UNDEFINED_TOKEN', None))
                    val = False
                st.append(ch)
            if val:
                tokens.append(Token('T_STRINGLITERAL', "".join(st)))
            else:
                break
        else:  # white space
            ch = get_next_char(input_file)

    return tokens


def main(argv):
    inputfile = 't07-operator1.in'
    outputfile = 'out.txt'
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
        # do stuff with input file
        tokens = scan(input_file)

    with open("out/" + outputfile, "w") as output_file:
        # write result to output file.
        # for the sake of testing :
        for token in tokens:
            output_file.write(str(token) + '\n')


if __name__ == "__main__":
    main(sys.argv[1:])