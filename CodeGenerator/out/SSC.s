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
_G :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, -4
li $s0, 1
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
addi $s0, $fp, 4
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
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 16
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 20
addi $s0, $fp, -20
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
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
_J :
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
la $s0 ___array_length
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _K
addi $sp, $sp, -4
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
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
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $t8-12
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
li $t0, 1
sub $s0, $t0, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _L
addi $s0, $fp, -12
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
la $s0 _G
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
_L :
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
j _J
_K :
li $t6, -8
add $t6, $t6, $fp
move $sp, $t6
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $t8-16
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
addi $s0, $t8-16
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 20
addi $s0, $fp, -20
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, 8
move $sp, $fp
jr $ra
_H :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, -4
li $s0, 1
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $t8-8
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
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $t8-8
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
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 16
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 20
addi $s0, $fp, -20
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
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
_M :
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
la $s0 ___array_length
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _N
addi $sp, $sp, -4
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
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
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $t8-12
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
li $t0, 1
sub $s0, $t0, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _O
addi $s0, $fp, -12
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
la $s0 _H
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
_O :
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
j _M
_N :
li $t6, -8
add $t6, $t6, $fp
move $sp, $t6
addi $s0, $fp, 4
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, 8
move $sp, $fp
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
li $a0, 16
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
la $s0, vector
sw $s0, 0($v0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $t8-16
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
addi $s0, $t8-16
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 0
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
bne $t3, $t2, _BJ
j _BI
_BJ :
li $t3, 0
bne $t3, $t2, _BK
j _BI
_BK :
li $t3, 10
bne $t3, $t2, _P
j _BI
_P :
li $t3, 45
bne $t3, $t2, _Q
li $t1, 1
j _R
_Q :
li $t3, 43
bne $t3, $t2, _S
_R :
lb $t2, 0($a0)
addi $a0, $a0, 1
_S :
li $t3, 13
bne $t2, $t3, _BL
j _BI
_BL :
li $t3, 0
bne $t2, $t3, _BM
j _BI
_BM :
li $t3, 10
bne $t2, $t3, _BG
j _BI
_BG :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _T
li $t1, -1
j _BA
_T :
li $t3, 10
bgt $t3, $t2, _U
li $t1, -1
j _BA
_U :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _BA
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BN
j _BI
_BN :
li $t3, 0
bne $t2, $t3, _BO
j _BI
_BO :
li $t3, 10
bne $t2, $t3, _V
j _BI
_V :
li $t3, 88
beq $t2, $t3, _Z
li $t3, 120
beq $t2, $t3, _Z
j _W
_Z :
li $t4, 16
j _BA
_W :
li $t3, 48
bge $t2, $t3, _X
li $t1, -1
j _BA
_X :
li $t3, 57
ble $t2, $t3, _Y
li $t1, -1
j _BA
_Y :
addi $t2, $t2, -48
move $t0, $t2
_BA :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BP
j _BH
_BP :
li $t3, 0
bne $t2, $t3, _BQ
j _BH
_BQ :
li $t3, 10
bne $t2, $t3, _BB
j _BH
_BB :
li $t3, 48
blt $t2, $t3, _BE
li $t3, 57
bgt $t2, $t3, _BC
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BA
_BC :
li $t3, 65
blt $t2, $t3, _BE
li $t3, 70
bgt $t2, $t3, _BD
addi $t2, $t2, -55
bge $t2, $t4, _BE
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BA
_BD :
li $t3, 97
blt $t2, $t3, _BE
li $t3, 102
bgt $t2, $t3, _BE
addi $t2, $t2, -87
bge $t2, $t4, _BE
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BA
_BE :
li $t1, -1
j _BA
_BH :
li $t4, -1
bne $t4, $t1, _BF
li $t0, 0
j _BI
_BF :
li $t4, 1
bne $t4, $t1, _BI
sub $t0, $zero, $t0
_BI :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
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
bne $t3, $t2, _CL
j _CK
_CL :
li $t3, 0
bne $t3, $t2, _CM
j _CK
_CM :
li $t3, 10
bne $t3, $t2, _BR
j _CK
_BR :
li $t3, 45
bne $t3, $t2, _BS
li $t1, 1
j _BT
_BS :
li $t3, 43
bne $t3, $t2, _BU
_BT :
lb $t2, 0($a0)
addi $a0, $a0, 1
_BU :
li $t3, 13
bne $t2, $t3, _CN
j _CK
_CN :
li $t3, 0
bne $t2, $t3, _CO
j _CK
_CO :
li $t3, 10
bne $t2, $t3, _CI
j _CK
_CI :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _BV
li $t1, -1
j _CC
_BV :
li $t3, 10
bgt $t3, $t2, _BW
li $t1, -1
j _CC
_BW :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _CC
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CP
j _CK
_CP :
li $t3, 0
bne $t2, $t3, _CQ
j _CK
_CQ :
li $t3, 10
bne $t2, $t3, _BX
j _CK
_BX :
li $t3, 88
beq $t2, $t3, _CB
li $t3, 120
beq $t2, $t3, _CB
j _BY
_CB :
li $t4, 16
j _CC
_BY :
li $t3, 48
bge $t2, $t3, _BZ
li $t1, -1
j _CC
_BZ :
li $t3, 57
ble $t2, $t3, _CA
li $t1, -1
j _CC
_CA :
addi $t2, $t2, -48
move $t0, $t2
_CC :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CR
j _CJ
_CR :
li $t3, 0
bne $t2, $t3, _CS
j _CJ
_CS :
li $t3, 10
bne $t2, $t3, _CD
j _CJ
_CD :
li $t3, 48
blt $t2, $t3, _CG
li $t3, 57
bgt $t2, $t3, _CE
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _CC
_CE :
li $t3, 65
blt $t2, $t3, _CG
li $t3, 70
bgt $t2, $t3, _CF
addi $t2, $t2, -55
bge $t2, $t4, _CG
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _CC
_CF :
li $t3, 97
blt $t2, $t3, _CG
li $t3, 102
bgt $t2, $t3, _CG
addi $t2, $t2, -87
bge $t2, $t4, _CG
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _CC
_CG :
li $t1, -1
j _CC
_CJ :
li $t4, -1
bne $t4, $t1, _CH
li $t0, 0
j _CK
_CH :
li $t4, 1
bne $t4, $t1, _CK
sub $t0, $zero, $t0
_CK :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
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
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
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
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
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
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
_CT :
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CU
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, -4
li $s0, 0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-12
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -28
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
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -28
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
j _CT
_CU :
li $t6, -24
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
_CV :
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CW
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, -4
li $a0, 16
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
la $s0, vector
sw $s0, 0($v0)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -28
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
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, -4
li $a0, 16
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
la $s0, vector
sw $s0, 0($v0)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-8
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -28
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
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $t8-4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -28
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $t8-4
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -28
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
addi $fp, $fp, 36
addi $s0, $fp, -36
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $t8-8
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -28
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $t8-8
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -28
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
addi $fp, $fp, 36
addi $s0, $fp, -36
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -28
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
j _CV
_CW :
li $t6, -24
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
_CX :
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CY
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
bne $t3, $t2, _DT
j _DS
_DT :
li $t3, 0
bne $t3, $t2, _DU
j _DS
_DU :
li $t3, 10
bne $t3, $t2, _CZ
j _DS
_CZ :
li $t3, 45
bne $t3, $t2, _DA
li $t1, 1
j _DB
_DA :
li $t3, 43
bne $t3, $t2, _DC
_DB :
lb $t2, 0($a0)
addi $a0, $a0, 1
_DC :
li $t3, 13
bne $t2, $t3, _DV
j _DS
_DV :
li $t3, 0
bne $t2, $t3, _DW
j _DS
_DW :
li $t3, 10
bne $t2, $t3, _DQ
j _DS
_DQ :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _DD
li $t1, -1
j _DK
_DD :
li $t3, 10
bgt $t3, $t2, _DE
li $t1, -1
j _DK
_DE :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _DK
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _DX
j _DS
_DX :
li $t3, 0
bne $t2, $t3, _DY
j _DS
_DY :
li $t3, 10
bne $t2, $t3, _DF
j _DS
_DF :
li $t3, 88
beq $t2, $t3, _DJ
li $t3, 120
beq $t2, $t3, _DJ
j _DG
_DJ :
li $t4, 16
j _DK
_DG :
li $t3, 48
bge $t2, $t3, _DH
li $t1, -1
j _DK
_DH :
li $t3, 57
ble $t2, $t3, _DI
li $t1, -1
j _DK
_DI :
addi $t2, $t2, -48
move $t0, $t2
_DK :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _DZ
j _DR
_DZ :
li $t3, 0
bne $t2, $t3, _EA
j _DR
_EA :
li $t3, 10
bne $t2, $t3, _DL
j _DR
_DL :
li $t3, 48
blt $t2, $t3, _DO
li $t3, 57
bgt $t2, $t3, _DM
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DK
_DM :
li $t3, 65
blt $t2, $t3, _DO
li $t3, 70
bgt $t2, $t3, _DN
addi $t2, $t2, -55
bge $t2, $t4, _DO
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DK
_DN :
li $t3, 97
blt $t2, $t3, _DO
li $t3, 102
bgt $t2, $t3, _DO
addi $t2, $t2, -87
bge $t2, $t4, _DO
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _DK
_DO :
li $t1, -1
j _DK
_DR :
li $t4, -1
bne $t4, $t1, _DP
li $t0, 0
j _DS
_DP :
li $t4, 1
bne $t4, $t1, _DS
sub $t0, $zero, $t0
_DS :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $fp, -36
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
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
bne $t3, $t2, _EV
j _EU
_EV :
li $t3, 0
bne $t3, $t2, _EW
j _EU
_EW :
li $t3, 10
bne $t3, $t2, _EB
j _EU
_EB :
li $t3, 45
bne $t3, $t2, _EC
li $t1, 1
j _ED
_EC :
li $t3, 43
bne $t3, $t2, _EE
_ED :
lb $t2, 0($a0)
addi $a0, $a0, 1
_EE :
li $t3, 13
bne $t2, $t3, _EX
j _EU
_EX :
li $t3, 0
bne $t2, $t3, _EY
j _EU
_EY :
li $t3, 10
bne $t2, $t3, _ES
j _EU
_ES :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _EF
li $t1, -1
j _EM
_EF :
li $t3, 10
bgt $t3, $t2, _EG
li $t1, -1
j _EM
_EG :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _EM
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _EZ
j _EU
_EZ :
li $t3, 0
bne $t2, $t3, _FA
j _EU
_FA :
li $t3, 10
bne $t2, $t3, _EH
j _EU
_EH :
li $t3, 88
beq $t2, $t3, _EL
li $t3, 120
beq $t2, $t3, _EL
j _EI
_EL :
li $t4, 16
j _EM
_EI :
li $t3, 48
bge $t2, $t3, _EJ
li $t1, -1
j _EM
_EJ :
li $t3, 57
ble $t2, $t3, _EK
li $t1, -1
j _EM
_EK :
addi $t2, $t2, -48
move $t0, $t2
_EM :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _FB
j _ET
_FB :
li $t3, 0
bne $t2, $t3, _FC
j _ET
_FC :
li $t3, 10
bne $t2, $t3, _EN
j _ET
_EN :
li $t3, 48
blt $t2, $t3, _EQ
li $t3, 57
bgt $t2, $t3, _EO
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EM
_EO :
li $t3, 65
blt $t2, $t3, _EQ
li $t3, 70
bgt $t2, $t3, _EP
addi $t2, $t2, -55
bge $t2, $t4, _EQ
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EM
_EP :
li $t3, 97
blt $t2, $t3, _EQ
li $t3, 102
bgt $t2, $t3, _EQ
addi $t2, $t2, -87
bge $t2, $t4, _EQ
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _EM
_EQ :
li $t1, -1
j _EM
_ET :
li $t4, -1
bne $t4, $t1, _ER
li $t0, 0
j _EU
_ER :
li $t4, 1
bne $t4, $t1, _EU
sub $t0, $zero, $t0
_EU :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $fp, -36
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -28
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -40
sw $t7, 0($s0)
addi $s0, $t8-4
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
addi $s0, $fp, -44
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -48
sw $t7, 0($s0)
addi $s0, $t8-4
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
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 48
addi $s0, $fp, -48
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 16
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -32
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -40
sw $t7, 0($s0)
addi $s0, $t8-8
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
addi $s0, $fp, -44
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -48
sw $t7, 0($s0)
addi $s0, $t8-8
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
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 48
addi $s0, $fp, -48
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 16
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, 8
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -28
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
j _CX
_CY :
li $t6, -24
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
_FD :
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _FE
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $t8-12
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -28
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
li $t0, 1
sub $s0, $t0, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _FF
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
la $s0 _G
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
_FF :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -28
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
j _FD
_FE :
li $t6, -24
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
_FG :
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _FH
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, -4
li $s0, 0
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-12
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -28
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
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -28
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
j _FG
_FH :
li $t6, -24
add $t6, $t6, $fp
move $sp, $t6
addi $s0, $t8-16
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
addi $s0, $t8-16
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 16
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
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -24
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
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
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
_FI :
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _FJ
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
sub $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
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
lw $s0, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -24
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
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -20
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -28
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
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -20
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -28
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
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -28
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
j _FI
_FJ :
li $t6, -24
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
_FK :
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _FL
addi $sp, $sp, -4
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -20
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
addi $s0, $fp, -28
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $t8-12
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
li $t0, 1
sub $s0, $t0, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $s0, $fp, -32
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _FM
addi $sp, $sp, -4
la $s0, _FN
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
addi $s0, $fp, -28
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -36
sw $t7, 0($s0)
la $s0 _H
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 36
addi $s0, $fp, -36
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -32
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
la $s0, _FP
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
_FM :
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -28
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, -28
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $sp, $sp, 4
j _FK
_FL :
li $t6, -24
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, 24
move $sp, $fp
jr $ra
vector__init :
move $fp, $sp
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
addi $s0, $s0, 4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
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
vector__push :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
xor $t0, $s0, $s1
slt $t1, $t0, $zero
slt $t0, $zero, $t0
or $t0, $t0, $t1
li $t1, 1
sub $s0, $t1, $t0

addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _FT
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 2
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
mult $s0, $s1
mflo $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
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
_FU :
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _FV
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -4
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
j _FU
_FV :
li $t6, -8
add $t6, $t6, $fp
move $sp, $t6
addi $s0, $fp, -4
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
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 2
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
mult $s0, $s1
mflo $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
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
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, 8
_FT :
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 8
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
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
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
move $sp, $fp
jr $ra
vector__pop :
move $fp, $sp
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
beqz $t0, _FX
move $sp, $fp
jr $ra
_FX :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
sub $s0, $s1, $s0
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
move $sp, $fp
jr $ra
vector__get :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s2, $s0
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 8
lw $s0, 0($s0)
xor $t0, $s0, $s1
slt $t1, $t0, $zero
slt $t0, $zero, $t0
or $t0, $t0, $t1
li $t1, 1
sub $s0, $t1, $t0

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
beqz $t0, _FZ
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
sub $s0, $zero, $s0
addi $sp, $sp, 4
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
_FZ :
addi $s0, $fp, 8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
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
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
move $sp, $fp
jr $ra
vector__get_vector :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
move $t5, $s0
addi $s0, $fp, -16
lw $s0, 0($s0)
addi $s0, $s0, 1
li $t6, 4
mult $s0, $t6
mflo $t6
add $s0, $t5, $t6
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -4
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
j _GB
_GC :
li $t6, -8
add $t6, $t6, $fp
move $sp, $t6
addi $s0, $fp, -4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 8
move $sp, $fp
jr $ra
main: move $t8, $sp
addi $sp, $sp, -20
la $s1, vector
la $s0, vector__init
sw $s0, 0($s1)
la $s0, vector__push
sw $s0, 4($s1)
la $s0, vector__pop
sw $s0, 8($s1)
la $s0, vector__get
sw $s0, 12($s1)
la $s0, vector__get_vector
sw $s0, 16($s1)
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
_FN:
    .asciiz "New SCC component"
_FO:
    .space 3
_FP:
    .asciiz "--------------"
_FQ:
    .space 2
vector:
    .word 0,0,0,0,0,0

