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
la $s0, _M
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
addi $s0, $fp, 8
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, 4
lw $s0, 0($s0)
mtc1 $s0, $f0
c.lt.s $f2, $f0
li $s0, 1
bc1t _O
li $s0, 0
_O :
addi $sp, $sp, -4
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
_C :
move $fp, $sp
addi $s0, $fp, 4
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $s0, $fp, 8
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
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
_D :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _P
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
addi $s0, $fp, 4
lw $t0, 0($s0)
beqz $t0, _R
addi $sp, $sp, -4
la $s0, _T
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
j _S
_R :
addi $sp, $sp, -4
la $s0, _V
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
_S :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
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
_E :
move $fp, $sp
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 5
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s2, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 5
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
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
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
or $s0, $s0, $s2
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _X
addi $sp, $sp, -4
la $s0, _Y
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
addi $sp, $sp, -4
li $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
_X :
addi $sp, $sp, -4
la $s0, _BA
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
addi $sp, $sp, -4
li $s0, 0
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
_F :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _BC
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
addi $sp, $sp, 12
addi $sp, $sp, -4
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
_G :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _CG
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
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
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
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CI
addi $sp, $sp, -4
li $s0, 0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
_CI :
addi $sp, $sp, -4
li $s0, 1
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
_H :
move $fp, $sp
addi $s0, $fp, 4
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
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
_I :
move $fp, $sp
addi $s0, $fp, 4
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
la $s0 _H
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
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
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
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
la $s0 _H
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 12
addi $s0, $fp, -12
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
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
_J :
move $fp, $sp
addi $s0, $fp, 4
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
la $s0 _I
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
addi $sp, $sp, 4
addi $s0, $fp, 4
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
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
la $s0 _I
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
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
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
_K :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 5
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
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
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 10
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
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -20
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
la $s0 _C
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 32
addi $s0, $fp, -32
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 16
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -4
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
la $t0, _CJ
l.s $f0, 0($t0)
addi $s0, $fp, -20
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -20
lw $s0, 0($s0)
mtc1 $s0, $f0
move $t0, $s0
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -20
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
la $t0, _CK
l.s $f0, 0($t0)
addi $s0, $fp, -20
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -20
lw $s0, 0($s0)
mtc1 $s0, $f0
move $t0, $s0
addi $s0, $fp, -16
mfc1 $t7, $f0
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -20
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -16
lw $s0, 0($s0)
mtc1 $s0, $f0
addi $sp, $sp, -4
addi $s0, $fp, -20
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
mtc1 $s0, $f0
addi $sp, $sp, -4
addi $s0, $fp, -24
mfc1 $t7, $f0
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
la $s0 _B
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
addi $s0, $fp, -20
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CL
addi $sp, $sp, -4
la $s0, _CN
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -20
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
li $s0, 1
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -20
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
la $s0 _D
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
j _CM
_CL :
addi $sp, $sp, -4
la $s0, _CP
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -20
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
li $s0, 0
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -20
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
la $s0 _D
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
_CR :
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
la $s0 _F
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 20
addi $s0, $fp, -20
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
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
bne $t3, $t2, _DN
j _DM
_DN :
li $t3, 0
bne $t3, $t2, _DO
j _DM
_DO :
li $t3, 10
bne $t3, $t2, _CT
j _DM
_CT :
li $t3, 45
bne $t3, $t2, _CU
li $t1, 1
j _CV
_CU :
li $t3, 43
bne $t3, $t2, _CW
_CV :
lb $t2, 0($a0)
addi $a0, $a0, 1
_CW :
li $t3, 13
bne $t2, $t3, _DP
j _DM
_DP :
li $t3, 0
bne $t2, $t3, _DQ
j _DM
_DQ :
li $t3, 10
bne $t2, $t3, _DK
j _DM
_DK :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _CX
li $t1, -1
j _DE
_CX :
li $t3, 10
bgt $t3, $t2, _CY
li $t1, -1
j _DE
_CY :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _DE
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _DR
j _DM
_DR :
li $t3, 0
bne $t2, $t3, _DS
j _DM
_DS :
li $t3, 10
bne $t2, $t3, _CZ
j _DM
_CZ :
li $t3, 88
beq $t2, $t3, _DD
li $t3, 120
beq $t2, $t3, _DD
j _DA
_DD :
li $t4, 16
j _DE
_DA :
li $t3, 48
bge $t2, $t3, _DB
li $t1, -1
j _DE
_DB :
li $t3, 57
ble $t2, $t3, _DC
li $t1, -1
j _DE
_DC :
addi $t2, $t2, -48
move $t0, $t2
_DE :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _DT
j _DL
_DT :
li $t3, 0
bne $t2, $t3, _DU
j _DL
_DU :
li $t3, 10
bne $t2, $t3, _DF
j _DL
_DF :
li $t3, 48
blt $t2, $t3, _DI
li $t3, 57
bgt $t2, $t3, _DG
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DE
_DG :
li $t3, 65
blt $t2, $t3, _DI
li $t3, 70
bgt $t2, $t3, _DH
addi $t2, $t2, -55
bge $t2, $t4, _DI
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DE
_DH :
li $t3, 97
blt $t2, $t3, _DI
li $t3, 102
bgt $t2, $t3, _DI
addi $t2, $t2, -87
bge $t2, $t4, _DI
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DE
_DI :
li $t1, -1
j _DE
_DL :
li $t4, -1
bne $t4, $t1, _DJ
li $t0, 0
j _DM
_DJ :
li $t4, 1
bne $t4, $t1, _DM
sub $t0, $zero, $t0
_DM :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
addi $s0, $fp, -24
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
la $s0 _G
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
addi $s0, $fp, -20
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -24
lw $s0, 0($s0)
and $s0, $s0, $s1
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -20
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CS
addi $sp, $sp, -4
la $s0, _DV
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -20
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
j _CR
_CS :
li $t6, -16
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 10
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -20
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
la $s0 _J
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
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -20
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 20
move $sp, $fp
jr $ra
_____main :
move $fp, $sp
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
la $s0 _K
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 4
addi $s0, $fp, -4
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
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
_M:
    .asciiz "check"
_N:
    .space 3
_P:
    .asciiz "zz!"
_Q:
    .space 1
_T:
    .asciiz "good z"
_U:
    .space 2
_V:
    .asciiz "bad z"
_W:
    .space 3
_Y:
    .asciiz "true"
_Z:
    .space 4
_BA:
    .asciiz "pulse"
_BB:
    .space 3
_BC:
    .asciiz "while..."
_BD:
    .space 4
_CG:
    .asciiz "Andy mandy"
_CH:
    .space 2
_CJ:
    .float 2.5
_CK:
    .float 5.5
_CN:
    .asciiz "t"
_CO:
    .space 3
_CP:
    .asciiz "f"
_CQ:
    .space 3
_DV:
    .asciiz "loop"
_DW:
    .space 4

