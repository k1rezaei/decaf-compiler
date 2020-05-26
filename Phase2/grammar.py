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

printstmt : "print" "(" expr ("," expr)* ")" ";"

expr : lvalue "=" expr
     | constant
     | lvalue
     | "this"
     | call
     | "(" expr ")"
     | expr "+" expr
     | expr "-" expr
     | expr "*" expr
     | expr "/" expr
     | expr "%" expr
     | "-" expr
     | expr "<" expr
     | expr "<=" expr
     | expr ">" expr
     | expr ">=" expr
     | expr "==" expr
     | expr "!=" expr
     | expr "&&" expr
     | expr "||" expr
     | "!" expr
     | "ReadInteger" "(" ")"
     | "ReadLine" "(" ")"
     | "new" ident
     | "NewArray" "(" expr "," type ")"

lvalue : ident
       | expr "." ident
       | expr "[" expr "]"

call : ident "(" actuals ")"
     | expr "." ident "(" actuals ")"

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
x = input()
parser = Lark(grammar, parser='lalr')
print(parser.parse(x).pretty())
