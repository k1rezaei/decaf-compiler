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
li $t0, 0
li $t1, 0
li $t4, 10
syscall
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t3, $t2, _W
j _V
_W :
li $t3, 0
bne $t3, $t2, _X
j _V
_X :
li $t3, 10
bne $t3, $t2, _C
j _V
_C :
li $t3, 45
bne $t3, $t2, _D
li $t1, 1
j _E
_D :
li $t3, 43
bne $t3, $t2, _F
_E :
lb $t2, 0($a0)
addi $a0, $a0, 1
_F :
li $t3, 13
bne $t2, $t3, _Y
j _V
_Y :
li $t3, 0
bne $t2, $t3, _Z
j _V
_Z :
li $t3, 10
bne $t2, $t3, _T
j _V
_T :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _G
li $t1, -1
j _N
_G :
li $t3, 10
bgt $t3, $t2, _H
li $t1, -1
j _N
_H :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _N
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BA
j _V
_BA :
li $t3, 0
bne $t2, $t3, _BB
j _V
_BB :
li $t3, 10
bne $t2, $t3, _I
j _V
_I :
li $t3, 88
beq $t2, $t3, _M
li $t3, 120
beq $t2, $t3, _M
j _J
_M :
li $t4, 16
j _N
_J :
li $t3, 48
bge $t2, $t3, _K
li $t1, -1
j _N
_K :
li $t3, 57
ble $t2, $t3, _L
li $t1, -1
j _N
_L :
addi $t2, $t2, -48
move $t0, $t2
_N :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BC
j _U
_BC :
li $t3, 0
bne $t2, $t3, _BD
j _U
_BD :
li $t3, 10
bne $t2, $t3, _O
j _U
_O :
li $t3, 48
blt $t2, $t3, _R
li $t3, 57
bgt $t2, $t3, _P
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _N
_P :
li $t3, 65
blt $t2, $t3, _R
li $t3, 70
bgt $t2, $t3, _Q
addi $t2, $t2, -55
bge $t2, $t4, _R
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _N
_Q :
li $t3, 97
blt $t2, $t3, _R
li $t3, 102
bgt $t2, $t3, _R
addi $t2, $t2, -87
bge $t2, $t4, _R
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _N
_R :
li $t1, -1
j _N
_U :
li $t4, -1
bne $t4, $t1, _S
li $t0, 0
j _V
_S :
li $t4, 1
bne $t4, $t1, _V
sub $t0, $zero, $t0
_V :
move $s0, $t0
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

