.text
main: addi $fp, $sp, -4
# cgen_stmt_block
# cgen_variable_decl
# cgen_variable
addi $sp, $sp, -4
# cgen_stmt
# cgen_stmt
# cgen_expr_assign
# StackHandler.add_checkpoint
# cgen_lvalue
# cgen_constant
# cgen_constant_int
# expr_set_node_attributes
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
# Address.store()
move $t7, $s0
# Address.load_address()
addi $s0, $fp, -12
sw $t7, 0($s0)
# Address.load()
# Address.load_address()
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
# Address.store()
move $t7, $s0
# Address.load_address()
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
# StackHandler.back_to_last_checkpoint
addi $sp, $sp, 4
# expr_set_node_attributes
addi $sp, $sp, -4
# Address.store()
move $t7, $s0
# Address.load_address()
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
# cgen_stmt
# cgen_stmt
# cgen_while
_B :
# cgen_expr_le
# StackHandler.add_checkpoint
# cgen_lvalue
# cgen_constant
# cgen_constant_int
# expr_set_node_attributes
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 10
# Address.store()
move $t7, $s0
# Address.load_address()
addi $s0, $fp, -12
sw $t7, 0($s0)
# Address.load()
# Address.load_address()
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
# Address.load()
# Address.load_address()
addi $s0, $fp, -12
lw $s0, 0($s0)
slt $s0, $s1, $s0
# StackHandler.back_to_last_checkpoint
addi $sp, $sp, 4
# expr_set_node_attributes
addi $sp, $sp, -4
# Address.store()
move $t7, $s0
# Address.load_address()
addi $s0, $fp, -12
sw $t7, 0($s0)
# Address.load_address()
addi $s0, $fp, -12
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _C
# cgen_stmt
# cgen_stmt_block
# cgen_stmt
# cgen_stmt
# cgen_print_stmt
# cgen_lvalue
# Address.load_address()
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall
la $a0, newLine
li $v0, 4
syscall
# cgen_stmt
# cgen_stmt
# cgen_expr_assign
# StackHandler.add_checkpoint
# cgen_lvalue
# cgen_expr_add
# StackHandler.add_checkpoint
# cgen_lvalue
# cgen_constant
# cgen_constant_int
# expr_set_node_attributes
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
# Address.store()
move $t7, $s0
# Address.load_address()
addi $s0, $fp, -12
sw $t7, 0($s0)
# Address.load()
# Address.load_address()
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
# Address.load()
# Address.load_address()
addi $s0, $fp, -12
lw $s0, 0($s0)
add $s0, $s1, $s0
# StackHandler.back_to_last_checkpoint
addi $sp, $sp, 4
# expr_set_node_attributes
addi $sp, $sp, -4
# Address.store()
move $t7, $s0
# Address.load_address()
addi $s0, $fp, -12
sw $t7, 0($s0)
# Address.load()
# Address.load_address()
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
# Address.store()
move $t7, $s0
# Address.load_address()
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
# StackHandler.back_to_last_checkpoint
addi $sp, $sp, 4
# expr_set_node_attributes
addi $sp, $sp, -4
# Address.store()
move $t7, $s0
# Address.load_address()
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
j _B
_C :
addi $sp, $sp, 4
li $v0, 10
syscall
.data
newLine:
    .asciiz "\n"
space:
    .asciiz " "
null:
    .space 8


