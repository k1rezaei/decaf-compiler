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
addiu $s0, $s0, 2
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
# cgen_print_stmt
# cgen_lvalue
# Address.load_address()
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, 4
li $v0, 10
syscall
.data
null:
    .space 8


