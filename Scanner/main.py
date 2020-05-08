import sys, getopt
import string


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
