.text
j main
___array_length:
lw $s0, 4($fp)
lw $v0, 0($s0)
jr $ra
___btoi:
lw $v0, 4($fp)
jr $ra
___itob:
lw $s0, 4($fp)
li $v0, 0
beqz $s0, ___itob_jump
li $v0, 1
___itob_jump: jr $ra
___dtoi:
l.s $f0, 4($fp)
round.w.s $f0, $f0
mfc1 $v0, $f0
jr $ra
___itod:
lw $s0, 4($fp)
mtc1 $s0, $f0
cvt.s.w $f0, $f0
mfc1 $v0, $f0
jr $ra
_____main :
move $fp, $sp
addi $sp, $sp, -4
li $v0, 8
li $a1, 400
la $a0, __read
syscall
li $a1, 1
li $a2, 0
_C :
lbu $a2, 0($a0)
li $a3, 10
beq $a2, $a3, _D
li $a3, 13
beq $a2, $a3, _D
li $a3, 0
beq $a2, $a3, _D
addi $a1, $a1, 1
addi $a0, $a0, 1
j _C
_D :
li $v0, 9
move $a0, $a1
syscall
move $v1, $v0
la $a0, __read
_E :
lbu $a2, 0($a0)
sb $zero, 0($a0)
li $a3, 10
beq $a2, $a3, _F
li $a3, 13
beq $a2, $a3, _F
li $a3, 0
beq $a2, $a3, _F
sb $a2, 0($v0)
addi $v0, $v0, 1
addi $a0, $a0, 1
j _E
_F :
sw $v1, 0($sp)
addi $s0, $fp, -4
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
move $sp, $fp
jr $ra
main: move $t8, $sp
addi $sp, $sp, -4
jal _____main
li $v0, 10
syscall

.data
__read:
    .space 400
__newLine:
    .asciiz "\n"
__space:
    .asciiz " "
 __true:
    .asciiz "true"
__false:
    .asciiz "false"
__null:
    .word 0
__chert:
    .word 0

