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
la $s0, _W
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
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
bne $t3, $t2, _BS
j _BR
_BS :
li $t3, 0
bne $t3, $t2, _BT
j _BR
_BT :
li $t3, 10
bne $t3, $t2, _Y
j _BR
_Y :
li $t3, 45
bne $t3, $t2, _Z
li $t1, 1
j _BA
_Z :
li $t3, 43
bne $t3, $t2, _BB
_BA :
lb $t2, 0($a0)
addi $a0, $a0, 1
_BB :
li $t3, 13
bne $t2, $t3, _BU
j _BR
_BU :
li $t3, 0
bne $t2, $t3, _BV
j _BR
_BV :
li $t3, 10
bne $t2, $t3, _BP
j _BR
_BP :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _BC
li $t1, -1
j _BJ
_BC :
li $t3, 10
bgt $t3, $t2, _BD
li $t1, -1
j _BJ
_BD :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _BJ
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BW
j _BR
_BW :
li $t3, 0
bne $t2, $t3, _BX
j _BR
_BX :
li $t3, 10
bne $t2, $t3, _BE
j _BR
_BE :
li $t3, 88
beq $t2, $t3, _BI
li $t3, 120
beq $t2, $t3, _BI
j _BF
_BI :
li $t4, 16
j _BJ
_BF :
li $t3, 48
bge $t2, $t3, _BG
li $t1, -1
j _BJ
_BG :
li $t3, 57
ble $t2, $t3, _BH
li $t1, -1
j _BJ
_BH :
addi $t2, $t2, -48
move $t0, $t2
_BJ :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BY
j _BQ
_BY :
li $t3, 0
bne $t2, $t3, _BZ
j _BQ
_BZ :
li $t3, 10
bne $t2, $t3, _BK
j _BQ
_BK :
li $t3, 48
blt $t2, $t3, _BN
li $t3, 57
bgt $t2, $t3, _BL
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BJ
_BL :
li $t3, 65
blt $t2, $t3, _BN
li $t3, 70
bgt $t2, $t3, _BM
addi $t2, $t2, -55
bge $t2, $t4, _BN
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BJ
_BM :
li $t3, 97
blt $t2, $t3, _BN
li $t3, 102
bgt $t2, $t3, _BN
addi $t2, $t2, -87
bge $t2, $t4, _BN
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BJ
_BN :
li $t1, -1
j _BJ
_BQ :
li $t4, -1
bne $t4, $t1, _BO
li $t0, 0
j _BR
_BO :
li $t4, 1
bne $t4, $t1, _BR
sub $t0, $zero, $t0
_BR :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -8
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
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -4
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
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
_CA :
addi $s0, $fp, -16
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CB
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $sp, $sp, -4
la $s0, _CC
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, -16
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
li $v0, 8
li $a1, 400
la $a0, __read
syscall
li $a1, 1
li $a2, 0
_CE :
lbu $a2, 0($a0)
li $a3, 10
beq $a2, $a3, _CF
li $a3, 13
beq $a2, $a3, _CF
li $a3, 0
beq $a2, $a3, _CF
addi $a1, $a1, 1
addi $a0, $a0, 1
j _CE
_CF :
li $v0, 9
move $a0, $a1
syscall
move $v1, $v0
la $a0, __read
_CG :
lbu $a2, 0($a0)
sb $zero, 0($a0)
li $a3, 10
beq $a2, $a3, _CH
li $a3, 13
beq $a2, $a3, _CH
li $a3, 0
beq $a2, $a3, _CH
sb $a2, 0($v0)
addi $v0, $v0, 1
addi $a0, $a0, 1
j _CG
_CH :
sw $v1, 0($sp)
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
la $s0, _CK
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
move $s2, $s0
li $s0, 1
_CM :
lb $t0, 0($s1)
lb $t1, 0($s2)
addi $s1, $s1, 1
addi $s2, $s2, 1
beq $t0, $t1, _CN
li $s0, 0
_CN :
beqz $t0, _CO
beqz $t1, _CO
j _CM
_CO :
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CI
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, -4
li $a0, 16
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
la $s0, Lion
sw $s0, 0($v0)
addi $s0, $fp, -36
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -32
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
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
j _CJ
_CI :
addi $sp, $sp, -4
la $s0, _CR
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
move $s2, $s0
li $s0, 1
_CT :
lb $t0, 0($s1)
lb $t1, 0($s2)
addi $s1, $s1, 1
addi $s2, $s2, 1
beq $t0, $t1, _CU
li $s0, 0
_CU :
beqz $t0, _CV
beqz $t1, _CV
j _CT
_CV :
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CP
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, -4
li $a0, 16
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
la $s0, Tiger
sw $s0, 0($v0)
addi $s0, $fp, -36
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -32
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
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
j _CQ
_CP :
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, -4
li $a0, 16
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
la $s0, Sheep
sw $s0, 0($v0)
addi $s0, $fp, -36
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -32
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
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
_CQ :
_CJ :
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
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
move $t5, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
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
addi $sp, $sp, 4
addi $sp, $sp, -4
li $v0, 8
li $a1, 400
la $a0, __read
syscall
li $a1, 1
li $a2, 0
_CW :
lbu $a2, 0($a0)
li $a3, 10
beq $a2, $a3, _CX
li $a3, 13
beq $a2, $a3, _CX
li $a3, 0
beq $a2, $a3, _CX
addi $a1, $a1, 1
addi $a0, $a0, 1
j _CW
_CX :
li $v0, 9
move $a0, $a1
syscall
move $v1, $v0
la $a0, __read
_CY :
lbu $a2, 0($a0)
sb $zero, 0($a0)
li $a3, 10
beq $a2, $a3, _CZ
li $a3, 13
beq $a2, $a3, _CZ
li $a3, 0
beq $a2, $a3, _CZ
sb $a2, 0($v0)
addi $v0, $v0, 1
addi $a0, $a0, 1
j _CY
_CZ :
sw $v1, 0($sp)
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
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
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
move $t5, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 0
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
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
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
move $t5, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 28
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
addi $sp, $sp, 8
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -24
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
j _CA
_CB :
li $t6, -20
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
_DA :
addi $s0, $fp, -16
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _DB
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -24
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
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
move $t5, $s0
addi $s0, $fp, -24
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 32
addi $s0, $fp, -32
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -24
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
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
move $t5, $s0
addi $s0, $fp, -24
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
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
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -24
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
j _DA
_DB :
li $t6, -20
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
la $s0, _DC
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
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
bne $t3, $t2, _DY
j _DX
_DY :
li $t3, 0
bne $t3, $t2, _DZ
j _DX
_DZ :
li $t3, 10
bne $t3, $t2, _DE
j _DX
_DE :
li $t3, 45
bne $t3, $t2, _DF
li $t1, 1
j _DG
_DF :
li $t3, 43
bne $t3, $t2, _DH
_DG :
lb $t2, 0($a0)
addi $a0, $a0, 1
_DH :
li $t3, 13
bne $t2, $t3, _EA
j _DX
_EA :
li $t3, 0
bne $t2, $t3, _EB
j _DX
_EB :
li $t3, 10
bne $t2, $t3, _DV
j _DX
_DV :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _DI
li $t1, -1
j _DP
_DI :
li $t3, 10
bgt $t3, $t2, _DJ
li $t1, -1
j _DP
_DJ :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _DP
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _EC
j _DX
_EC :
li $t3, 0
bne $t2, $t3, _ED
j _DX
_ED :
li $t3, 10
bne $t2, $t3, _DK
j _DX
_DK :
li $t3, 88
beq $t2, $t3, _DO
li $t3, 120
beq $t2, $t3, _DO
j _DL
_DO :
li $t4, 16
j _DP
_DL :
li $t3, 48
bge $t2, $t3, _DM
li $t1, -1
j _DP
_DM :
li $t3, 57
ble $t2, $t3, _DN
li $t1, -1
j _DP
_DN :
addi $t2, $t2, -48
move $t0, $t2
_DP :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _EE
j _DW
_EE :
li $t3, 0
bne $t2, $t3, _EF
j _DW
_EF :
li $t3, 10
bne $t2, $t3, _DQ
j _DW
_DQ :
li $t3, 48
blt $t2, $t3, _DT
li $t3, 57
bgt $t2, $t3, _DR
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DP
_DR :
li $t3, 65
blt $t2, $t3, _DT
li $t3, 70
bgt $t2, $t3, _DS
addi $t2, $t2, -55
bge $t2, $t4, _DT
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DP
_DS :
li $t3, 97
blt $t2, $t3, _DT
li $t3, 102
bgt $t2, $t3, _DT
addi $t2, $t2, -87
bge $t2, $t4, _DT
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DP
_DT :
li $t1, -1
j _DP
_DW :
li $t4, -1
bne $t4, $t1, _DU
li $t0, 0
j _DX
_DU :
li $t4, 1
bne $t4, $t1, _DX
sub $t0, $zero, $t0
_DX :
move $s0, $t0
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
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
_EG :
addi $s0, $fp, -16
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _EH
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
mult $s0, $s1
mflo $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -24
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
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
move $t5, $s0
addi $s0, $fp, -24
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 40
addi $s0, $fp, -40
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 20
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -24
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
j _EG
_EH :
li $t6, -20
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
la $s0, _EI
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
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
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
_FM :
addi $s0, $fp, -16
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -20
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _FN
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $sp, $sp, -4
la $s0, _FO
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
bne $t3, $t2, _GK
j _GJ
_GK :
li $t3, 0
bne $t3, $t2, _GL
j _GJ
_GL :
li $t3, 10
bne $t3, $t2, _FQ
j _GJ
_FQ :
li $t3, 45
bne $t3, $t2, _FR
li $t1, 1
j _FS
_FR :
li $t3, 43
bne $t3, $t2, _FT
_FS :
lb $t2, 0($a0)
addi $a0, $a0, 1
_FT :
li $t3, 13
bne $t2, $t3, _GM
j _GJ
_GM :
li $t3, 0
bne $t2, $t3, _GN
j _GJ
_GN :
li $t3, 10
bne $t2, $t3, _GH
j _GJ
_GH :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _FU
li $t1, -1
j _GB
_FU :
li $t3, 10
bgt $t3, $t2, _FV
li $t1, -1
j _GB
_FV :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _GB
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _GO
j _GJ
_GO :
li $t3, 0
bne $t2, $t3, _GP
j _GJ
_GP :
li $t3, 10
bne $t2, $t3, _FW
j _GJ
_FW :
li $t3, 88
beq $t2, $t3, _GA
li $t3, 120
beq $t2, $t3, _GA
j _FX
_GA :
li $t4, 16
j _GB
_FX :
li $t3, 48
bge $t2, $t3, _FY
li $t1, -1
j _GB
_FY :
li $t3, 57
ble $t2, $t3, _FZ
li $t1, -1
j _GB
_FZ :
addi $t2, $t2, -48
move $t0, $t2
_GB :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _GQ
j _GI
_GQ :
li $t3, 0
bne $t2, $t3, _GR
j _GI
_GR :
li $t3, 10
bne $t2, $t3, _GC
j _GI
_GC :
li $t3, 48
blt $t2, $t3, _GF
li $t3, 57
bgt $t2, $t3, _GD
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _GB
_GD :
li $t3, 65
blt $t2, $t3, _GF
li $t3, 70
bgt $t2, $t3, _GE
addi $t2, $t2, -55
bge $t2, $t4, _GF
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _GB
_GE :
li $t3, 97
blt $t2, $t3, _GF
li $t3, 102
bgt $t2, $t3, _GF
addi $t2, $t2, -87
bge $t2, $t4, _GF
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _GB
_GF :
li $t1, -1
j _GB
_GI :
li $t4, -1
bne $t4, $t1, _GG
li $t0, 0
j _GJ
_GG :
li $t4, 1
bne $t4, $t1, _GJ
sub $t0, $zero, $t0
_GJ :
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
bne $t3, $t2, _HM
j _HL
_HM :
li $t3, 0
bne $t3, $t2, _HN
j _HL
_HN :
li $t3, 10
bne $t3, $t2, _GS
j _HL
_GS :
li $t3, 45
bne $t3, $t2, _GT
li $t1, 1
j _GU
_GT :
li $t3, 43
bne $t3, $t2, _GV
_GU :
lb $t2, 0($a0)
addi $a0, $a0, 1
_GV :
li $t3, 13
bne $t2, $t3, _HO
j _HL
_HO :
li $t3, 0
bne $t2, $t3, _HP
j _HL
_HP :
li $t3, 10
bne $t2, $t3, _HJ
j _HL
_HJ :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _GW
li $t1, -1
j _HD
_GW :
li $t3, 10
bgt $t3, $t2, _GX
li $t1, -1
j _HD
_GX :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _HD
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _HQ
j _HL
_HQ :
li $t3, 0
bne $t2, $t3, _HR
j _HL
_HR :
li $t3, 10
bne $t2, $t3, _GY
j _HL
_GY :
li $t3, 88
beq $t2, $t3, _HC
li $t3, 120
beq $t2, $t3, _HC
j _GZ
_HC :
li $t4, 16
j _HD
_GZ :
li $t3, 48
bge $t2, $t3, _HA
li $t1, -1
j _HD
_HA :
li $t3, 57
ble $t2, $t3, _HB
li $t1, -1
j _HD
_HB :
addi $t2, $t2, -48
move $t0, $t2
_HD :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _HS
j _HK
_HS :
li $t3, 0
bne $t2, $t3, _HT
j _HK
_HT :
li $t3, 10
bne $t2, $t3, _HE
j _HK
_HE :
li $t3, 48
blt $t2, $t3, _HH
li $t3, 57
bgt $t2, $t3, _HF
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _HD
_HF :
li $t3, 65
blt $t2, $t3, _HH
li $t3, 70
bgt $t2, $t3, _HG
addi $t2, $t2, -55
bge $t2, $t4, _HH
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _HD
_HG :
li $t3, 97
blt $t2, $t3, _HH
li $t3, 102
bgt $t2, $t3, _HH
addi $t2, $t2, -87
bge $t2, $t4, _HH
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _HD
_HH :
li $t1, -1
j _HD
_HK :
li $t4, -1
bne $t4, $t1, _HI
li $t0, 0
j _HL
_HI :
li $t4, 1
bne $t4, $t1, _HL
sub $t0, $zero, $t0
_HL :
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
move $t5, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
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
move $t5, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 36
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
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -24
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
j _FM
_FN :
li $t6, -20
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
la $s0, _HU
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
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
bne $t3, $t2, _IQ
j _IP
_IQ :
li $t3, 0
bne $t3, $t2, _IR
j _IP
_IR :
li $t3, 10
bne $t3, $t2, _HW
j _IP
_HW :
li $t3, 45
bne $t3, $t2, _HX
li $t1, 1
j _HY
_HX :
li $t3, 43
bne $t3, $t2, _HZ
_HY :
lb $t2, 0($a0)
addi $a0, $a0, 1
_HZ :
li $t3, 13
bne $t2, $t3, _IS
j _IP
_IS :
li $t3, 0
bne $t2, $t3, _IT
j _IP
_IT :
li $t3, 10
bne $t2, $t3, _IN
j _IP
_IN :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _IA
li $t1, -1
j _IH
_IA :
li $t3, 10
bgt $t3, $t2, _IB
li $t1, -1
j _IH
_IB :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _IH
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _IU
j _IP
_IU :
li $t3, 0
bne $t2, $t3, _IV
j _IP
_IV :
li $t3, 10
bne $t2, $t3, _IC
j _IP
_IC :
li $t3, 88
beq $t2, $t3, _IG
li $t3, 120
beq $t2, $t3, _IG
j _ID
_IG :
li $t4, 16
j _IH
_ID :
li $t3, 48
bge $t2, $t3, _IE
li $t1, -1
j _IH
_IE :
li $t3, 57
ble $t2, $t3, _IF
li $t1, -1
j _IH
_IF :
addi $t2, $t2, -48
move $t0, $t2
_IH :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _IW
j _IO
_IW :
li $t3, 0
bne $t2, $t3, _IX
j _IO
_IX :
li $t3, 10
bne $t2, $t3, _II
j _IO
_II :
li $t3, 48
blt $t2, $t3, _IL
li $t3, 57
bgt $t2, $t3, _IJ
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _IH
_IJ :
li $t3, 65
blt $t2, $t3, _IL
li $t3, 70
bgt $t2, $t3, _IK
addi $t2, $t2, -55
bge $t2, $t4, _IL
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _IH
_IK :
li $t3, 97
blt $t2, $t3, _IL
li $t3, 102
bgt $t2, $t3, _IL
addi $t2, $t2, -87
bge $t2, $t4, _IL
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _IH
_IL :
li $t1, -1
j _IH
_IO :
li $t4, -1
bne $t4, $t1, _IM
li $t0, 0
j _IP
_IM :
li $t4, 1
bne $t4, $t1, _IP
sub $t0, $zero, $t0
_IP :
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
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
_IY :
addi $s0, $fp, -16
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -20
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _IZ
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
bne $t3, $t2, _JU
j _JT
_JU :
li $t3, 0
bne $t3, $t2, _JV
j _JT
_JV :
li $t3, 10
bne $t3, $t2, _JA
j _JT
_JA :
li $t3, 45
bne $t3, $t2, _JB
li $t1, 1
j _JC
_JB :
li $t3, 43
bne $t3, $t2, _JD
_JC :
lb $t2, 0($a0)
addi $a0, $a0, 1
_JD :
li $t3, 13
bne $t2, $t3, _JW
j _JT
_JW :
li $t3, 0
bne $t2, $t3, _JX
j _JT
_JX :
li $t3, 10
bne $t2, $t3, _JR
j _JT
_JR :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _JE
li $t1, -1
j _JL
_JE :
li $t3, 10
bgt $t3, $t2, _JF
li $t1, -1
j _JL
_JF :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _JL
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _JY
j _JT
_JY :
li $t3, 0
bne $t2, $t3, _JZ
j _JT
_JZ :
li $t3, 10
bne $t2, $t3, _JG
j _JT
_JG :
li $t3, 88
beq $t2, $t3, _JK
li $t3, 120
beq $t2, $t3, _JK
j _JH
_JK :
li $t4, 16
j _JL
_JH :
li $t3, 48
bge $t2, $t3, _JI
li $t1, -1
j _JL
_JI :
li $t3, 57
ble $t2, $t3, _JJ
li $t1, -1
j _JL
_JJ :
addi $t2, $t2, -48
move $t0, $t2
_JL :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _KA
j _JS
_KA :
li $t3, 0
bne $t2, $t3, _KB
j _JS
_KB :
li $t3, 10
bne $t2, $t3, _JM
j _JS
_JM :
li $t3, 48
blt $t2, $t3, _JP
li $t3, 57
bgt $t2, $t3, _JN
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _JL
_JN :
li $t3, 65
blt $t2, $t3, _JP
li $t3, 70
bgt $t2, $t3, _JO
addi $t2, $t2, -55
bge $t2, $t4, _JP
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _JL
_JO :
li $t3, 97
blt $t2, $t3, _JP
li $t3, 102
bgt $t2, $t3, _JP
addi $t2, $t2, -87
bge $t2, $t4, _JP
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _JL
_JP :
li $t1, -1
j _JL
_JS :
li $t4, -1
bne $t4, $t1, _JQ
li $t0, 0
j _JT
_JQ :
li $t4, 1
bne $t4, $t1, _JT
sub $t0, $zero, $t0
_JT :
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
bne $t3, $t2, _KW
j _KV
_KW :
li $t3, 0
bne $t3, $t2, _KX
j _KV
_KX :
li $t3, 10
bne $t3, $t2, _KC
j _KV
_KC :
li $t3, 45
bne $t3, $t2, _KD
li $t1, 1
j _KE
_KD :
li $t3, 43
bne $t3, $t2, _KF
_KE :
lb $t2, 0($a0)
addi $a0, $a0, 1
_KF :
li $t3, 13
bne $t2, $t3, _KY
j _KV
_KY :
li $t3, 0
bne $t2, $t3, _KZ
j _KV
_KZ :
li $t3, 10
bne $t2, $t3, _KT
j _KV
_KT :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _KG
li $t1, -1
j _KN
_KG :
li $t3, 10
bgt $t3, $t2, _KH
li $t1, -1
j _KN
_KH :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _KN
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _LA
j _KV
_LA :
li $t3, 0
bne $t2, $t3, _LB
j _KV
_LB :
li $t3, 10
bne $t2, $t3, _KI
j _KV
_KI :
li $t3, 88
beq $t2, $t3, _KM
li $t3, 120
beq $t2, $t3, _KM
j _KJ
_KM :
li $t4, 16
j _KN
_KJ :
li $t3, 48
bge $t2, $t3, _KK
li $t1, -1
j _KN
_KK :
li $t3, 57
ble $t2, $t3, _KL
li $t1, -1
j _KN
_KL :
addi $t2, $t2, -48
move $t0, $t2
_KN :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _LC
j _KU
_LC :
li $t3, 0
bne $t2, $t3, _LD
j _KU
_LD :
li $t3, 10
bne $t2, $t3, _KO
j _KU
_KO :
li $t3, 48
blt $t2, $t3, _KR
li $t3, 57
bgt $t2, $t3, _KP
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _KN
_KP :
li $t3, 65
blt $t2, $t3, _KR
li $t3, 70
bgt $t2, $t3, _KQ
addi $t2, $t2, -55
bge $t2, $t4, _KR
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _KN
_KQ :
li $t3, 97
blt $t2, $t3, _KR
li $t3, 102
bgt $t2, $t3, _KR
addi $t2, $t2, -87
bge $t2, $t4, _KR
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _KN
_KR :
li $t1, -1
j _KN
_KU :
li $t4, -1
bne $t4, $t1, _KS
li $t0, 0
j _KV
_KS :
li $t4, 1
bne $t4, $t1, _KV
sub $t0, $zero, $t0
_KV :
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
addi $s0, $fp, -24
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -36
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -40
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -44
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -48
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 20
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 48
addi $s0, $fp, -48
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 20
addi $sp, $sp, -4
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
addi $sp, $sp, 8
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -24
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $sp, $sp, 4
j _IY
_IZ :
li $t6, -20
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, 20
move $sp, $fp
jr $ra
Animal__set_name :
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
Animal__get_name :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
move $sp, $fp
jr $ra
Animal__init_age :
move $fp, $sp
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
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
Animal__add_age :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 8
lw $s0, 0($s0)
add $s0, $s1, $s0
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
Animal__get_age :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
move $sp, $fp
jr $ra
Animal__battle :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _LK
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
move $sp, $fp
jr $ra
Animal__get_voice :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _LN
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
Animal__init_power :
move $fp, $sp
move $sp, $fp
jr $ra
Animal__get_power :
move $fp, $sp
move $sp, $fp
jr $ra
Animal__add_power :
move $fp, $sp
move $sp, $fp
jr $ra
WildAnimal__init_power :
move $fp, $sp
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
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
move $sp, $fp
jr $ra
WildAnimal__add_power :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 8
lw $s0, 0($s0)
add $s0, $s1, $s0
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
addi $s0, $s0, 12
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
WildAnimal__get_power :
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
WildAnimal__battle :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _LW
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
move $sp, $fp
jr $ra
FarmAnimal__init_power :
move $fp, $sp
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
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
move $sp, $fp
jr $ra
FarmAnimal__add_power :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 8
lw $s0, 0($s0)
add $s0, $s1, $s0
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
addi $s0, $s0, 12
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
FarmAnimal__get_power :
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
Lion__get_voice :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _MC
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
Tiger__get_voice :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _MF
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
Sheep__get_voice :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _MI
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
la $s1, Animal
la $s0, Animal__set_name
sw $s0, 0($s1)
la $s0, Animal__get_name
sw $s0, 4($s1)
la $s0, Animal__init_age
sw $s0, 8($s1)
la $s0, Animal__add_age
sw $s0, 12($s1)
la $s0, Animal__get_age
sw $s0, 16($s1)
la $s0, Animal__battle
sw $s0, 20($s1)
la $s0, Animal__get_voice
sw $s0, 24($s1)
la $s0, Animal__init_power
sw $s0, 28($s1)
la $s0, Animal__get_power
sw $s0, 32($s1)
la $s0, Animal__add_power
sw $s0, 36($s1)
la $s1, WildAnimal
la $s0, Animal__set_name
sw $s0, 0($s1)
la $s0, Animal__get_name
sw $s0, 4($s1)
la $s0, Animal__init_age
sw $s0, 8($s1)
la $s0, Animal__add_age
sw $s0, 12($s1)
la $s0, Animal__get_age
sw $s0, 16($s1)
la $s0, WildAnimal__battle
sw $s0, 20($s1)
la $s0, Animal__get_voice
sw $s0, 24($s1)
la $s0, WildAnimal__init_power
sw $s0, 28($s1)
la $s0, WildAnimal__get_power
sw $s0, 32($s1)
la $s0, WildAnimal__add_power
sw $s0, 36($s1)
la $s1, FarmAnimal
la $s0, Animal__set_name
sw $s0, 0($s1)
la $s0, Animal__get_name
sw $s0, 4($s1)
la $s0, Animal__init_age
sw $s0, 8($s1)
la $s0, Animal__add_age
sw $s0, 12($s1)
la $s0, Animal__get_age
sw $s0, 16($s1)
la $s0, Animal__battle
sw $s0, 20($s1)
la $s0, Animal__get_voice
sw $s0, 24($s1)
la $s0, FarmAnimal__init_power
sw $s0, 28($s1)
la $s0, FarmAnimal__get_power
sw $s0, 32($s1)
la $s0, FarmAnimal__add_power
sw $s0, 36($s1)
la $s1, Lion
la $s0, Animal__set_name
sw $s0, 0($s1)
la $s0, Animal__get_name
sw $s0, 4($s1)
la $s0, Animal__init_age
sw $s0, 8($s1)
la $s0, Animal__add_age
sw $s0, 12($s1)
la $s0, Animal__get_age
sw $s0, 16($s1)
la $s0, WildAnimal__battle
sw $s0, 20($s1)
la $s0, Lion__get_voice
sw $s0, 24($s1)
la $s0, WildAnimal__init_power
sw $s0, 28($s1)
la $s0, WildAnimal__get_power
sw $s0, 32($s1)
la $s0, WildAnimal__add_power
sw $s0, 36($s1)
la $s1, Tiger
la $s0, Animal__set_name
sw $s0, 0($s1)
la $s0, Animal__get_name
sw $s0, 4($s1)
la $s0, Animal__init_age
sw $s0, 8($s1)
la $s0, Animal__add_age
sw $s0, 12($s1)
la $s0, Animal__get_age
sw $s0, 16($s1)
la $s0, WildAnimal__battle
sw $s0, 20($s1)
la $s0, Tiger__get_voice
sw $s0, 24($s1)
la $s0, WildAnimal__init_power
sw $s0, 28($s1)
la $s0, WildAnimal__get_power
sw $s0, 32($s1)
la $s0, WildAnimal__add_power
sw $s0, 36($s1)
la $s1, Sheep
la $s0, Animal__set_name
sw $s0, 0($s1)
la $s0, Animal__get_name
sw $s0, 4($s1)
la $s0, Animal__init_age
sw $s0, 8($s1)
la $s0, Animal__add_age
sw $s0, 12($s1)
la $s0, Animal__get_age
sw $s0, 16($s1)
la $s0, Animal__battle
sw $s0, 20($s1)
la $s0, Sheep__get_voice
sw $s0, 24($s1)
la $s0, FarmAnimal__init_power
sw $s0, 28($s1)
la $s0, FarmAnimal__get_power
sw $s0, 32($s1)
la $s0, FarmAnimal__add_power
sw $s0, 36($s1)
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
_W:
    .asciiz "Num of animals"
