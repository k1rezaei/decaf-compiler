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
addi $sp, $sp, -4
li $v0, 8
li $a1, 400
la $a0, __read
syscall
li $a1, 1
li $a2, 0
_F :
lbu $a2, 0($a0)
li $a3, 10
beq $a2, $a3, _G
li $a3, 13
beq $a2, $a3, _G
li $a3, 0
beq $a2, $a3, _G
addi $a1, $a1, 1
addi $a0, $a0, 1
j _F
_G :
li $v0, 9
move $a0, $a1
syscall
move $v1, $v0
la $a0, __read
_H :
lbu $a2, 0($a0)
sb $zero, 0($a0)
li $a3, 10
beq $a2, $a3, _I
li $a3, 13
beq $a2, $a3, _I
li $a3, 0
beq $a2, $a3, _I
sb $a2, 0($v0)
addi $v0, $v0, 1
addi $a0, $a0, 1
j _H
_I :
sw $v1, 0($sp)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
li $v0, 8
li $a1, 400
la $a0, __read
li $t0, 0
li $t1, 0
li $t4, 10
syscall
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t3, $t2, _BD
j _BC
_BD :
li $t3, 0
bne $t3, $t2, _BE
j _BC
_BE :
li $t3, 10
bne $t3, $t2, _J
j _BC
_J :
li $t3, 45
bne $t3, $t2, _K
li $t1, 1
j _L
_K :
li $t3, 43
bne $t3, $t2, _M
_L :
lb $t2, 0($a0)
addi $a0, $a0, 1
_M :
li $t3, 13
bne $t2, $t3, _BF
j _BC
_BF :
li $t3, 0
bne $t2, $t3, _BG
j _BC
_BG :
li $t3, 10
bne $t2, $t3, _BA
j _BC
_BA :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _N
li $t1, -1
j _U
_N :
li $t3, 10
bgt $t3, $t2, _O
li $t1, -1
j _U
_O :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _U
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BH
j _BC
_BH :
li $t3, 0
bne $t2, $t3, _BI
j _BC
_BI :
li $t3, 10
bne $t2, $t3, _P
j _BC
_P :
li $t3, 88
beq $t2, $t3, _T
li $t3, 120
beq $t2, $t3, _T
j _Q
_T :
li $t4, 16
j _U
_Q :
li $t3, 48
bge $t2, $t3, _R
li $t1, -1
j _U
_R :
li $t3, 57
ble $t2, $t3, _S
li $t1, -1
j _U
_S :
addi $t2, $t2, -48
move $t0, $t2
_U :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BJ
j _BB
_BJ :
li $t3, 0
bne $t2, $t3, _BK
j _BB
_BK :
li $t3, 10
bne $t2, $t3, _V
j _BB
_V :
li $t3, 48
blt $t2, $t3, _Y
li $t3, 57
bgt $t2, $t3, _W
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _U
_W :
li $t3, 65
blt $t2, $t3, _Y
li $t3, 70
bgt $t2, $t3, _X
addi $t2, $t2, -55
bge $t2, $t4, _Y
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _U
_X :
li $t3, 97
blt $t2, $t3, _Y
li $t3, 102
bgt $t2, $t3, _Y
addi $t2, $t2, -87
bge $t2, $t4, _Y
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _U
_Y :
li $t1, -1
j _U
_BB :
li $t4, -1
bne $t4, $t1, _Z
li $t0, 0
j _BC
_Z :
li $t4, 1
bne $t4, $t1, _BC
sub $t0, $zero, $t0
_BC :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
li $a0, 12
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
la $s0, Person
sw $s0, 0($v0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
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
addi $fp, $fp, 24
addi $s0, $fp, -24
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 24
addi $s0, $fp, -24
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 20
addi $s0, $fp, -20
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, 12
move $sp, $fp
jr $ra
Person__setName :
move $fp, $sp
addi $s0, $fp, 8
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
move $sp, $fp
jr $ra
Person__setAge :
move $fp, $sp
addi $s0, $fp, 8
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
Person__print :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _BO
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _BQ
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
la $s1, Person
la $s0, Person__setName
sw $s0, 0($s1)
la $s0, Person__setAge
sw $s0, 4($s1)
la $s0, Person__print
sw $s0, 8($s1)
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
_BO:
    .asciiz "Name: "
_BP:
    .space 2
_BQ:
    .asciiz " Age: "
_BR:
    .space 2
Person:
    .word 0,0,0,0

