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
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $sp, $sp, -4
li $v0, 8
li $a1, 400
la $a0, __read
syscall
li $a1, 1
li $a2, 0
_K :
lbu $a2, 0($a0)
li $a3, 10
beq $a2, $a3, _L
li $a3, 13
beq $a2, $a3, _L
li $a3, 0
beq $a2, $a3, _L
addi $a1, $a1, 1
addi $a0, $a0, 1
j _K
_L :
li $v0, 9
move $a0, $a1
syscall
move $v1, $v0
la $a0, __read
_M :
lbu $a2, 0($a0)
sb $zero, 0($a0)
li $a3, 10
beq $a2, $a3, _N
li $a3, 13
beq $a2, $a3, _N
li $a3, 0
beq $a2, $a3, _N
sb $a2, 0($v0)
addi $v0, $v0, 1
addi $a0, $a0, 1
j _M
_N :
sw $v1, 0($sp)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
la $s0, _Q
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -28
lw $s0, 0($s0)
move $s2, $s0
li $s0, 1
_S :
lb $t0, 0($s1)
lb $t1, 0($s2)
addi $s1, $s1, 1
addi $s2, $s2, 1
beq $t0, $t1, _T
li $s0, 0
_T :
beqz $t0, _U
beqz $t1, _U
j _S
_U :
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _O
addi $sp, $sp, -4
addi $sp, $sp, -4
la $s0, _V
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
li $a0, 16
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
la $s0, Graduate
sw $s0, 0($v0)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -20
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
syscall
li $a1, 1
li $a2, 0
_X :
lbu $a2, 0($a0)
li $a3, 10
beq $a2, $a3, _Y
li $a3, 13
beq $a2, $a3, _Y
li $a3, 0
beq $a2, $a3, _Y
addi $a1, $a1, 1
addi $a0, $a0, 1
j _X
_Y :
li $v0, 9
move $a0, $a1
syscall
move $v1, $v0
la $a0, __read
_Z :
lbu $a2, 0($a0)
sb $zero, 0($a0)
li $a3, 10
beq $a2, $a3, _BA
li $a3, 13
beq $a2, $a3, _BA
li $a3, 0
beq $a2, $a3, _BA
sb $a2, 0($v0)
addi $v0, $v0, 1
addi $a0, $a0, 1
j _Z
_BA :
sw $v1, 0($sp)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -20
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
addi $s0, $fp, -20
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 0
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
bne $t3, $t2, _BV
j _BU
_BV :
li $t3, 0
bne $t3, $t2, _BW
j _BU
_BW :
li $t3, 10
bne $t3, $t2, _BB
j _BU
_BB :
li $t3, 45
bne $t3, $t2, _BC
li $t1, 1
j _BD
_BC :
li $t3, 43
bne $t3, $t2, _BE
_BD :
lb $t2, 0($a0)
addi $a0, $a0, 1
_BE :
li $t3, 13
bne $t2, $t3, _BX
j _BU
_BX :
li $t3, 0
bne $t2, $t3, _BY
j _BU
_BY :
li $t3, 10
bne $t2, $t3, _BS
j _BU
_BS :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _BF
li $t1, -1
j _BM
_BF :
li $t3, 10
bgt $t3, $t2, _BG
li $t1, -1
j _BM
_BG :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _BM
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BZ
j _BU
_BZ :
li $t3, 0
bne $t2, $t3, _CA
j _BU
_CA :
li $t3, 10
bne $t2, $t3, _BH
j _BU
_BH :
li $t3, 88
beq $t2, $t3, _BL
li $t3, 120
beq $t2, $t3, _BL
j _BI
_BL :
li $t4, 16
j _BM
_BI :
li $t3, 48
bge $t2, $t3, _BJ
li $t1, -1
j _BM
_BJ :
li $t3, 57
ble $t2, $t3, _BK
li $t1, -1
j _BM
_BK :
addi $t2, $t2, -48
move $t0, $t2
_BM :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CB
j _BT
_CB :
li $t3, 0
bne $t2, $t3, _CC
j _BT
_CC :
li $t3, 10
bne $t2, $t3, _BN
j _BT
_BN :
li $t3, 48
blt $t2, $t3, _BQ
li $t3, 57
bgt $t2, $t3, _BO
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BM
_BO :
li $t3, 65
blt $t2, $t3, _BQ
li $t3, 70
bgt $t2, $t3, _BP
addi $t2, $t2, -55
bge $t2, $t4, _BQ
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BM
_BP :
li $t3, 97
blt $t2, $t3, _BQ
li $t3, 102
bgt $t2, $t3, _BQ
addi $t2, $t2, -87
bge $t2, $t4, _BQ
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BM
_BQ :
li $t1, -1
j _BM
_BT :
li $t4, -1
bne $t4, $t1, _BR
li $t0, 0
j _BU
_BR :
li $t4, 1
bne $t4, $t1, _BU
sub $t0, $zero, $t0
_BU :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $fp, -20
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
addi $s0, $fp, -20
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
addi $sp, $sp, 16
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
bne $t3, $t2, _CX
j _CW
_CX :
li $t3, 0
bne $t3, $t2, _CY
j _CW
_CY :
li $t3, 10
bne $t3, $t2, _CD
j _CW
_CD :
li $t3, 45
bne $t3, $t2, _CE
li $t1, 1
j _CF
_CE :
li $t3, 43
bne $t3, $t2, _CG
_CF :
lb $t2, 0($a0)
addi $a0, $a0, 1
_CG :
li $t3, 13
bne $t2, $t3, _CZ
j _CW
_CZ :
li $t3, 0
bne $t2, $t3, _DA
j _CW
_DA :
li $t3, 10
bne $t2, $t3, _CU
j _CW
_CU :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _CH
li $t1, -1
j _CO
_CH :
li $t3, 10
bgt $t3, $t2, _CI
li $t1, -1
j _CO
_CI :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _CO
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _DB
j _CW
_DB :
li $t3, 0
bne $t2, $t3, _DC
j _CW
_DC :
li $t3, 10
bne $t2, $t3, _CJ
j _CW
_CJ :
li $t3, 88
beq $t2, $t3, _CN
li $t3, 120
beq $t2, $t3, _CN
j _CK
_CN :
li $t4, 16
j _CO
_CK :
li $t3, 48
bge $t2, $t3, _CL
li $t1, -1
j _CO
_CL :
li $t3, 57
ble $t2, $t3, _CM
li $t1, -1
j _CO
_CM :
addi $t2, $t2, -48
move $t0, $t2
_CO :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _DD
j _CV
_DD :
li $t3, 0
bne $t2, $t3, _DE
j _CV
_DE :
li $t3, 10
bne $t2, $t3, _CP
j _CV
_CP :
li $t3, 48
blt $t2, $t3, _CS
li $t3, 57
bgt $t2, $t3, _CQ
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _CO
_CQ :
li $t3, 65
blt $t2, $t3, _CS
li $t3, 70
bgt $t2, $t3, _CR
addi $t2, $t2, -55
bge $t2, $t4, _CS
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _CO
_CR :
li $t3, 97
blt $t2, $t3, _CS
li $t3, 102
bgt $t2, $t3, _CS
addi $t2, $t2, -87
bge $t2, $t4, _CS
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _CO
_CS :
li $t1, -1
j _CO
_CV :
li $t4, -1
bne $t4, $t1, _CT
li $t0, 0
j _CW
_CT :
li $t4, 1
bne $t4, $t1, _CW
sub $t0, $zero, $t0
_CW :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $fp, -20
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
addi $s0, $fp, -20
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 12
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
addi $s0, $fp, -20
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -20
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, 4
j _P
_O :
addi $sp, $sp, -4
addi $sp, $sp, -4
la $s0, _DF
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
li $a0, 16
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
la $s0, UnderGraduate
sw $s0, 0($v0)
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
syscall
li $a1, 1
li $a2, 0
_DH :
lbu $a2, 0($a0)
li $a3, 10
beq $a2, $a3, _DI
li $a3, 13
beq $a2, $a3, _DI
li $a3, 0
beq $a2, $a3, _DI
addi $a1, $a1, 1
addi $a0, $a0, 1
j _DH
_DI :
li $v0, 9
move $a0, $a1
syscall
move $v1, $v0
la $a0, __read
_DJ :
lbu $a2, 0($a0)
sb $zero, 0($a0)
li $a3, 10
beq $a2, $a3, _DK
li $a3, 13
beq $a2, $a3, _DK
li $a3, 0
beq $a2, $a3, _DK
sb $a2, 0($v0)
addi $v0, $v0, 1
addi $a0, $a0, 1
j _DJ
_DK :
sw $v1, 0($sp)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -8
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
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -40
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 0
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
bne $t3, $t2, _EF
j _EE
_EF :
li $t3, 0
bne $t3, $t2, _EG
j _EE
_EG :
li $t3, 10
bne $t3, $t2, _DL
j _EE
_DL :
li $t3, 45
bne $t3, $t2, _DM
li $t1, 1
j _DN
_DM :
li $t3, 43
bne $t3, $t2, _DO
_DN :
lb $t2, 0($a0)
addi $a0, $a0, 1
_DO :
li $t3, 13
bne $t2, $t3, _EH
j _EE
_EH :
li $t3, 0
bne $t2, $t3, _EI
j _EE
_EI :
li $t3, 10
bne $t2, $t3, _EC
j _EE
_EC :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _DP
li $t1, -1
j _DW
_DP :
li $t3, 10
bgt $t3, $t2, _DQ
li $t1, -1
j _DW
_DQ :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _DW
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _EJ
j _EE
_EJ :
li $t3, 0
bne $t2, $t3, _EK
j _EE
_EK :
li $t3, 10
bne $t2, $t3, _DR
j _EE
_DR :
li $t3, 88
beq $t2, $t3, _DV
li $t3, 120
beq $t2, $t3, _DV
j _DS
_DV :
li $t4, 16
j _DW
_DS :
li $t3, 48
bge $t2, $t3, _DT
li $t1, -1
j _DW
_DT :
li $t3, 57
ble $t2, $t3, _DU
li $t1, -1
j _DW
_DU :
addi $t2, $t2, -48
move $t0, $t2
_DW :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _EL
j _ED
_EL :
li $t3, 0
bne $t2, $t3, _EM
j _ED
_EM :
li $t3, 10
bne $t2, $t3, _DX
j _ED
_DX :
li $t3, 48
blt $t2, $t3, _EA
li $t3, 57
bgt $t2, $t3, _DY
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DW
_DY :
li $t3, 65
blt $t2, $t3, _EA
li $t3, 70
bgt $t2, $t3, _DZ
addi $t2, $t2, -55
bge $t2, $t4, _EA
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DW
_DZ :
li $t3, 97
blt $t2, $t3, _EA
li $t3, 102
bgt $t2, $t3, _EA
addi $t2, $t2, -87
bge $t2, $t4, _EA
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DW
_EA :
li $t1, -1
j _DW
_ED :
li $t4, -1
bne $t4, $t1, _EB
li $t0, 0
j _EE
_EB :
li $t4, 1
bne $t4, $t1, _EE
sub $t0, $zero, $t0
_EE :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $fp, -24
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
addi $s0, $fp, -24
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
addi $sp, $sp, 16
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
bne $t3, $t2, _FH
j _FG
_FH :
li $t3, 0
bne $t3, $t2, _FI
j _FG
_FI :
li $t3, 10
bne $t3, $t2, _EN
j _FG
_EN :
li $t3, 45
bne $t3, $t2, _EO
li $t1, 1
j _EP
_EO :
li $t3, 43
bne $t3, $t2, _EQ
_EP :
lb $t2, 0($a0)
addi $a0, $a0, 1
_EQ :
li $t3, 13
bne $t2, $t3, _FJ
j _FG
_FJ :
li $t3, 0
bne $t2, $t3, _FK
j _FG
_FK :
li $t3, 10
bne $t2, $t3, _FE
j _FG
_FE :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _ER
li $t1, -1
j _EY
_ER :
li $t3, 10
bgt $t3, $t2, _ES
li $t1, -1
j _EY
_ES :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _EY
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _FL
j _FG
_FL :
li $t3, 0
bne $t2, $t3, _FM
j _FG
_FM :
li $t3, 10
bne $t2, $t3, _ET
j _FG
_ET :
li $t3, 88
beq $t2, $t3, _EX
li $t3, 120
beq $t2, $t3, _EX
j _EU
_EX :
li $t4, 16
j _EY
_EU :
li $t3, 48
bge $t2, $t3, _EV
li $t1, -1
j _EY
_EV :
li $t3, 57
ble $t2, $t3, _EW
li $t1, -1
j _EY
_EW :
addi $t2, $t2, -48
move $t0, $t2
_EY :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _FN
j _FF
_FN :
li $t3, 0
bne $t2, $t3, _FO
j _FF
_FO :
li $t3, 10
bne $t2, $t3, _EZ
j _FF
_EZ :
li $t3, 48
blt $t2, $t3, _FC
li $t3, 57
bgt $t2, $t3, _FA
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EY
_FA :
li $t3, 65
blt $t2, $t3, _FC
li $t3, 70
bgt $t2, $t3, _FB
addi $t2, $t2, -55
bge $t2, $t4, _FC
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EY
_FB :
li $t3, 97
blt $t2, $t3, _FC
li $t3, 102
bgt $t2, $t3, _FC
addi $t2, $t2, -87
bge $t2, $t4, _FC
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EY
_FC :
li $t1, -1
j _EY
_FF :
li $t4, -1
bne $t4, $t1, _FD
li $t0, 0
j _FG
_FD :
li $t4, 1
bne $t4, $t1, _FG
sub $t0, $zero, $t0
_FG :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $fp, -24
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
addi $s0, $fp, -24
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 12
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
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, 4
_P :
addi $s0, $fp, -12
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
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 32
addi $s0, $fp, -32
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -16
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
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 32
addi $s0, $fp, -32
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, 24
move $sp, $fp
jr $ra
Person__set_name :
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
move $sp, $fp
jr $ra
Person__get_desc :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _FR
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
la $a0, __newLine
li $v0, 4
syscall
move $sp, $fp
jr $ra
Student__get_desc :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _FU
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
la $s0, _FW
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
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
move $sp, $fp
jr $ra
Student__set_grade :
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
Graduate__set_year :
move $fp, $sp
addi $s0, $fp, 8
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
move $sp, $fp
jr $ra
Graduate__get_desc :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _GB
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _GD
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
la $s0, _GF
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
addi $s0, $s0, 12
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
move $sp, $fp
jr $ra
UnderGraduate__set_year :
move $fp, $sp
addi $s0, $fp, 8
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
move $sp, $fp
jr $ra
UnderGraduate__get_desc :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _GJ
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
addi $sp, $sp, -4
la $s0, _GL
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
la $s0, _GN
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
addi $s0, $s0, 12
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
la $s0, Person__set_name
sw $s0, 0($s1)
la $s0, Person__get_desc
sw $s0, 4($s1)
la $s1, Student
la $s0, Person__set_name
sw $s0, 0($s1)
la $s0, Student__get_desc
sw $s0, 4($s1)
la $s0, Student__set_grade
sw $s0, 8($s1)
la $s1, Graduate
la $s0, Person__set_name
sw $s0, 0($s1)
la $s0, Graduate__get_desc
sw $s0, 4($s1)
la $s0, Student__set_grade
sw $s0, 8($s1)
la $s0, Graduate__set_year
sw $s0, 12($s1)
la $s1, UnderGraduate
la $s0, Person__set_name
sw $s0, 0($s1)
la $s0, UnderGraduate__get_desc
sw $s0, 4($s1)
la $s0, Student__set_grade
sw $s0, 8($s1)
la $s0, UnderGraduate__set_year
sw $s0, 12($s1)
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
_Q:
    .asciiz "G"
_R:
    .space 3
_V:
    .asciiz "Name, Grade, Year Of Graduation"
_W:
    .space 1
_DF:
    .asciiz "Name, Grade, Expected Year Of Graduation"
_DG:
    .space 4
_FR:
    .asciiz "my name is "
_FS:
    .space 1
_FU:
    .asciiz "I am "
_FV:
    .space 3
_FW:
    .asciiz " , A student in grade : "
_FX:
    .space 4
_GB:
    .asciiz "I am Grade "
_GC:
    .space 1
_GD:
    .asciiz "I am "
_GE:
    .space 3
_GF:
    .asciiz " a Graduated student in year "
_GG:
    .space 3
_GJ:
    .asciiz "I am Grade "
_GK:
    .space 1
_GL:
    .asciiz "I am "
_GM:
    .space 3
_GN:
    .asciiz ", an undergraduate student which will graduate at "
_GO:
    .space 2
Person:
    .word 0,0,0
Student:
    .word 0,0,0,0
Graduate:
    .word 0,0,0,0,0
UnderGraduate:
    .word 0,0,0,0,0

