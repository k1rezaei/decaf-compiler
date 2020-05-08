import sys, getopt
import string

class Token:
    def __init__(self, token, attribute):
        self.token = token
        self.att =  attribute

    def __repr__(self):
        if self.att is None:
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
    valid = True
    while ch and valid:  # ch is not EOF
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
            st = ['/']
            ch = input_file.read(1)
            if ch is '/':
                st.append('/')
                ch = get_next_char(input_file)
                while ch is not '\n' and ch:
                    st.append(ch)
                    ch = get_next_char(input_file)
                tokens.append(Token('T_singleLineComment', "".join(st)))
            elif ch is '*':
                ch = get_next_char(input_file)
                pre = [None, ch]
                st = ['/', '*']
                while True:
                    st.append(ch)
                    if pre[0] == '*' and pre[1] == '/':
                        st.append('*')
                        st.append('/')
                        tokens.append(('T_multipleLineComment', "".join(st)))
                        break
                    if ch is None:
                        valid = False
                        tokens.append(Token('UNDEFINED_TOKEN', None))
                        break
            else:
                tokens.append(Token('/', None))
        elif ch is '&':
            ch = get_next_char(input_file)
            if ch is '&':
                ch = get_next_char(input_file)
                tokens.append(Token('&&', None))
            else:
                valid = False
                tokens.append(Token('UNDEFINED_TOKEN', None))
        elif ch is '|':
            ch = get_next_char(input_file)
            if ch is '|':
                ch = get_next_char(input_file)
                tokens.append(Token('||', None))
            else:
                valid = False
                tokens.append(Token('UNDEFINED_TOKEN', None))
        elif ch is '[':
            ch = get_next_char(input_file)
            if ch is ']':
                ch = get_next_char(input_file)
                tokens.append(Token('[]', None))
            else:
                tokens.append(Token('[', None))
        elif ch in digits or ch is '+' or ch is '-':
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
                        tokens.append(Token('T_INTLITERAL', "".join(st)))
                    else:
                        tokens.append(Token('UNDEFINED_TOKEN', None))
                else:
                    st.append(ch)
                    ch = nex
                    while ch in digits:
                        st.append(ch)
                        ch = get_next_char(input_file)
                    if ch is not '.':
                        tokens.append(Token('T_INTLITERAL', "".join(st)))
                    else:
                        pass
            else:
                tokens.append("".join(st))
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
        # do stuff with input file
        tokens = scan(input_file)

    with open("out/" + outputfile, "w") as output_file:
        # write result to output file.
        # for the sake of testing :
        for token in tokens:
            output_file.write(token + '\n')


if __name__ == "__main__":
    main(sys.argv[1:])