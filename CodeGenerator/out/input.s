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
_E :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
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
_G :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 2
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
div $s1, $s0
mfhi $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
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

addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _H
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
mult $s0, $s1
mflo $s0
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
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 2
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
div $s1, $s0
mflo $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
j _G
_H :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
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
addi $sp, $sp, -4
addi $sp, $sp, -4
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
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -20
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
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
bne $t3, $t2, _CE
j _CD
_CE :
li $t3, 0
bne $t3, $t2, _CF
j _CD
_CF :
li $t3, 10
bne $t3, $t2, _BK
j _CD
_BK :
li $t3, 45
bne $t3, $t2, _BL
li $t1, 1
j _BM
_BL :
li $t3, 43
bne $t3, $t2, _BN
_BM :
lb $t2, 0($a0)
addi $a0, $a0, 1
_BN :
li $t3, 13
bne $t2, $t3, _CG
j _CD
_CG :
li $t3, 0
bne $t2, $t3, _CH
j _CD
_CH :
li $t3, 10
bne $t2, $t3, _CB
j _CD
_CB :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _BO
li $t1, -1
j _BV
_BO :
li $t3, 10
bgt $t3, $t2, _BP
li $t1, -1
j _BV
_BP :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _BV
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CI
j _CD
_CI :
li $t3, 0
bne $t2, $t3, _CJ
j _CD
_CJ :
li $t3, 10
bne $t2, $t3, _BQ
j _CD
_BQ :
li $t3, 88
beq $t2, $t3, _BU
li $t3, 120
beq $t2, $t3, _BU
j _BR
_BU :
li $t4, 16
j _BV
_BR :
li $t3, 48
bge $t2, $t3, _BS
li $t1, -1
j _BV
_BS :
li $t3, 57
ble $t2, $t3, _BT
li $t1, -1
j _BV
_BT :
addi $t2, $t2, -48
move $t0, $t2
_BV :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CK
j _CC
_CK :
li $t3, 0
bne $t2, $t3, _CL
j _CC
_CL :
li $t3, 10
bne $t2, $t3, _BW
j _CC
_BW :
li $t3, 48
blt $t2, $t3, _BZ
li $t3, 57
bgt $t2, $t3, _BX
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BV
_BX :
li $t3, 65
blt $t2, $t3, _BZ
li $t3, 70
bgt $t2, $t3, _BY
addi $t2, $t2, -55
bge $t2, $t4, _BZ
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BV
_BY :
li $t3, 97
blt $t2, $t3, _BZ
li $t3, 102
bgt $t2, $t3, _BZ
addi $t2, $t2, -87
bge $t2, $t4, _BZ
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BV
_BZ :
li $t1, -1
j _BV
_CC :
li $t4, -1
bne $t4, $t1, _CA
li $t0, 0
j _CD
_CA :
li $t4, 1
bne $t4, $t1, _CD
sub $t0, $zero, $t0
_CD :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -20
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
li $a0, 12
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
la $s0, Fen
sw $s0, 0($v0)
addi $s0, $fp, -20
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $sp, $sp, 4
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
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $sp, $sp, 4
_CM :
addi $s0, $fp, -12
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
la $s0 ___itob
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 24
addi $s0, $fp, -24
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -20
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CN
addi $sp, $sp, -4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -24
lw $s0, 0($s0)
sub $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
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
bne $t3, $t2, _DI
j _DH
_DI :
li $t3, 0
bne $t3, $t2, _DJ
j _DH
_DJ :
li $t3, 10
bne $t3, $t2, _CO
j _DH
_CO :
li $t3, 45
bne $t3, $t2, _CP
li $t1, 1
j _CQ
_CP :
li $t3, 43
bne $t3, $t2, _CR
_CQ :
lb $t2, 0($a0)
addi $a0, $a0, 1
_CR :
li $t3, 13
bne $t2, $t3, _DK
j _DH
_DK :
li $t3, 0
bne $t2, $t3, _DL
j _DH
_DL :
li $t3, 10
bne $t2, $t3, _DF
j _DH
_DF :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _CS
li $t1, -1
j _CZ
_CS :
li $t3, 10
bgt $t3, $t2, _CT
li $t1, -1
j _CZ
_CT :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _CZ
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _DM
j _DH
_DM :
li $t3, 0
bne $t2, $t3, _DN
j _DH
_DN :
li $t3, 10
bne $t2, $t3, _CU
j _DH
_CU :
li $t3, 88
beq $t2, $t3, _CY
li $t3, 120
beq $t2, $t3, _CY
j _CV
_CY :
li $t4, 16
j _CZ
_CV :
li $t3, 48
bge $t2, $t3, _CW
li $t1, -1
j _CZ
_CW :
li $t3, 57
ble $t2, $t3, _CX
li $t1, -1
j _CZ
_CX :
addi $t2, $t2, -48
move $t0, $t2
_CZ :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _DO
j _DG
_DO :
li $t3, 0
bne $t2, $t3, _DP
j _DG
_DP :
li $t3, 10
bne $t2, $t3, _DA
j _DG
_DA :
li $t3, 48
blt $t2, $t3, _DD
li $t3, 57
bgt $t2, $t3, _DB
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _CZ
_DB :
li $t3, 65
blt $t2, $t3, _DD
li $t3, 70
bgt $t2, $t3, _DC
addi $t2, $t2, -55
bge $t2, $t4, _DD
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _CZ
_DC :
li $t3, 97
blt $t2, $t3, _DD
li $t3, 102
bgt $t2, $t3, _DD
addi $t2, $t2, -87
bge $t2, $t4, _DD
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _CZ
_DD :
li $t1, -1
j _CZ
_DG :
li $t4, -1
bne $t4, $t1, _DE
li $t0, 0
j _DH
_DE :
li $t4, 1
bne $t4, $t1, _DH
sub $t0, $zero, $t0
_DH :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -20
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -24
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
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _DQ
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $sp, $sp, -4
la $s0, _DS
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
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
bne $t3, $t2, _EO
j _EN
_EO :
li $t3, 0
bne $t3, $t2, _EP
j _EN
_EP :
li $t3, 10
bne $t3, $t2, _DU
j _EN
_DU :
li $t3, 45
bne $t3, $t2, _DV
li $t1, 1
j _DW
_DV :
li $t3, 43
bne $t3, $t2, _DX
_DW :
lb $t2, 0($a0)
addi $a0, $a0, 1
_DX :
li $t3, 13
bne $t2, $t3, _EQ
j _EN
_EQ :
li $t3, 0
bne $t2, $t3, _ER
j _EN
_ER :
li $t3, 10
bne $t2, $t3, _EL
j _EN
_EL :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _DY
li $t1, -1
j _EF
_DY :
li $t3, 10
bgt $t3, $t2, _DZ
li $t1, -1
j _EF
_DZ :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _EF
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _ES
j _EN
_ES :
li $t3, 0
bne $t2, $t3, _ET
j _EN
_ET :
li $t3, 10
bne $t2, $t3, _EA
j _EN
_EA :
li $t3, 88
beq $t2, $t3, _EE
li $t3, 120
beq $t2, $t3, _EE
j _EB
_EE :
li $t4, 16
j _EF
_EB :
li $t3, 48
bge $t2, $t3, _EC
li $t1, -1
j _EF
_EC :
li $t3, 57
ble $t2, $t3, _ED
li $t1, -1
j _EF
_ED :
addi $t2, $t2, -48
move $t0, $t2
_EF :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _EU
j _EM
_EU :
li $t3, 0
bne $t2, $t3, _EV
j _EM
_EV :
li $t3, 10
bne $t2, $t3, _EG
j _EM
_EG :
li $t3, 48
blt $t2, $t3, _EJ
li $t3, 57
bgt $t2, $t3, _EH
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EF
_EH :
li $t3, 65
blt $t2, $t3, _EJ
li $t3, 70
bgt $t2, $t3, _EI
addi $t2, $t2, -55
bge $t2, $t4, _EJ
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EF
_EI :
li $t3, 97
blt $t2, $t3, _EJ
li $t3, 102
bgt $t2, $t3, _EJ
addi $t2, $t2, -87
bge $t2, $t4, _EJ
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EF
_EJ :
li $t1, -1
j _EF
_EM :
li $t4, -1
bne $t4, $t1, _EK
li $t0, 0
j _EN
_EK :
li $t4, 1
bne $t4, $t1, _EN
sub $t0, $zero, $t0
_EN :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
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
bne $t3, $t2, _FQ
j _FP
_FQ :
li $t3, 0
bne $t3, $t2, _FR
j _FP
_FR :
li $t3, 10
bne $t3, $t2, _EW
j _FP
_EW :
li $t3, 45
bne $t3, $t2, _EX
li $t1, 1
j _EY
_EX :
li $t3, 43
bne $t3, $t2, _EZ
_EY :
lb $t2, 0($a0)
addi $a0, $a0, 1
_EZ :
li $t3, 13
bne $t2, $t3, _FS
j _FP
_FS :
li $t3, 0
bne $t2, $t3, _FT
j _FP
_FT :
li $t3, 10
bne $t2, $t3, _FN
j _FP
_FN :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _FA
li $t1, -1
j _FH
_FA :
li $t3, 10
bgt $t3, $t2, _FB
li $t1, -1
j _FH
_FB :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _FH
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _FU
j _FP
_FU :
li $t3, 0
bne $t2, $t3, _FV
j _FP
_FV :
li $t3, 10
bne $t2, $t3, _FC
j _FP
_FC :
li $t3, 88
beq $t2, $t3, _FG
li $t3, 120
beq $t2, $t3, _FG
j _FD
_FG :
li $t4, 16
j _FH
_FD :
li $t3, 48
bge $t2, $t3, _FE
li $t1, -1
j _FH
_FE :
li $t3, 57
ble $t2, $t3, _FF
li $t1, -1
j _FH
_FF :
addi $t2, $t2, -48
move $t0, $t2
_FH :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _FW
j _FO
_FW :
li $t3, 0
bne $t2, $t3, _FX
j _FO
_FX :
li $t3, 10
bne $t2, $t3, _FI
j _FO
_FI :
li $t3, 48
blt $t2, $t3, _FL
li $t3, 57
bgt $t2, $t3, _FJ
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _FH
_FJ :
li $t3, 65
blt $t2, $t3, _FL
li $t3, 70
bgt $t2, $t3, _FK
addi $t2, $t2, -55
bge $t2, $t4, _FL
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _FH
_FK :
li $t3, 97
blt $t2, $t3, _FL
li $t3, 102
bgt $t2, $t3, _FL
addi $t2, $t2, -87
bge $t2, $t4, _FL
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _FH
_FL :
li $t1, -1
j _FH
_FO :
li $t4, -1
bne $t4, $t1, _FM
li $t0, 0
j _FP
_FM :
li $t4, 1
bne $t4, $t1, _FP
sub $t0, $zero, $t0
_FP :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
sub $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -28
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -40
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
addi $fp, $fp, 40
addi $s0, $fp, -40
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -40
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -44
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
addi $fp, $fp, 44
addi $s0, $fp, -44
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -36
lw $s0, 0($s0)
sub $s0, $s1, $s0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, 8
j _DR
_DQ :
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $sp, $sp, -4
la $s0, _FY
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
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
bne $t3, $t2, _GU
j _GT
_GU :
li $t3, 0
bne $t3, $t2, _GV
j _GT
_GV :
li $t3, 10
bne $t3, $t2, _GA
j _GT
_GA :
li $t3, 45
bne $t3, $t2, _GB
li $t1, 1
j _GC
_GB :
li $t3, 43
bne $t3, $t2, _GD
_GC :
lb $t2, 0($a0)
addi $a0, $a0, 1
_GD :
li $t3, 13
bne $t2, $t3, _GW
j _GT
_GW :
li $t3, 0
bne $t2, $t3, _GX
j _GT
_GX :
li $t3, 10
bne $t2, $t3, _GR
j _GT
_GR :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _GE
li $t1, -1
j _GL
_GE :
li $t3, 10
bgt $t3, $t2, _GF
li $t1, -1
j _GL
_GF :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _GL
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _GY
j _GT
_GY :
li $t3, 0
bne $t2, $t3, _GZ
j _GT
_GZ :
li $t3, 10
bne $t2, $t3, _GG
j _GT
_GG :
li $t3, 88
beq $t2, $t3, _GK
li $t3, 120
beq $t2, $t3, _GK
j _GH
_GK :
li $t4, 16
j _GL
_GH :
li $t3, 48
bge $t2, $t3, _GI
li $t1, -1
j _GL
_GI :
li $t3, 57
ble $t2, $t3, _GJ
li $t1, -1
j _GL
_GJ :
addi $t2, $t2, -48
move $t0, $t2
_GL :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _HA
j _GS
_HA :
li $t3, 0
bne $t2, $t3, _HB
j _GS
_HB :
li $t3, 10
bne $t2, $t3, _GM
j _GS
_GM :
li $t3, 48
blt $t2, $t3, _GP
li $t3, 57
bgt $t2, $t3, _GN
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _GL
_GN :
li $t3, 65
blt $t2, $t3, _GP
li $t3, 70
bgt $t2, $t3, _GO
addi $t2, $t2, -55
bge $t2, $t4, _GP
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _GL
_GO :
li $t3, 97
blt $t2, $t3, _GP
li $t3, 102
bgt $t2, $t3, _GP
addi $t2, $t2, -87
bge $t2, $t4, _GP
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _GL
_GP :
li $t1, -1
j _GL
_GS :
li $t4, -1
bne $t4, $t1, _GQ
li $t0, 0
j _GT
_GQ :
li $t4, 1
bne $t4, $t1, _GT
sub $t0, $zero, $t0
_GT :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
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
bne $t3, $t2, _HW
j _HV
_HW :
li $t3, 0
bne $t3, $t2, _HX
j _HV
_HX :
li $t3, 10
bne $t3, $t2, _HC
j _HV
_HC :
li $t3, 45
bne $t3, $t2, _HD
li $t1, 1
j _HE
_HD :
li $t3, 43
bne $t3, $t2, _HF
_HE :
lb $t2, 0($a0)
addi $a0, $a0, 1
_HF :
li $t3, 13
bne $t2, $t3, _HY
j _HV
_HY :
li $t3, 0
bne $t2, $t3, _HZ
j _HV
_HZ :
li $t3, 10
bne $t2, $t3, _HT
j _HV
_HT :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _HG
li $t1, -1
j _HN
_HG :
li $t3, 10
bgt $t3, $t2, _HH
li $t1, -1
j _HN
_HH :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _HN
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _IA
j _HV
_IA :
li $t3, 0
bne $t2, $t3, _IB
j _HV
_IB :
li $t3, 10
bne $t2, $t3, _HI
j _HV
_HI :
li $t3, 88
beq $t2, $t3, _HM
li $t3, 120
beq $t2, $t3, _HM
j _HJ
_HM :
li $t4, 16
j _HN
_HJ :
li $t3, 48
bge $t2, $t3, _HK
li $t1, -1
j _HN
_HK :
li $t3, 57
ble $t2, $t3, _HL
li $t1, -1
j _HN
_HL :
addi $t2, $t2, -48
move $t0, $t2
_HN :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _IC
j _HU
_IC :
li $t3, 0
bne $t2, $t3, _ID
j _HU
_ID :
li $t3, 10
bne $t2, $t3, _HO
j _HU
_HO :
li $t3, 48
blt $t2, $t3, _HR
li $t3, 57
bgt $t2, $t3, _HP
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _HN
_HP :
li $t3, 65
blt $t2, $t3, _HR
li $t3, 70
bgt $t2, $t3, _HQ
addi $t2, $t2, -55
bge $t2, $t4, _HR
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _HN
_HQ :
li $t3, 97
blt $t2, $t3, _HR
li $t3, 102
bgt $t2, $t3, _HR
addi $t2, $t2, -87
bge $t2, $t4, _HR
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _HN
_HR :
li $t1, -1
j _HN
_HU :
li $t4, -1
bne $t4, $t1, _HS
li $t0, 0
j _HV
_HS :
li $t4, 1
bne $t4, $t1, _HV
sub $t0, $zero, $t0
_HV :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
sub $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -28
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -40
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -44
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
addi $fp, $fp, 44
addi $s0, $fp, -44
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 16
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, 8
_DR :
addi $sp, $sp, 4
j _CM
_CN :
li $t6, -16
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, 16
move $sp, $fp
jr $ra
Fen__init :
move $fp, $sp
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 10
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
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
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
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
addi $s0, $s0, 8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
move $sp, $fp
jr $ra
move $sp, $fp
jr $ra
Fen__upd :
move $fp, $sp
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
_IG :
addi $s0, $fp, 8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _IH
addi $s0, $fp, 8
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
addi $s0, $s0, 4
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
addi $s0, $fp, 12
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $s0, $fp, 8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
la $s0 _E
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 8
addi $s0, $fp, -8
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
j _IG
_IH :
li $t6, 0
add $t6, $t6, $fp
move $sp, $t6
move $sp, $fp
jr $ra
Fen__get :
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
_IJ :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _IK
addi $s0, $fp, 8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $s0, $fp, 8
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
la $s0 _E
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
addi $s0, $fp, 8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
sub $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
j _IJ
_IK :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
addi $s0, $fp, -4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
move $sp, $fp
jr $ra
main: move $t8, $sp
addi $sp, $sp, -4
la $s1, Fen
la $s0, Fen__init
sw $s0, 0($s1)
la $s0, Fen__upd
sw $s0, 4($s1)
la $s0, Fen__get
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
_DS:
    .asciiz "l, r"
_DT:
    .space 4
_FY:
    .asciiz "p, x"
_FZ:
    .space 4
Fen:
    .word 0,0,0,0

