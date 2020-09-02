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
addi $sp, $sp, -4
li $a0, 4
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
la $s0, d
sw $s0, 0($v0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 5
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 28
addi $s0, $fp, -28
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 24
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, 4
move $sp, $fp
jr $ra
c__f :
move $fp, $sp
addi $s0, $fp, 8
lw $a0, 0($s0)
li $v0, 1
syscall
addi $s0, $fp, 12
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
move $sp, $fp
jr $ra
c__g :
move $fp, $sp
addi $s0, $fp, 8
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $s0, $fp, 12
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
move $sp, $fp
jr $ra
d__f :
move $fp, $sp
addi $s0, $fp, 8
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
la $t0, _I
l.s $f0, 0($t0)
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
addi $s0, $fp, 12
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
move $sp, $fp
jr $ra
main: move $t8, $sp
addi $sp, $sp, -4
la $s1, c
la $s0, c__f
sw $s0, 0($s1)
la $s0, c__g
sw $s0, 4($s1)
la $s1, d
la $s0, d__f
sw $s0, 0($s1)
la $s0, c__g
sw $s0, 4($s1)
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
_I:
    .float 2.3
c:
    .word 0,0,0
d:
    .word 0,0,0

