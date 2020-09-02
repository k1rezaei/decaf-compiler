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
addi $sp, $sp, -4
li $a0, 16
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
la $s0, Cow
sw $s0, 0($v0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
la $s0, _H
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 5
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, -4
la $s0, __null
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 32
addi $s0, $fp, -32
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 24
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
la $s0, _J
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
la $s0, _L
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 16
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
beqz $s0, _N
la $a0, __true
j _O
_N :
la $a0, __false
_O :
li $v0, 4
syscall
addi $sp, $sp, 4
addi $sp, $sp, -4
la $s0, _P
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, 8
move $sp, $fp
jr $ra
Animal__InitAnimal :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 8
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, 12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
move $sp, $fp
jr $ra
Animal__GetHeight :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
move $sp, $fp
jr $ra
Animal__GetMom :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
move $sp, $fp
jr $ra
Cow__InitCow :
move $fp, $sp
addi $sp, $sp, -4
li $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, 12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 16
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
move $sp, $fp
jr $ra
Cow__IsSpottedCow :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
move $sp, $fp
jr $ra
main: move $t8, $sp
addi $sp, $sp, -4
la $s1, Animal
la $s0, Animal__InitAnimal
sw $s0, 0($s1)
la $s0, Animal__GetHeight
sw $s0, 4($s1)
la $s0, Animal__GetMom
sw $s0, 8($s1)
la $s1, Cow
la $s0, Animal__InitAnimal
sw $s0, 0($s1)
la $s0, Animal__GetHeight
sw $s0, 4($s1)
la $s0, Animal__GetMom
sw $s0, 8($s1)
la $s0, Cow__InitCow
sw $s0, 12($s1)
la $s0, Cow__IsSpottedCow
sw $s0, 16($s1)
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
_H:
    .asciiz "before"
_I:
    .space 2
_J:
    .asciiz "after"
_K:
    .space 3
_L:
    .asciiz "spots: "
_M:
    .space 1
_P:
    .asciiz "    height: "
_Q:
    .space 4
Animal:
    .word 0,0,0,0
Cow:
    .word 0,0,0,0,0,0

