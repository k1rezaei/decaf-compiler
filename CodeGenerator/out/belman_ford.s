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
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
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
_E :
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $t8-8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _F
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
la $s0 _C
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 12
addi $s0, $fp, -12
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
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
j _E
_F :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, 4
move $sp, $fp
jr $ra
_C :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $t8-16
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $t8-4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $t8-20
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $t8-12
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $t8-4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _G
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $t8-12
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $t8-16
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $sp, $sp, 4
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
addi $s0, $t8-4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $t8-20
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
_G :
move $sp, $fp
jr $ra
_____main :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
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
bne $t3, $t2, _BB
j _BA
_BB :
li $t3, 0
bne $t3, $t2, _BC
j _BA
_BC :
li $t3, 10
bne $t3, $t2, _H
j _BA
_H :
li $t3, 45
bne $t3, $t2, _I
li $t1, 1
j _J
_I :
li $t3, 43
bne $t3, $t2, _K
_J :
lb $t2, 0($a0)
addi $a0, $a0, 1
_K :
li $t3, 13
bne $t2, $t3, _BD
j _BA
_BD :
li $t3, 0
bne $t2, $t3, _BE
j _BA
_BE :
li $t3, 10
bne $t2, $t3, _Y
j _BA
_Y :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _L
li $t1, -1
j _S
_L :
li $t3, 10
bgt $t3, $t2, _M
li $t1, -1
j _S
_M :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _S
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BF
j _BA
_BF :
li $t3, 0
bne $t2, $t3, _BG
j _BA
_BG :
li $t3, 10
bne $t2, $t3, _N
j _BA
_N :
li $t3, 88
beq $t2, $t3, _R
li $t3, 120
beq $t2, $t3, _R
j _O
_R :
li $t4, 16
j _S
_O :
li $t3, 48
bge $t2, $t3, _P
li $t1, -1
j _S
_P :
li $t3, 57
ble $t2, $t3, _Q
li $t1, -1
j _S
_Q :
addi $t2, $t2, -48
move $t0, $t2
_S :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BH
j _Z
_BH :
li $t3, 0
bne $t2, $t3, _BI
j _Z
_BI :
li $t3, 10
bne $t2, $t3, _T
j _Z
_T :
li $t3, 48
blt $t2, $t3, _W
li $t3, 57
bgt $t2, $t3, _U
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _S
_U :
li $t3, 65
blt $t2, $t3, _W
li $t3, 70
bgt $t2, $t3, _V
addi $t2, $t2, -55
bge $t2, $t4, _W
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _S
_V :
li $t3, 97
blt $t2, $t3, _W
li $t3, 102
bgt $t2, $t3, _W
addi $t2, $t2, -87
bge $t2, $t4, _W
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _S
_W :
li $t1, -1
j _S
_Z :
li $t4, -1
bne $t4, $t1, _X
li $t0, 0
j _BA
_X :
li $t4, 1
bne $t4, $t1, _BA
sub $t0, $zero, $t0
_BA :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
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
bne $t3, $t2, _CD
j _CC
_CD :
li $t3, 0
bne $t3, $t2, _CE
j _CC
_CE :
li $t3, 10
bne $t3, $t2, _BJ
j _CC
_BJ :
li $t3, 45
bne $t3, $t2, _BK
li $t1, 1
j _BL
_BK :
li $t3, 43
bne $t3, $t2, _BM
_BL :
lb $t2, 0($a0)
addi $a0, $a0, 1
_BM :
li $t3, 13
bne $t2, $t3, _CF
j _CC
_CF :
li $t3, 0
bne $t2, $t3, _CG
j _CC
_CG :
li $t3, 10
bne $t2, $t3, _CA
j _CC
_CA :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _BN
li $t1, -1
j _BU
_BN :
li $t3, 10
bgt $t3, $t2, _BO
li $t1, -1
j _BU
_BO :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _BU
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CH
j _CC
_CH :
li $t3, 0
bne $t2, $t3, _CI
j _CC
_CI :
li $t3, 10
bne $t2, $t3, _BP
j _CC
_BP :
li $t3, 88
beq $t2, $t3, _BT
li $t3, 120
beq $t2, $t3, _BT
j _BQ
_BT :
li $t4, 16
j _BU
_BQ :
li $t3, 48
bge $t2, $t3, _BR
li $t1, -1
j _BU
_BR :
li $t3, 57
ble $t2, $t3, _BS
li $t1, -1
j _BU
_BS :
addi $t2, $t2, -48
move $t0, $t2
_BU :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CJ
j _CB
_CJ :
li $t3, 0
bne $t2, $t3, _CK
j _CB
_CK :
li $t3, 10
bne $t2, $t3, _BV
j _CB
_BV :
li $t3, 48
blt $t2, $t3, _BY
li $t3, 57
bgt $t2, $t3, _BW
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BU
_BW :
li $t3, 65
blt $t2, $t3, _BY
li $t3, 70
bgt $t2, $t3, _BX
addi $t2, $t2, -55
bge $t2, $t4, _BY
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BU
_BX :
li $t3, 97
blt $t2, $t3, _BY
li $t3, 102
bgt $t2, $t3, _BY
addi $t2, $t2, -87
bge $t2, $t4, _BY
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BU
_BY :
li $t1, -1
j _BU
_CB :
li $t4, -1
bne $t4, $t1, _BZ
li $t0, 0
j _CC
_BZ :
li $t4, 1
bne $t4, $t1, _CC
sub $t0, $zero, $t0
_CC :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -4
lw $s0, 0($s0)
li $t0, 4
addi $s0, $s0, 1
mult $s0, $t0
mflo $a0
li $v0, 9
syscall
addi $s0, $s0, -1
sw $s0, 0($v0)
addi $s0, $s0, 1
move $s0, $v0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $t8-8
lw $s0, 0($s0)
li $t0, 4
addi $s0, $s0, 1
mult $s0, $t0
mflo $a0
li $v0, 9
syscall
addi $s0, $s0, -1
sw $s0, 0($v0)
addi $s0, $s0, 1
move $s0, $v0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $t8-8
lw $s0, 0($s0)
li $t0, 4
addi $s0, $s0, 1
mult $s0, $t0
mflo $a0
li $v0, 9
syscall
addi $s0, $s0, -1
sw $s0, 0($v0)
addi $s0, $s0, 1
move $s0, $v0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $t8-8
lw $s0, 0($s0)
li $t0, 4
addi $s0, $s0, 1
mult $s0, $t0
mflo $a0
li $v0, 9
syscall
addi $s0, $s0, -1
sw $s0, 0($v0)
addi $s0, $s0, 1
move $s0, $v0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-20
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
_CL :
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $t8-8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CM
addi $sp, $sp, -4
la $s0, _CN
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _CP
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
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
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
bne $t3, $t2, _DL
j _DK
_DL :
li $t3, 0
bne $t3, $t2, _DM
j _DK
_DM :
li $t3, 10
bne $t3, $t2, _CR
j _DK
_CR :
li $t3, 45
bne $t3, $t2, _CS
li $t1, 1
j _CT
_CS :
li $t3, 43
bne $t3, $t2, _CU
_CT :
lb $t2, 0($a0)
addi $a0, $a0, 1
_CU :
li $t3, 13
bne $t2, $t3, _DN
j _DK
_DN :
li $t3, 0
bne $t2, $t3, _DO
j _DK
_DO :
li $t3, 10
bne $t2, $t3, _DI
j _DK
_DI :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _CV
li $t1, -1
j _DC
_CV :
li $t3, 10
bgt $t3, $t2, _CW
li $t1, -1
j _DC
_CW :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _DC
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _DP
j _DK
_DP :
li $t3, 0
bne $t2, $t3, _DQ
j _DK
_DQ :
li $t3, 10
bne $t2, $t3, _CX
j _DK
_CX :
li $t3, 88
beq $t2, $t3, _DB
li $t3, 120
beq $t2, $t3, _DB
j _CY
_DB :
li $t4, 16
j _DC
_CY :
li $t3, 48
bge $t2, $t3, _CZ
li $t1, -1
j _DC
_CZ :
li $t3, 57
ble $t2, $t3, _DA
li $t1, -1
j _DC
_DA :
addi $t2, $t2, -48
move $t0, $t2
_DC :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _DR
j _DJ
_DR :
li $t3, 0
bne $t2, $t3, _DS
j _DJ
_DS :
li $t3, 10
bne $t2, $t3, _DD
j _DJ
_DD :
li $t3, 48
blt $t2, $t3, _DG
li $t3, 57
bgt $t2, $t3, _DE
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DC
_DE :
li $t3, 65
blt $t2, $t3, _DG
li $t3, 70
bgt $t2, $t3, _DF
addi $t2, $t2, -55
bge $t2, $t4, _DG
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DC
_DF :
li $t3, 97
blt $t2, $t3, _DG
li $t3, 102
bgt $t2, $t3, _DG
addi $t2, $t2, -87
bge $t2, $t4, _DG
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DC
_DG :
li $t1, -1
j _DC
_DJ :
li $t4, -1
bne $t4, $t1, _DH
li $t0, 0
j _DK
_DH :
li $t4, 1
bne $t4, $t1, _DK
sub $t0, $zero, $t0
_DK :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-16
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 8
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
bne $t3, $t2, _EN
j _EM
_EN :
li $t3, 0
bne $t3, $t2, _EO
j _EM
_EO :
li $t3, 10
bne $t3, $t2, _DT
j _EM
_DT :
li $t3, 45
bne $t3, $t2, _DU
li $t1, 1
j _DV
_DU :
li $t3, 43
bne $t3, $t2, _DW
_DV :
lb $t2, 0($a0)
addi $a0, $a0, 1
_DW :
li $t3, 13
bne $t2, $t3, _EP
j _EM
_EP :
li $t3, 0
bne $t2, $t3, _EQ
j _EM
_EQ :
li $t3, 10
bne $t2, $t3, _EK
j _EM
_EK :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _DX
li $t1, -1
j _EE
_DX :
li $t3, 10
bgt $t3, $t2, _DY
li $t1, -1
j _EE
_DY :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _EE
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _ER
j _EM
_ER :
li $t3, 0
bne $t2, $t3, _ES
j _EM
_ES :
li $t3, 10
bne $t2, $t3, _DZ
j _EM
_DZ :
li $t3, 88
beq $t2, $t3, _ED
li $t3, 120
beq $t2, $t3, _ED
j _EA
_ED :
li $t4, 16
j _EE
_EA :
li $t3, 48
bge $t2, $t3, _EB
li $t1, -1
j _EE
_EB :
li $t3, 57
ble $t2, $t3, _EC
li $t1, -1
j _EE
_EC :
addi $t2, $t2, -48
move $t0, $t2
_EE :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _ET
j _EL
_ET :
li $t3, 0
bne $t2, $t3, _EU
j _EL
_EU :
li $t3, 10
bne $t2, $t3, _EF
j _EL
_EF :
li $t3, 48
blt $t2, $t3, _EI
li $t3, 57
bgt $t2, $t3, _EG
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EE
_EG :
li $t3, 65
blt $t2, $t3, _EI
li $t3, 70
bgt $t2, $t3, _EH
addi $t2, $t2, -55
bge $t2, $t4, _EI
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EE
_EH :
li $t3, 97
blt $t2, $t3, _EI
li $t3, 102
bgt $t2, $t3, _EI
addi $t2, $t2, -87
bge $t2, $t4, _EI
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EE
_EI :
li $t1, -1
j _EE
_EL :
li $t4, -1
bne $t4, $t1, _EJ
li $t0, 0
j _EM
_EJ :
li $t4, 1
bne $t4, $t1, _EM
sub $t0, $zero, $t0
_EM :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-12
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 8
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
bne $t3, $t2, _FP
j _FO
_FP :
li $t3, 0
bne $t3, $t2, _FQ
j _FO
_FQ :
li $t3, 10
bne $t3, $t2, _EV
j _FO
_EV :
li $t3, 45
bne $t3, $t2, _EW
li $t1, 1
j _EX
_EW :
li $t3, 43
bne $t3, $t2, _EY
_EX :
lb $t2, 0($a0)
addi $a0, $a0, 1
_EY :
li $t3, 13
bne $t2, $t3, _FR
j _FO
_FR :
li $t3, 0
bne $t2, $t3, _FS
j _FO
_FS :
li $t3, 10
bne $t2, $t3, _FM
j _FO
_FM :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _EZ
li $t1, -1
j _FG
_EZ :
li $t3, 10
bgt $t3, $t2, _FA
li $t1, -1
j _FG
_FA :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _FG
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _FT
j _FO
_FT :
li $t3, 0
bne $t2, $t3, _FU
j _FO
_FU :
li $t3, 10
bne $t2, $t3, _FB
j _FO
_FB :
li $t3, 88
beq $t2, $t3, _FF
li $t3, 120
beq $t2, $t3, _FF
j _FC
_FF :
li $t4, 16
j _FG
_FC :
li $t3, 48
bge $t2, $t3, _FD
li $t1, -1
j _FG
_FD :
li $t3, 57
ble $t2, $t3, _FE
li $t1, -1
j _FG
_FE :
addi $t2, $t2, -48
move $t0, $t2
_FG :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _FV
j _FN
_FV :
li $t3, 0
bne $t2, $t3, _FW
j _FN
_FW :
li $t3, 10
bne $t2, $t3, _FH
j _FN
_FH :
li $t3, 48
blt $t2, $t3, _FK
li $t3, 57
bgt $t2, $t3, _FI
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _FG
_FI :
li $t3, 65
blt $t2, $t3, _FK
li $t3, 70
bgt $t2, $t3, _FJ
addi $t2, $t2, -55
bge $t2, $t4, _FK
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _FG
_FJ :
li $t3, 97
blt $t2, $t3, _FK
li $t3, 102
bgt $t2, $t3, _FK
addi $t2, $t2, -87
bge $t2, $t4, _FK
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _FG
_FK :
li $t1, -1
j _FG
_FN :
li $t4, -1
bne $t4, $t1, _FL
li $t0, 0
j _FO
_FL :
li $t4, 1
bne $t4, $t1, _FO
sub $t0, $zero, $t0
_FO :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-20
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
j _CL
_CM :
li $t6, -8
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
_FX :
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _FY
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
xor $t0, $s0, $s1
slt $t1, $t0, $zero
slt $t0, $zero, $t0
or $t0, $t0, $t1
li $t1, 1
sub $s0, $t1, $t0

addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _FZ
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
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
addi $s0, $t8-4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
j _GA
_FZ :
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 15
addiu $s0, $s0, 16960
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
_GA :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
j _FX
_FY :
li $t6, -8
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
_GB :
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _GC
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
la $s0 _B
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 12
addi $s0, $fp, -12
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
j _GB
_GC :
li $t6, -8
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
_GD :
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _GE
addi $sp, $sp, -4
la $s0, _GF
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _GH
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
addi $s0, $t8-4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
j _GD
_GE :
li $t6, -8
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, 8
move $sp, $fp
jr $ra
main: move $t8, $sp
addi $sp, $sp, -24
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
_CN:
    .asciiz "Write "
_CO:
    .space 2
_CP:
    .asciiz "th edge:"
_CQ:
    .space 4
_GF:
    .asciiz "Distance of "
_GG:
    .space 4
_GH:
    .asciiz "th node: "
_GI:
    .space 3

