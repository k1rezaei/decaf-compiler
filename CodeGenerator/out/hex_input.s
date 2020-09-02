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
bne $t3, $t2, _BY
j _BX
_BY :
li $t3, 0
bne $t3, $t2, _BZ
j _BX
_BZ :
li $t3, 10
bne $t3, $t2, _BE
j _BX
_BE :
li $t3, 45
bne $t3, $t2, _BF
li $t1, 1
j _BG
_BF :
li $t3, 43
bne $t3, $t2, _BH
_BG :
lb $t2, 0($a0)
addi $a0, $a0, 1
_BH :
li $t3, 13
bne $t2, $t3, _CA
j _BX
_CA :
li $t3, 0
bne $t2, $t3, _CB
j _BX
_CB :
li $t3, 10
bne $t2, $t3, _BV
j _BX
_BV :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _BI
li $t1, -1
j _BP
_BI :
li $t3, 10
bgt $t3, $t2, _BJ
li $t1, -1
j _BP
_BJ :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _BP
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CC
j _BX
_CC :
li $t3, 0
bne $t2, $t3, _CD
j _BX
_CD :
li $t3, 10
bne $t2, $t3, _BK
j _BX
_BK :
li $t3, 88
beq $t2, $t3, _BO
li $t3, 120
beq $t2, $t3, _BO
j _BL
_BO :
li $t4, 16
j _BP
_BL :
li $t3, 48
bge $t2, $t3, _BM
li $t1, -1
j _BP
_BM :
li $t3, 57
ble $t2, $t3, _BN
li $t1, -1
j _BP
_BN :
addi $t2, $t2, -48
move $t0, $t2
_BP :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CE
j _BW
_CE :
li $t3, 0
bne $t2, $t3, _CF
j _BW
_CF :
li $t3, 10
bne $t2, $t3, _BQ
j _BW
_BQ :
li $t3, 48
blt $t2, $t3, _BT
li $t3, 57
bgt $t2, $t3, _BR
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BP
_BR :
li $t3, 65
blt $t2, $t3, _BT
li $t3, 70
bgt $t2, $t3, _BS
addi $t2, $t2, -55
bge $t2, $t4, _BT
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BP
_BS :
li $t3, 97
blt $t2, $t3, _BT
li $t3, 102
bgt $t2, $t3, _BT
addi $t2, $t2, -87
bge $t2, $t4, _BT
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BP
_BT :
li $t1, -1
j _BP
_BW :
li $t4, -1
bne $t4, $t1, _BU
li $t0, 0
j _BX
_BU :
li $t4, 1
bne $t4, $t1, _BX
sub $t0, $zero, $t0
_BX :
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
bne $t3, $t2, _DA
j _CZ
_DA :
li $t3, 0
bne $t3, $t2, _DB
j _CZ
_DB :
li $t3, 10
bne $t3, $t2, _CG
j _CZ
_CG :
li $t3, 45
bne $t3, $t2, _CH
li $t1, 1
j _CI
_CH :
li $t3, 43
bne $t3, $t2, _CJ
_CI :
lb $t2, 0($a0)
addi $a0, $a0, 1
_CJ :
li $t3, 13
bne $t2, $t3, _DC
j _CZ
_DC :
li $t3, 0
bne $t2, $t3, _DD
j _CZ
_DD :
li $t3, 10
bne $t2, $t3, _CX
j _CZ
_CX :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _CK
li $t1, -1
j _CR
_CK :
li $t3, 10
bgt $t3, $t2, _CL
li $t1, -1
j _CR
_CL :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _CR
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _DE
j _CZ
_DE :
li $t3, 0
bne $t2, $t3, _DF
j _CZ
_DF :
li $t3, 10
bne $t2, $t3, _CM
j _CZ
_CM :
li $t3, 88
beq $t2, $t3, _CQ
li $t3, 120
beq $t2, $t3, _CQ
j _CN
_CQ :
li $t4, 16
j _CR
_CN :
li $t3, 48
bge $t2, $t3, _CO
li $t1, -1
j _CR
_CO :
li $t3, 57
ble $t2, $t3, _CP
li $t1, -1
j _CR
_CP :
addi $t2, $t2, -48
move $t0, $t2
_CR :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _DG
j _CY
_DG :
li $t3, 0
bne $t2, $t3, _DH
j _CY
_DH :
li $t3, 10
bne $t2, $t3, _CS
j _CY
_CS :
li $t3, 48
blt $t2, $t3, _CV
li $t3, 57
bgt $t2, $t3, _CT
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _CR
_CT :
li $t3, 65
blt $t2, $t3, _CV
li $t3, 70
bgt $t2, $t3, _CU
addi $t2, $t2, -55
bge $t2, $t4, _CV
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _CR
_CU :
li $t3, 97
blt $t2, $t3, _CV
li $t3, 102
bgt $t2, $t3, _CV
addi $t2, $t2, -87
bge $t2, $t4, _CV
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _CR
_CV :
li $t1, -1
j _CR
_CY :
li $t4, -1
bne $t4, $t1, _CW
li $t0, 0
j _CZ
_CW :
li $t4, 1
bne $t4, $t1, _CZ
sub $t0, $zero, $t0
_CZ :
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
bne $t3, $t2, _EC
j _EB
_EC :
li $t3, 0
bne $t3, $t2, _ED
j _EB
_ED :
li $t3, 10
bne $t3, $t2, _DI
j _EB
_DI :
li $t3, 45
bne $t3, $t2, _DJ
li $t1, 1
j _DK
_DJ :
li $t3, 43
bne $t3, $t2, _DL
_DK :
lb $t2, 0($a0)
addi $a0, $a0, 1
_DL :
li $t3, 13
bne $t2, $t3, _EE
j _EB
_EE :
li $t3, 0
bne $t2, $t3, _EF
j _EB
_EF :
li $t3, 10
bne $t2, $t3, _DZ
j _EB
_DZ :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _DM
li $t1, -1
j _DT
_DM :
li $t3, 10
bgt $t3, $t2, _DN
li $t1, -1
j _DT
_DN :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _DT
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _EG
j _EB
_EG :
li $t3, 0
bne $t2, $t3, _EH
j _EB
_EH :
li $t3, 10
bne $t2, $t3, _DO
j _EB
_DO :
li $t3, 88
beq $t2, $t3, _DS
li $t3, 120
beq $t2, $t3, _DS
j _DP
_DS :
li $t4, 16
j _DT
_DP :
li $t3, 48
bge $t2, $t3, _DQ
li $t1, -1
j _DT
_DQ :
li $t3, 57
ble $t2, $t3, _DR
li $t1, -1
j _DT
_DR :
addi $t2, $t2, -48
move $t0, $t2
_DT :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _EI
j _EA
_EI :
li $t3, 0
bne $t2, $t3, _EJ
j _EA
_EJ :
li $t3, 10
bne $t2, $t3, _DU
j _EA
_DU :
li $t3, 48
blt $t2, $t3, _DX
li $t3, 57
bgt $t2, $t3, _DV
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DT
_DV :
li $t3, 65
blt $t2, $t3, _DX
li $t3, 70
bgt $t2, $t3, _DW
addi $t2, $t2, -55
bge $t2, $t4, _DX
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DT
_DW :
li $t3, 97
blt $t2, $t3, _DX
li $t3, 102
bgt $t2, $t3, _DX
addi $t2, $t2, -87
bge $t2, $t4, _DX
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DT
_DX :
li $t1, -1
j _DT
_EA :
li $t4, -1
bne $t4, $t1, _DY
li $t0, 0
j _EB
_DY :
li $t4, 1
bne $t4, $t1, _EB
sub $t0, $zero, $t0
_EB :
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
bne $t3, $t2, _FE
j _FD
_FE :
li $t3, 0
bne $t3, $t2, _FF
j _FD
_FF :
li $t3, 10
bne $t3, $t2, _EK
j _FD
_EK :
li $t3, 45
bne $t3, $t2, _EL
li $t1, 1
j _EM
_EL :
li $t3, 43
bne $t3, $t2, _EN
_EM :
lb $t2, 0($a0)
addi $a0, $a0, 1
_EN :
li $t3, 13
bne $t2, $t3, _FG
j _FD
_FG :
li $t3, 0
bne $t2, $t3, _FH
j _FD
_FH :
li $t3, 10
bne $t2, $t3, _FB
j _FD
_FB :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _EO
li $t1, -1
j _EV
_EO :
li $t3, 10
bgt $t3, $t2, _EP
li $t1, -1
j _EV
_EP :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _EV
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _FI
j _FD
_FI :
li $t3, 0
bne $t2, $t3, _FJ
j _FD
_FJ :
li $t3, 10
bne $t2, $t3, _EQ
j _FD
_EQ :
li $t3, 88
beq $t2, $t3, _EU
li $t3, 120
beq $t2, $t3, _EU
j _ER
_EU :
li $t4, 16
j _EV
_ER :
li $t3, 48
bge $t2, $t3, _ES
li $t1, -1
j _EV
_ES :
li $t3, 57
ble $t2, $t3, _ET
li $t1, -1
j _EV
_ET :
addi $t2, $t2, -48
move $t0, $t2
_EV :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _FK
j _FC
_FK :
li $t3, 0
bne $t2, $t3, _FL
j _FC
_FL :
li $t3, 10
bne $t2, $t3, _EW
j _FC
_EW :
li $t3, 48
blt $t2, $t3, _EZ
li $t3, 57
bgt $t2, $t3, _EX
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EV
_EX :
li $t3, 65
blt $t2, $t3, _EZ
li $t3, 70
bgt $t2, $t3, _EY
addi $t2, $t2, -55
bge $t2, $t4, _EZ
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EV
_EY :
li $t3, 97
blt $t2, $t3, _EZ
li $t3, 102
bgt $t2, $t3, _EZ
addi $t2, $t2, -87
bge $t2, $t4, _EZ
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EV
_EZ :
li $t1, -1
j _EV
_FC :
li $t4, -1
bne $t4, $t1, _FA
li $t0, 0
j _FD
_FA :
li $t4, 1
bne $t4, $t1, _FD
sub $t0, $zero, $t0
_FD :
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