_X:
    .space 2
_CC:
    .asciiz "type and name of animal "
_CD:
    .space 4
_CK:
    .asciiz "L"
_CL:
    .space 3
_CR:
    .asciiz "T"
_CS:
    .space 3
_DC:
    .asciiz "Years :"
_DD:
    .space 1
_EI:
    .asciiz "Queries :"
_EJ:
    .space 3
_FO:
    .asciiz "id and d"
_FP:
    .space 4
_HU:
    .asciiz "Fights :"
_HV:
    .space 4
_LK:
    .asciiz "WRONG FIGHT"
_LL:
    .space 1
_LN:
    .asciiz "...."
_LO:
    .space 4
_LW:
    .asciiz "OKAY"
_LX:
    .space 4
_MC:
    .asciiz "LION"
_MD:
    .space 4
_MF:
    .asciiz "TIGER"
_MG:
    .space 3
_MI:
    .asciiz "SHEEP"
_MJ:
    .space 3
Animal:
    .word 0,0,0,0,0,0,0,0,0,0,0
WildAnimal:
    .word 0,0,0,0,0,0,0,0,0,0,0
FarmAnimal:
    .word 0,0,0,0,0,0,0,0,0,0,0
Lion:
    .word 0,0,0,0,0,0,0,0,0,0,0
Tiger:
    .word 0,0,0,0,0,0,0,0,0,0,0
Sheep:
    .word 0,0,0,0,0,0,0,0,0,0,0

