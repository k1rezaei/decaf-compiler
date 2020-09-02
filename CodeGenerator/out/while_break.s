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
_C :
addi $sp, $sp, -4
li $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _D
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
bne $t3, $t2, _Z
j _Y
_Z :
li $t3, 0
bne $t3, $t2, _BA
j _Y
_BA :
li $t3, 10
bne $t3, $t2, _F
j _Y
_F :
li $t3, 45
bne $t3, $t2, _G
li $t1, 1
j _H
_G :
li $t3, 43
bne $t3, $t2, _I
_H :
lb $t2, 0($a0)
addi $a0, $a0, 1
_I :
li $t3, 13
bne $t2, $t3, _BB
j _Y
_BB :
li $t3, 0
bne $t2, $t3, _BC
j _Y
_BC :
li $t3, 10
bne $t2, $t3, _W
j _Y
_W :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _J
li $t1, -1
j _Q
_J :
li $t3, 10
bgt $t3, $t2, _K
li $t1, -1
j _Q
_K :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _Q
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BD
j _Y
_BD :
li $t3, 0
bne $t2, $t3, _BE
j _Y
_BE :
li $t3, 10
bne $t2, $t3, _L
j _Y
_L :
li $t3, 88
beq $t2, $t3, _P
li $t3, 120
beq $t2, $t3, _P
j _M
_P :
li $t4, 16
j _Q
_M :
li $t3, 48
bge $t2, $t3, _N
li $t1, -1
j _Q
_N :
li $t3, 57
ble $t2, $t3, _O
li $t1, -1
j _Q
_O :
addi $t2, $t2, -48
move $t0, $t2
_Q :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BF
j _X
_BF :
li $t3, 0
bne $t2, $t3, _BG
j _X
_BG :
li $t3, 10
bne $t2, $t3, _R
j _X
_R :
li $t3, 48
blt $t2, $t3, _U
li $t3, 57
bgt $t2, $t3, _S
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _Q
_S :
li $t3, 65
blt $t2, $t3, _U
li $t3, 70
bgt $t2, $t3, _T
addi $t2, $t2, -55
bge $t2, $t4, _U
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _Q
_T :
li $t3, 97
blt $t2, $t3, _U
li $t3, 102
bgt $t2, $t3, _U
addi $t2, $t2, -87
bge $t2, $t4, _U
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _Q
_U :
li $t1, -1
j _Q
_X :
li $t4, -1
bne $t4, $t1, _V
li $t0, 0
j _Y
_V :
li $t4, 1
bne $t4, $t1, _Y
sub $t0, $zero, $t0
_Y :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 2
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
xor $t0, $s0, $s1
slt $t1, $t0, $zero
slt $t0, $zero, $t0
or $t0, $t0, $t1
li $t1, 1
sub $s0, $t1, $t0

addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _E
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 2
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
j _D
_E :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
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
j _C
_D :
li $t6, 0
add $t6, $t6, $fp
move $sp, $t6
_BH :
addi $sp, $sp, -4
li $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _BI
_BJ :
addi $sp, $sp, -4
li $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _BK
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
bne $t3, $t2, _CG
j _CF
_CG :
li $t3, 0
bne $t3, $t2, _CH
j _CF
_CH :
li $t3, 10
bne $t3, $t2, _BM
j _CF
_BM :
li $t3, 45
bne $t3, $t2, _BN
li $t1, 1
j _BO
_BN :
li $t3, 43
bne $t3, $t2, _BP
_BO :
lb $t2, 0($a0)
addi $a0, $a0, 1
_BP :
li $t3, 13
bne $t2, $t3, _CI
j _CF
_CI :
li $t3, 0
bne $t2, $t3, _CJ
j _CF
_CJ :
li $t3, 10
bne $t2, $t3, _CD
j _CF
_CD :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _BQ
li $t1, -1
j _BX
_BQ :
li $t3, 10
bgt $t3, $t2, _BR
li $t1, -1
j _BX
_BR :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _BX
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CK
j _CF
_CK :
li $t3, 0
bne $t2, $t3, _CL
j _CF
_CL :
li $t3, 10
bne $t2, $t3, _BS
j _CF
_BS :
li $t3, 88
beq $t2, $t3, _BW
li $t3, 120
beq $t2, $t3, _BW
j _BT
_BW :
li $t4, 16
j _BX
_BT :
li $t3, 48
bge $t2, $t3, _BU
li $t1, -1
j _BX
_BU :
li $t3, 57
ble $t2, $t3, _BV
li $t1, -1
j _BX
_BV :
addi $t2, $t2, -48
move $t0, $t2
_BX :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CM
j _CE
_CM :
li $t3, 0
bne $t2, $t3, _CN
j _CE
_CN :
li $t3, 10
bne $t2, $t3, _BY
j _CE
_BY :
li $t3, 48
blt $t2, $t3, _CB
li $t3, 57
bgt $t2, $t3, _BZ
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BX
_BZ :
li $t3, 65
blt $t2, $t3, _CB
li $t3, 70
bgt $t2, $t3, _CA
addi $t2, $t2, -55
bge $t2, $t4, _CB
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BX
_CA :
li $t3, 97
blt $t2, $t3, _CB
li $t3, 102
bgt $t2, $t3, _CB
addi $t2, $t2, -87
bge $t2, $t4, _CB
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BX
_CB :
li $t1, -1
j _BX
_CE :
li $t4, -1
bne $t4, $t1, _CC
li $t0, 0
j _CF
_CC :
li $t4, 1
bne $t4, $t1, _CF
sub $t0, $zero, $t0
_CF :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 2
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
xor $t0, $s0, $s1
slt $t1, $t0, $zero
slt $t0, $zero, $t0
or $t0, $t0, $t1
li $t1, 1
sub $s0, $t1, $t0

addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _BL
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 4
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
j _BK
_BL :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 3
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
j _BJ
_BK :
li $t6, 0
add $t6, $t6, $fp
move $sp, $t6
_CO :
addi $sp, $sp, -4
li $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CP
addi $sp, $sp, -4
li $s0, 0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CQ
j _CR
_CQ :
j _CP
_CR :
addi $sp, $sp, -4
la $s0, _CS
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
j _CO
_CP :
li $t6, 0
add $t6, $t6, $fp
move $sp, $t6
j _BI
j _BH
_BI :
li $t6, 0
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
la $s0, _CU
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
_CS:
    .asciiz "holy"
_CT:
    .space 4
_CU:
    .asciiz "goody goody"
_CV:
    .space 1

