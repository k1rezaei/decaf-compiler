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
_B :
move $fp, $sp
addi $sp, $sp, -4
li $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
move $sp, $fp
jr $ra
_C :
move $fp, $sp
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 2
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
move $sp, $fp
jr $ra
_D :
move $fp, $sp
addi $sp, $sp, -4
la $t0, _G
l.s $f0, 0($t0)
addi $s0, $fp, -4
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
mtc1 $s0, $f0
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
move $sp, $fp
jr $ra
_E :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _H
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
move $sp, $fp
jr $ra
_____main :
move $fp, $sp
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
la $s0 _E
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 4
addi $s0, $fp, -4
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
la $s0 _D
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 4
addi $s0, $fp, -4
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -4
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -4
l.s $f12, 0($s0)
li $v0, 2
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
la $s0 _C
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 4
addi $s0, $fp, -4
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
la $s0 _B
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 4
addi $s0, $fp, -4
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
beqz $s0, _J
la $a0, __true
j _K
_J :
la $a0, __false
_K :
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
_G:
    .float 5.1234
_H:
    .asciiz "f"
_I:
    .space 3

