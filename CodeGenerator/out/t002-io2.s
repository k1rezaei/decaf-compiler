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
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
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
lui $s0, 0
addiu $s0, $s0, 1
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
_C :
addi $sp, $sp, -4
li $s0, 1
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _D
addi $sp, $sp, -4
la $s0, _E
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, -12
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _G
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
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
bne $t3, $t2, _BC
j _BB
_BC :
li $t3, 0
bne $t3, $t2, _BD
j _BB
_BD :
li $t3, 10
bne $t3, $t2, _I
j _BB
_I :
li $t3, 45
bne $t3, $t2, _J
li $t1, 1
j _K
_J :
li $t3, 43
bne $t3, $t2, _L
_K :
lb $t2, 0($a0)
addi $a0, $a0, 1
_L :
li $t3, 13
bne $t2, $t3, _BE
j _BB
_BE :
li $t3, 0
bne $t2, $t3, _BF
j _BB
_BF :
li $t3, 10
bne $t2, $t3, _Z
j _BB
_Z :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _M
li $t1, -1
j _T
_M :
li $t3, 10
bgt $t3, $t2, _N
li $t1, -1
j _T
_N :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _T
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BG
j _BB
_BG :
li $t3, 0
bne $t2, $t3, _BH
j _BB
_BH :
li $t3, 10
bne $t2, $t3, _O
j _BB
_O :
li $t3, 88
beq $t2, $t3, _S
li $t3, 120
beq $t2, $t3, _S
j _P
_S :
li $t4, 16
j _T
_P :
li $t3, 48
bge $t2, $t3, _Q
li $t1, -1
j _T
_Q :
li $t3, 57
ble $t2, $t3, _R
li $t1, -1
j _T
_R :
addi $t2, $t2, -48
move $t0, $t2
_T :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BI
j _BA
_BI :
li $t3, 0
bne $t2, $t3, _BJ
j _BA
_BJ :
li $t3, 10
bne $t2, $t3, _U
j _BA
_U :
li $t3, 48
blt $t2, $t3, _X
li $t3, 57
bgt $t2, $t3, _V
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _T
_V :
li $t3, 65
blt $t2, $t3, _X
li $t3, 70
bgt $t2, $t3, _W
addi $t2, $t2, -55
bge $t2, $t4, _X
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _T
_W :
li $t3, 97
blt $t2, $t3, _X
li $t3, 102
bgt $t2, $t3, _X
addi $t2, $t2, -87
bge $t2, $t4, _X
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _T
_X :
li $t1, -1
j _T
_BA :
li $t4, -1
bne $t4, $t1, _Y
li $t0, 0
j _BB
_Y :
li $t4, 1
bne $t4, $t1, _BB
sub $t0, $zero, $t0
_BB :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
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
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -16
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _BK
j _D
_BK :
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
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
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -16
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
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
j _C
_D :
li $t6, -12
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
la $s0, _BL
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, -12
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _BN
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, 12
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
_E:
    .asciiz "Please enter the #"
_F:
    .space 2
_G:
    .asciiz " number:"
_H:
    .space 4
_BL:
    .asciiz "Sum of "
_BM:
    .space 1
_BN:
    .asciiz " items is: "
_BO:
    .space 1

