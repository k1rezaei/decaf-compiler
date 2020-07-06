import sys, getopt
from lark import Lark

grammar = """
start : (decl)+

decl : variabledecl
     | functiondecl
     | classdecl
     | interfacedecl

variabledecl : variable ";"

variable : type ident

type : "int" -> int
     | "double" -> double
     | "bool" -> bool
     | "string" -> string
     | ident 
     | type "[]" -> array_indexation

functiondecl : type ident "(" formals ")" stmtblock
            | "void" ident "(" formals ")" stmtblock -> void_functiondecl

formals : (variable ( "," variable)*)?


classdecl : "class" ident ("extends" ident)? ("implements" ident ("," ident)* )? "{" field* "}"

field : variabledecl
      | functiondecl

interfacedecl : "interface" ident "{" prototype* "}"

prototype : type ident "(" formals ")" ";"
          | "void" ident "(" formals ")" ";"

stmtblock : "{" (variabledecl)* (stmt)* "}"

stmt : closestmt
     | openstmt

closestmt : (expr)? ";"
          | ifstmtclose
          | whilestmtclose
          | forstmtclose
          | breakstmt
          | returnstmt
          | printstmt
          | stmtblock

openstmt : ifstmtopen
         | whilestmtopen
         | forstmtopen

ifstmtclose : "if" "(" expr ")" closestmt "else" closestmt

ifstmtopen : "if" "(" expr ")" closestmt "else" openstmt
           | "if" "(" expr ")" stmt

whilestmtopen : "while" "(" expr ")" openstmt

whilestmtclose : "while" "(" expr ")" closestmt

forstmtopen : "for" "(" (expr)? ";" expr ";" (expr)? ")" openstmt

forstmtclose : "for" "(" (expr)? ";" expr ";" (expr)? ")" closestmt

returnstmt : "return" (expr)? ";"

breakstmt : "break" ";"

printstmt : "Print" "(" expr ("," expr)* ")" ";"


expr :  expr1 
     | lvalue "=" expr -> assignment

expr1 : expr2 -> change_priority_level
     | expr1 "||" expr2 -> logical_or

expr2 : expr3 -> change_priority_level
     | expr2 "&&" expr3 -> logical_and

expr3 : expr4 -> change_priority_level
     | expr3 "==" expr4 -> equal_to
     | expr3 "!=" expr4 -> not_equal_to

expr4 : expr5 -> change_priority_level
     | expr4 "<" expr5 -> less_than
     | expr4 "<=" expr5 -> less_than_or_eq_to
     | expr4 ">" expr5 -> greater_than
     | expr4 ">=" expr5 -> greater_than_or_eq_to

expr5 : expr6 -> change_priority_level
     | expr5 "+" expr6 -> add
     | expr5 "-" expr6 -> subtract

expr6 : expr7 -> change_priority_level
     | expr6 "*" expr7 -> multiply
     | expr6 "/" expr7 -> divide
     | expr6 "%" expr7 -> modulo

expr7 : expr8 -> change_priority_level
     | "-" expr7 -> unary_negate
     | "!" expr7 -> not

expr8 : constant
     | lvalue
     | "this" -> this
     | call 
     | "ReadInteger" "(" ")" -> read_integer
     | "ReadLine" "(" ")" -> read_line
     | "new" ident -> new
     | "NewArray" "(" expr "," type ")" -> new_array
     |"(" expr ")" -> parentheses


lvalue : ident
       | expr8 "." ident -> dot
       | expr8 "[" expr "]" -> subscript

call : ident "(" actuals ")" 
     | expr8 "." ident "(" actuals ")"  

actuals : expr ("," expr)*
        |

constant : intconstant
         | doubleconstant
         | boolconstant
         | stringconstant
         | "null" -> null

boolconstant : "false" -> false
             | "true" -> true


intconstant : integer 
            | hexint -> hex_intcontstant

integer : /[0-9]+/

hexint : /0[xX][0-9a-fA-f]+/

stringconstant : /"[^"\\n]*"/

doubleconstant : /[0-9]+\\.[0-9]*([eE][+-]?[0-9]+)?/

ident : /(?!for|false|true|null|this|NewArray|new|ReadLine|ReadInteger|Print|break|return|while|if|void|class|string|bool|double|int|interface|extends|implements|else)[a-zA-Z][a-zA-Z0-9_]{,30}|for[a-zA-Z0-9_]{1,28}|false[a-zA-Z0-9_]{1,26}|true[a-zA-Z0-9_]{1,27}|null[a-zA-Z0-9_]{1,27}|this[a-zA-Z0-9_]{1,27}|NewArray[a-zA-Z0-9_]{1,23}|new[a-zA-Z0-9_]{1,28}|ReadLine[a-zA-Z0-9_]{1,23}|ReadInteger[a-zA-Z0-9_]{1,20}|Print[a-zA-Z0-9_]{1,26}|break[a-zA-Z0-9_]{1,26}|return[a-zA-Z0-9_]{1,25}|while[a-zA-Z0-9_]{1,26}|if[a-zA-Z0-9_]{1,29}|void[a-zA-Z0-9_]{1,27}|class[a-zA-Z0-9_]{1,26}|string[a-zA-Z0-9_]{1,25}|bool[a-zA-Z0-9_]{1,27}|double[a-zA-Z0-9_]{1,25}|int[a-zA-Z0-9_]{1,28}|interface[a-zA-Z0-9_]{1,22}|extends[a-zA-Z0-9_]{1,24}|implements[a-zA-Z0-9_]{1,21}|else[a-zA-Z0-9_]{1,27}/

SINGLE_LINE_COMMENT : /\/\/[^\\n]*\\n/
MULTI_LINE_COMMENT : /\/\*([^\\*]|(\*)+[^\\*\\/])*(\*)+\//

%import common.WS -> WHITESPACE
%ignore WHITESPACE
%ignore SINGLE_LINE_COMMENT
%ignore MULTI_LINE_COMMENT

"""


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
            print('test.py -i <inputfile> -o <outputfile>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            outputfile = arg

    result = False

    with open("tests/" + inputfile, "r") as input_file:
        data = input_file.read()
        parser = Lark(grammar, parser='lalr', debug=True)
        try:
            parser.parse(data).pretty()
            result = True
        except:
            result = False

        # do stuff with input file

    with open("out/" + outputfile, "w") as output_file:
        # write result to output file. 
        # for the sake of testing :
        if result:
            output_file.write("YES")
        else:
            output_file.write("NO")


if __name__ == "__main__":
    main(sys.argv[1:])
