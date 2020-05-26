from lark import Lark

grammar = """
start : (decl)+

decl : variabledecl
     | functiondecl
     | classdecl
     | interfacedecl

variabledecl : variable ";"

variable : type ident

type : "int"
     | "double"
     | "bool"
     | "string"
     | ident
     | type "[]"

functiondecl : type ident "(" formals ")" stmtblock
            | "void" ident "(" formals ")" stmtblock

formals : (variable ( "," variable)*)?


classdecl : "class" ident ("extends" ident)? ("implements" ident ("," ident)* )? "{" field* "}"

field : variabledecl
      | functiondecl

interfacedecl : "interface" ident "{" prototype* "}"

prototype : type ident "(" formals ")" ";"
          | "void" ident "(" formals ")" ";"

stmtblock : "{" (variabledecl)* (stmt)* "}"

stmt : (expr)? ";"
     | ifstmt
     | whilestmt
     | forstmt
     | breakstmt
     | returnstmt
     | printstmt
     | stmtblock

ifstmt : "if" "(" expr ")" stmt ("else" stmt)?

whilestmt : "while" "(" expr ")" stmt

forstmt : "for" "(" (expr)? ";" expr ";" (expr)? ")" stmt

returnstmt : "return" (expr)?

breakstmt : "break" ";"

printstmt : "Print" "(" expr ("," expr)* ")" ";"

expr : expr0



expr0 :  expr1
     | lvalue "=" expr0

expr1 : expr2
     | expr2 "||" expr1

expr2 : expr3
     | expr3 "&&" expr2

expr3 : expr4
     | expr4 "==" expr3
     | expr4 "!=" expr3

expr4 : expr5
     | expr5 "<" expr4
     | expr5 "<=" expr4
     | expr5 ">" expr4
     | expr5 ">=" expr4

expr5 : expr6
     | expr6 "+" expr5
     | expr6 "-" expr5

expr6 : expr7
     | expr7 "*" expr6
     | expr7 "/" expr6
     | expr7 "%" expr6

expr7 : expr8
     | "-" expr7
     | "!" expr7

expr8 : constant
     | lvalue
     | "this"
     | call 
     | "ReadInteger" "(" ")"
     | "ReadLine" "(" ")"
     | "new" ident
     | "NewArray" "(" expr "," type ")"
     |"(" expr ")"


lvalue : ident
       | expr8 "." ident
       | expr8 "[" expr "]"

call : ident "(" actuals ")"
     | expr8 "." ident "(" actuals ")"

actuals : expr ("," expr)+
        |

constant : intconstant
         | doubleconstant
         | boolconstant
         | stringconstant
         | "null"

boolconstant : "false"
             | "true"


intconstant : (integer | hexint)

integer : /[0-9]+/

hexint : /0[xX][0-9a-fA-f]+/

stringconstant : /"[^"\\n]*"/

doubleconstant : /[0-9]+\\.[0-9]*([eE][+-]?[0-9]+)?/

ident : /[a-zA-Z][a-zA-Z0-9_]{,30}/

%import common.WS -> WHITESPACE
%ignore WHITESPACE
"""
x = input()  # "int main(){(23423).ali();}"
parser = Lark(grammar, parser='lalr')
print(parser.parse(x).pretty())
