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
_BD :
move $fp, $sp
addi $sp, $sp, -4
addi $s0, $fp, 4
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _BF
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
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
syscall
li $a1, 1
li $a2, 0
_BH :
lbu $a2, 0($a0)
li $a3, 10
beq $a2, $a3, _BI
li $a3, 13
beq $a2, $a3, _BI
li $a3, 0
beq $a2, $a3, _BI
addi $a1, $a1, 1
addi $a0, $a0, 1
j _BH
_BI :
li $v0, 9
move $a0, $a1
syscall
move $v1, $v0
la $a0, __read
_BJ :
lbu $a2, 0($a0)
sb $zero, 0($a0)
li $a3, 10
beq $a2, $a3, _BK
li $a3, 13
beq $a2, $a3, _BK
li $a3, 0
beq $a2, $a3, _BK
sb $a2, 0($v0)
addi $v0, $v0, 1
addi $a0, $a0, 1
j _BJ
_BK :
sw $v1, 0($sp)
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
la $s0, _BL
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s2, $s0
li $s0, 1
_BN :
lb $t0, 0($s1)
lb $t1, 0($s2)
addi $s1, $s1, 1
addi $s2, $s2, 1
beq $t0, $t1, _BO
li $s0, 0
_BO :
beqz $t0, _BP
beqz $t1, _BP
j _BN
_BP :
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, -4
la $s0, _BQ
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s2, $s0
li $s0, 1
_BS :
lb $t0, 0($s1)
lb $t1, 0($s2)
addi $s1, $s1, 1
addi $s2, $s2, 1
beq $t0, $t1, _BT
li $s0, 0
_BT :
beqz $t0, _BU
beqz $t1, _BU
j _BS
_BU :
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
or $s0, $s0, $s1
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 8
move $sp, $fp
jr $ra
_____main :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $sp, $sp, -4
li $s0, 1
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
li $a0, 16
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
la $s0, House
sw $s0, 0($v0)
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
addi $s0, $fp, -8
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
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
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
addi $sp, $sp, 4
addi $s0, $fp, -8
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
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
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
addi $sp, $sp, 4
_BV :
addi $s0, $fp, -4
lw $t0, 0($s0)
beqz $t0, _BW
addi $s0, $fp, -8
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
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $s0, 0($s0)
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
addi $sp, $sp, 4
addi $sp, $sp, -4
la $s0, _BX
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
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
la $s0 _BD
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
j _BV
_BW :
li $t6, -8
add $t6, $t6, $fp
move $sp, $t6
addi $s0, $fp, -8
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
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 20
lw $s0, 0($s0)
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
addi $sp, $sp, 4
addi $sp, $sp, -4
la $s0, _BZ
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
addi $sp, $sp, -4
la $s0, _CB
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
addi $sp, $sp, -4
la $s0, _CD
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
addi $sp, $sp, 8
move $sp, $fp
jr $ra
Random__Init :
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
Random__GenRandom :
move $fp, $sp
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 15625
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 10000
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
mult $s0, $s1
mflo $s0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 22221
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 1
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
div $s1, $s0
mfhi $s0
addi $sp, $sp, 8
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
addi $s0, $s0, 4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
move $sp, $fp
jr $ra
Random__RndInt :
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
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
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 8
lw $s0, 0($s0)
div $s1, $s0
mfhi $s0
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
move $sp, $fp
jr $ra
Deck__Init :
move $fp, $sp
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 52
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
Deck__Shuffle :
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
addi $s0, $s0, 4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
_CK :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 52
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
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CL
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 13
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
div $s1, $s0
mfhi $s0
addi $sp, $sp, 8
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
addi $s0, $s0, 8
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
j _CK
_CL :
li $t6, 0
add $t6, $t6, $fp
move $sp, $t6
_CM :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CN
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $t8-4
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
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
sub $s0, $s1, $s0
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
addi $s0, $s0, 4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, 8
j _CM
_CN :
li $t6, 0
add $t6, $t6, $fp
move $sp, $t6
move $sp, $fp
jr $ra
Deck__GetCard :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 52
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s2, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 52
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
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

addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
or $s0, $s0, $s2
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CP
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
_CP :
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
move $sp, $fp
jr $ra
BJDeck__Init :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 8
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
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
_CR :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 8
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
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
beqz $t0, _CS
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, -4
li $a0, 12
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
la $s0, Deck
sw $s0, 0($v0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
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
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -4
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
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
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
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
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
j _CR
_CS :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, 4
move $sp, $fp
jr $ra
BJDeck__DealCard :
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
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 8
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 52
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
mult $s0, $s1
mflo $s0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s2, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 8
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 52
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
mult $s0, $s1
mflo $s0
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
or $s0, $s0, $s2
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CU
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 11
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
_CU :
_CV :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
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

addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CW
addi $sp, $sp, -4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 8
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $t8-4
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
addi $s0, $t8-4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 24
addi $s0, $fp, -24
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 16
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
addi $s0, $fp, -8
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $s0, $s0, 8
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
addi $sp, $sp, 4
j _CV
_CW :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 10
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
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
beqz $t0, _CX
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 10
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
j _CY
_CX :
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
xor $t0, $s0, $s1
slt $t1, $t0, $zero
slt $t0, $zero, $t0
or $t0, $t0, $t1
li $t1, 1
sub $s0, $t1, $t0

addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CZ
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 11
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
_CZ :
_CY :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
move $sp, $fp
jr $ra
BJDeck__Shuffle :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
la $s0, _DB
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
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
_DD :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 8
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
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
beqz $t0, _DE
addi $s0, $fp, -4
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
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
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
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
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
j _DD
_DE :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
la $s0, _DF
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, 4
move $sp, $fp
jr $ra
BJDeck__NumCardsRemaining :
move $fp, $sp
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 8
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 52
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
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
sub $s0, $s1, $s0
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
move $sp, $fp
jr $ra
Player__Init :
move $fp, $sp
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1000
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 20
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
la $s0, _DJ
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, 8
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _DL
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
syscall
li $a1, 1
li $a2, 0
_DN :
lbu $a2, 0($a0)
li $a3, 10
beq $a2, $a3, _DO
li $a3, 13
beq $a2, $a3, _DO
li $a3, 0
beq $a2, $a3, _DO
addi $a1, $a1, 1
addi $a0, $a0, 1
j _DN
_DO :
li $v0, 9
move $a0, $a1
syscall
move $v1, $v0
la $a0, __read
_DP :
lbu $a2, 0($a0)
sb $zero, 0($a0)
li $a3, 10
beq $a2, $a3, _DQ
li $a3, 13
beq $a2, $a3, _DQ
li $a3, 0
beq $a2, $a3, _DQ
sb $a2, 0($v0)
addi $v0, $v0, 1
addi $a0, $a0, 1
j _DP
_DQ :
sw $v1, 0($sp)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
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
Player__Hit :
move $fp, $sp
addi $sp, $sp, -4
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
addi $s0, $fp, 8
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _DS
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, -4
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _DU
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
add $s0, $s1, $s0
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
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
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
addiu $s0, $s0, 11
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

addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _DW
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
_DW :
_DX :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 21
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
slt $s0, $s1, $s0
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
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
and $s0, $s0, $s1
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _DY
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 10
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
j _DX
_DY :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, 4
move $sp, $fp
jr $ra
Player__DoubleDown :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 10
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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

addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
li $t0, 1
sub $s0, $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 11
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
lw $s0, 0($s0)
li $t0, 1
sub $s0, $t0, $s0
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
and $s0, $s0, $s1
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _EA
addi $sp, $sp, -4
li $s0, 0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
_EA :
addi $sp, $sp, -4
la $s0, _EC
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
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
la $s0 _BD
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _EB
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 2
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 16
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 16
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
addi $s0, $fp, 4
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _EE
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _EG
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
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
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 4
_EB :
addi $sp, $sp, -4
li $s0, 0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 8
move $sp, $fp
jr $ra
Player__TakeTurn :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
la $s0, _EJ
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _EL
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
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
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
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
addi $s0, $fp, 4
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
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
addi $s0, $fp, 4
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
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
addi $s0, $fp, 4
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
li $t0, 1
sub $s0, $t0, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _EN
addi $sp, $sp, -4
li $s0, 1
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
_EO :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 21
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s2, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 21
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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

addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
or $s0, $s0, $s2
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
and $s0, $s0, $s1
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _EP
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _EQ
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _ES
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _EU
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
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
la $s0 _BD
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
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
addi $s0, $fp, -4
lw $t0, 0($s0)
beqz $t0, _EW
addi $s0, $fp, 8
lw $s0, 0($s0)
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
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
_EW :
j _EO
_EP :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
_EN :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 21
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
beqz $t0, _EX
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _EZ
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _FB
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
j _EY
_EX :
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _FD
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _FF
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
_EY :
addi $sp, $sp, 4
move $sp, $fp
jr $ra
Player__HasMoney :
move $fp, $sp
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 20
lw $s0, 0($s0)
slt $s0, $s1, $s0
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
move $sp, $fp
jr $ra
Player__PrintMoney :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _FJ
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
addi $s0, $s0, 20
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _FL
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
Player__PlaceBet :
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
addi $s0, $s0, 16
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
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 20
lw $s0, 0($s0)
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
_FO :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 16
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
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
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 16
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
lw $s0, 0($s0)
or $s0, $s0, $s2
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 20
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 16
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
or $s0, $s0, $s1
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _FP
addi $sp, $sp, -4
la $s0, _FQ
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
bne $t3, $t2, _GM
j _GL
_GM :
li $t3, 0
bne $t3, $t2, _GN
j _GL
_GN :
li $t3, 10
bne $t3, $t2, _FS
j _GL
_FS :
li $t3, 45
bne $t3, $t2, _FT
li $t1, 1
j _FU
_FT :
li $t3, 43
bne $t3, $t2, _FV
_FU :
lb $t2, 0($a0)
addi $a0, $a0, 1
_FV :
li $t3, 13
bne $t2, $t3, _GO
j _GL
_GO :
li $t3, 0
bne $t2, $t3, _GP
j _GL
_GP :
li $t3, 10
bne $t2, $t3, _GJ
j _GL
_GJ :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _FW
li $t1, -1
j _GD
_FW :
li $t3, 10
bgt $t3, $t2, _FX
li $t1, -1
j _GD
_FX :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _GD
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _GQ
j _GL
_GQ :
li $t3, 0
bne $t2, $t3, _GR
j _GL
_GR :
li $t3, 10
bne $t2, $t3, _FY
j _GL
_FY :
li $t3, 88
beq $t2, $t3, _GC
li $t3, 120
beq $t2, $t3, _GC
j _FZ
_GC :
li $t4, 16
j _GD
_FZ :
li $t3, 48
bge $t2, $t3, _GA
li $t1, -1
j _GD
_GA :
li $t3, 57
ble $t2, $t3, _GB
li $t1, -1
j _GD
_GB :
addi $t2, $t2, -48
move $t0, $t2
_GD :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _GS
j _GK
_GS :
li $t3, 0
bne $t2, $t3, _GT
j _GK
_GT :
li $t3, 10
bne $t2, $t3, _GE
j _GK
_GE :
li $t3, 48
blt $t2, $t3, _GH
li $t3, 57
bgt $t2, $t3, _GF
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _GD
_GF :
li $t3, 65
blt $t2, $t3, _GH
li $t3, 70
bgt $t2, $t3, _GG
addi $t2, $t2, -55
bge $t2, $t4, _GH
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _GD
_GG :
li $t3, 97
blt $t2, $t3, _GH
li $t3, 102
bgt $t2, $t3, _GH
addi $t2, $t2, -87
bge $t2, $t4, _GH
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _GD
_GH :
li $t1, -1
j _GD
_GK :
li $t4, -1
bne $t4, $t1, _GI
li $t0, 0
j _GL
_GI :
li $t4, 1
bne $t4, $t1, _GL
sub $t0, $zero, $t0
_GL :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 16
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
j _FO
_FP :
li $t6, 0
add $t6, $t6, $fp
move $sp, $t6
move $sp, $fp
jr $ra
Player__GetTotal :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $v0, $s0
move $sp, $fp
jr $ra
move $sp, $fp
jr $ra
Player__Resolve :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
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
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 21
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 2
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -16
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
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -16
lw $s0, 0($s0)
and $s0, $s0, $s1
addi $sp, $sp, 8
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _GW
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 2
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
j _GX
_GW :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 21
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
beqz $t0, _GY
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
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
j _GZ
_GY :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 21
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 8
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
beqz $t0, _HA
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
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
j _HB
_HA :
addi $s0, $fp, 8
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
beqz $t0, _HC
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
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
j _HD
_HC :
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
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _HE
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
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
_HE :
_HD :
_HB :
_GZ :
_GX :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s2, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
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
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
or $s0, $s0, $s2
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _HF
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _HH
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 16
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _HJ
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
j _HG
_HF :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s2, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
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

addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
or $s0, $s0, $s2
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _HL
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _HN
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 16
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _HP
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
j _HM
_HL :
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _HR
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
_HM :
_HG :
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 16
lw $s0, 0($s0)
mult $s0, $s1
mflo $s0
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
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 16
lw $s0, 0($s0)
mult $s0, $s1
mflo $s0
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 20
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
add $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
lw $s0, 0($s0)
sub $s0, $s1, $s0
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
addi $s0, $s0, 20
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, 8
move $sp, $fp
jr $ra
House__SetupGame :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _HU
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
la $s0, _HW
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
li $a0, 8
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
la $s0, Random
sw $s0, 0($v0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $t8-4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
la $s0, _HY
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
bne $t3, $t2, _IU
j _IT
_IU :
li $t3, 0
bne $t3, $t2, _IV
j _IT
_IV :
li $t3, 10
bne $t3, $t2, _IA
j _IT
_IA :
li $t3, 45
bne $t3, $t2, _IB
li $t1, 1
j _IC
_IB :
li $t3, 43
bne $t3, $t2, _ID
_IC :
lb $t2, 0($a0)
addi $a0, $a0, 1
_ID :
li $t3, 13
bne $t2, $t3, _IW
j _IT
_IW :
li $t3, 0
bne $t2, $t3, _IX
j _IT
_IX :
li $t3, 10
bne $t2, $t3, _IR
j _IT
_IR :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _IE
li $t1, -1
j _IL
_IE :
li $t3, 10
bgt $t3, $t2, _IF
li $t1, -1
j _IL
_IF :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _IL
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _IY
j _IT
_IY :
li $t3, 0
bne $t2, $t3, _IZ
j _IT
_IZ :
li $t3, 10
bne $t2, $t3, _IG
j _IT
_IG :
li $t3, 88
beq $t2, $t3, _IK
li $t3, 120
beq $t2, $t3, _IK
j _IH
_IK :
li $t4, 16
j _IL
_IH :
li $t3, 48
bge $t2, $t3, _II
li $t1, -1
j _IL
_II :
li $t3, 57
ble $t2, $t3, _IJ
li $t1, -1
j _IL
_IJ :
addi $t2, $t2, -48
move $t0, $t2
_IL :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _JA
j _IS
_JA :
li $t3, 0
bne $t2, $t3, _JB
j _IS
_JB :
li $t3, 10
bne $t2, $t3, _IM
j _IS
_IM :
li $t3, 48
blt $t2, $t3, _IP
li $t3, 57
bgt $t2, $t3, _IN
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _IL
_IN :
li $t3, 65
blt $t2, $t3, _IP
li $t3, 70
bgt $t2, $t3, _IO
addi $t2, $t2, -55
bge $t2, $t4, _IP
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _IL
_IO :
li $t3, 97
blt $t2, $t3, _IP
li $t3, 102
bgt $t2, $t3, _IP
addi $t2, $t2, -87
bge $t2, $t4, _IP
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _IL
_IP :
li $t1, -1
j _IL
_IS :
li $t4, -1
bne $t4, $t1, _IQ
li $t0, 0
j _IT
_IQ :
li $t4, 1
bne $t4, $t1, _IT
sub $t0, $zero, $t0
_IT :
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
addi $s0, $t8-4
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
addi $s0, $t8-4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 16
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
li $a0, 12
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
la $s0, BJDeck
sw $s0, 0($v0)
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
addi $sp, $sp, -4
li $a0, 28
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
la $s0, Dealer
sw $s0, 0($v0)
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
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
lw $s0, 0($s0)
addi $s0, $s0, 12
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
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
move $sp, $fp
jr $ra
House__SetupPlayers :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
addi $sp, $sp, -4
la $s0, _JD
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
bne $t3, $t2, _JZ
j _JY
_JZ :
li $t3, 0
bne $t3, $t2, _KA
j _JY
_KA :
li $t3, 10
bne $t3, $t2, _JF
j _JY
_JF :
li $t3, 45
bne $t3, $t2, _JG
li $t1, 1
j _JH
_JG :
li $t3, 43
bne $t3, $t2, _JI
_JH :
lb $t2, 0($a0)
addi $a0, $a0, 1
_JI :
li $t3, 13
bne $t2, $t3, _KB
j _JY
_KB :
li $t3, 0
bne $t2, $t3, _KC
j _JY
_KC :
li $t3, 10
bne $t2, $t3, _JW
j _JY
_JW :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _JJ
li $t1, -1
j _JQ
_JJ :
li $t3, 10
bgt $t3, $t2, _JK
li $t1, -1
j _JQ
_JK :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _JQ
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _KD
j _JY
_KD :
li $t3, 0
bne $t2, $t3, _KE
j _JY
_KE :
li $t3, 10
bne $t2, $t3, _JL
j _JY
_JL :
li $t3, 88
beq $t2, $t3, _JP
li $t3, 120
beq $t2, $t3, _JP
j _JM
_JP :
li $t4, 16
j _JQ
_JM :
li $t3, 48
bge $t2, $t3, _JN
li $t1, -1
j _JQ
_JN :
li $t3, 57
ble $t2, $t3, _JO
li $t1, -1
j _JQ
_JO :
addi $t2, $t2, -48
move $t0, $t2
_JQ :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _KF
j _JX
_KF :
li $t3, 0
bne $t2, $t3, _KG
j _JX
_KG :
li $t3, 10
bne $t2, $t3, _JR
j _JX
_JR :
li $t3, 48
blt $t2, $t3, _JU
li $t3, 57
bgt $t2, $t3, _JS
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _JQ
_JS :
li $t3, 65
blt $t2, $t3, _JU
li $t3, 70
bgt $t2, $t3, _JT
addi $t2, $t2, -55
bge $t2, $t4, _JU
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _JQ
_JT :
li $t3, 97
blt $t2, $t3, _JU
li $t3, 102
bgt $t2, $t3, _JU
addi $t2, $t2, -87
bge $t2, $t4, _JU
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _JQ
_JU :
li $t1, -1
j _JQ
_JX :
li $t4, -1
bne $t4, $t1, _JV
li $t0, 0
j _JY
_JV :
li $t4, 1
bne $t4, $t1, _JY
sub $t0, $zero, $t0
_JY :
move $s0, $t0
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
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, -12
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
addi $s0, $fp, -4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
_KH :
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $s0, $fp, -4
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
beqz $t0, _KI
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, -4
li $a0, 28
li $v0, 9
syscall
move $s0, $v0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
la $s0, Player
sw $s0, 0($v0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 1
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -4
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
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $s0, $fp, -24
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -28
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
addi $sp, $sp, 20
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
addi $s0, $fp, -4
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
addi $s0, $fp, -4
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
j _KH
_KI :
li $t6, -8
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, 8
move $sp, $fp
jr $ra
House__TakeAllBets :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
la $s0, _KK
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
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
_KM :
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
la $s0 ___array_length
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
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
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
beqz $t0, _KN
addi $s0, $fp, -4
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
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
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
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 16
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _KO
addi $s0, $fp, -4
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
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
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
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
_KO :
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
j _KM
_KN :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, 4
move $sp, $fp
jr $ra
House__TakeAllTurns :
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
_KQ :
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
la $s0 ___array_length
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
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
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
beqz $t0, _KR
addi $s0, $fp, -4
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
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
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
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 16
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _KS
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
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
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
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
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 20
addi $s0, $fp, -20
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 16
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
_KS :
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
j _KQ
_KR :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, 4
move $sp, $fp
jr $ra
House__ResolveAllPlayers :
move $fp, $sp
addi $sp, $sp, -4
addi $sp, $sp, -4
la $s0, _KU
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
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
_KW :
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
la $s0 ___array_length
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
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
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
beqz $t0, _KX
addi $s0, $fp, -4
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
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
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
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 16
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _KY
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 28
lw $s0, 0($s0)
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
addi $s0, $fp, -12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
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
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -24
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
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 32
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 24
addi $s0, $fp, -24
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 20
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $sp, $sp, 4
_KY :
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
j _KW
_KX :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, 4
move $sp, $fp
jr $ra
House__PrintAllMoney :
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
_LA :
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
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
la $s0 ___array_length
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
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
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
beqz $t0, _LB
addi $s0, $fp, -4
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
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
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
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 20
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 12
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
j _LA
_LB :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, 4
move $sp, $fp
jr $ra
House__PlayOneGame :
move $fp, $sp
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
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
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 26
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -8
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
beqz $t0, _LD
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
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
_LD :
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
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
la $s0, _LE
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
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
move $fp, $sp
jalr $s0
move $sp, $fp
addi $fp, $fp, 16
addi $s0, $fp, -16
lw $s0, 0($s0)
move $ra, $s0
move $s0, $v0
addi $sp, $sp, 16
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
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
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 8
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 12
lw $s0, 0($s0)
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 16
lw $s0, 0($s0)
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
move $sp, $fp
jr $ra
Dealer__Init :
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
addi $sp, $sp, -4
la $s0, _LH
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
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
Dealer__TakeTurn :
move $fp, $sp
addi $sp, $sp, -4
la $s0, _LK
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
addi $s0, $s0, 24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _LM
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
_LO :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 16
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
addiu $s0, $s0, 16
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
lw $s0, 0($s0)
or $s0, $s0, $s2
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _LP
addi $s0, $fp, 8
lw $s0, 0($s0)
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
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 0
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
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
j _LO
_LP :
li $t6, 0
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 21
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _LQ
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _LS
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
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _LU
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
j _LR
_LQ :
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 24
lw $a0, 0($s0)
li $v0, 4
syscall
addi $sp, $sp, -4
la $s0, _LW
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
li $v0, 1
syscall
addi $sp, $sp, -4
la $s0, _LY
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
_LR :
move $sp, $fp
jr $ra
main: move $t8, $sp
addi $sp, $sp, -8
la $s1, Random
la $s0, Random__Init
sw $s0, 0($s1)
la $s0, Random__GenRandom
sw $s0, 4($s1)
la $s0, Random__RndInt
sw $s0, 8($s1)
la $s1, Deck
la $s0, Deck__Init
sw $s0, 0($s1)
la $s0, Deck__Shuffle
sw $s0, 4($s1)
la $s0, Deck__GetCard
sw $s0, 8($s1)
la $s1, BJDeck
la $s0, BJDeck__Init
sw $s0, 0($s1)
la $s0, BJDeck__DealCard
sw $s0, 4($s1)
la $s0, BJDeck__Shuffle
sw $s0, 8($s1)
la $s0, BJDeck__NumCardsRemaining
sw $s0, 12($s1)
la $s1, Player
la $s0, Player__Init
sw $s0, 0($s1)
la $s0, Player__Hit
sw $s0, 4($s1)
la $s0, Player__DoubleDown
sw $s0, 8($s1)
la $s0, Player__TakeTurn
sw $s0, 12($s1)
la $s0, Player__HasMoney
sw $s0, 16($s1)
la $s0, Player__PrintMoney
sw $s0, 20($s1)
la $s0, Player__PlaceBet
sw $s0, 24($s1)
la $s0, Player__GetTotal
sw $s0, 28($s1)
la $s0, Player__Resolve
sw $s0, 32($s1)
la $s1, House
la $s0, House__SetupGame
sw $s0, 0($s1)
la $s0, House__SetupPlayers
sw $s0, 4($s1)
la $s0, House__TakeAllBets
sw $s0, 8($s1)
la $s0, House__TakeAllTurns
sw $s0, 12($s1)
la $s0, House__ResolveAllPlayers
sw $s0, 16($s1)
la $s0, House__PrintAllMoney
sw $s0, 20($s1)
la $s0, House__PlayOneGame
sw $s0, 24($s1)
la $s1, Dealer
la $s0, Dealer__Init
sw $s0, 0($s1)
la $s0, Player__Hit
sw $s0, 4($s1)
la $s0, Player__DoubleDown
sw $s0, 8($s1)
la $s0, Dealer__TakeTurn
sw $s0, 12($s1)
la $s0, Player__HasMoney
sw $s0, 16($s1)
la $s0, Player__PrintMoney
sw $s0, 20($s1)
la $s0, Player__PlaceBet
sw $s0, 24($s1)
la $s0, Player__GetTotal
sw $s0, 28($s1)
la $s0, Player__Resolve
sw $s0, 32($s1)
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
_BF:
    .asciiz " (y/n) "
_BG:
    .space 1
_BL:
    .asciiz "y"
_BM:
    .space 3
_BQ:
    .asciiz "Y"
_BR:
    .space 3
_BX:
    .asciiz "\nDo you want to play another hand?"
_BY:
    .space 1
_BZ:
    .asciiz "Thank you for playing...come again soon.\n"
_CA:
    .space 2
_CB:
    .asciiz "\nCS143 BlackJack Copyright (c) 1999 by Peter Mork.\n"
_CC:
    .space 3
_CD:
    .asciiz "(2001 mods by jdz)\n"
_CE:
    .space 4
_DB:
    .asciiz "Shuffling..."
_DC:
    .space 4
_DF:
    .asciiz "done.\n"
_DG:
    .space 1
_DJ:
    .asciiz "What is the name of player #"
_DK:
    .space 4
_DL:
    .asciiz "? "
_DM:
    .space 2
_DS:
    .asciiz " was dealt a "
_DT:
    .space 3
_DU:
    .asciiz ".\n"
_DV:
    .space 1
_EC:
    .asciiz "Would you like to double down?"
_ED:
    .space 2
_EE:
    .asciiz ", your total is "
_EF:
    .space 4
_EG:
    .asciiz ".\n"
_EH:
    .space 1
_EJ:
    .asciiz "\n"
_EK:
    .space 2
_EL:
    .asciiz "'s turn.\n"
_EM:
    .space 2
_EQ:
    .asciiz ", your total is "
_ER:
    .space 4
_ES:
    .asciiz ".\n"
_ET:
    .space 1
_EU:
    .asciiz "Would you like a hit?"
_EV:
    .space 3
_EZ:
    .asciiz " busts with the big "
_FA:
    .space 4
_FB:
    .asciiz "!\n"
_FC:
    .space 1
_FD:
    .asciiz " stays at "
_FE:
    .space 2
_FF:
    .asciiz ".\n"
_FG:
    .space 1
_FJ:
    .asciiz ", you have $"
_FK:
    .space 4
_FL:
    .asciiz ".\n"
_FM:
    .space 1
_FQ:
    .asciiz "How much would you like to bet? "
_FR:
    .space 4
_HH:
    .asciiz ", you won $"
_HI:
    .space 1
_HJ:
    .asciiz ".\n"
_HK:
    .space 1
_HN:
    .asciiz ", you lost $"
_HO:
    .space 4
_HP:
    .asciiz ".\n"
_HQ:
    .space 1
_HR:
    .asciiz ", you push!\n"
_HS:
    .space 3
_HU:
    .asciiz "\nWelcome to CS143 BlackJack!\n"
_HV:
    .space 1
_HW:
    .asciiz "---------------------------\n"
_HX:
    .space 3
_HY:
    .asciiz "Please enter a random number seed: "
_HZ:
    .space 1
_JD:
    .asciiz "How many players do we have today? "
_JE:
    .space 1
_KK:
    .asciiz "\nFirst, let's take bets.\n"
_KL:
    .space 1
_KU:
    .asciiz "\nTime to resolve bets.\n"
_KV:
    .space 3
_LE:
    .asciiz "\nDealer starts. "
_LF:
    .space 3
_LH:
    .asciiz "Dealer"
_LI:
    .space 2
_LK:
    .asciiz "\n"
_LL:
    .space 2
_LM:
    .asciiz "'s turn.\n"
_LN:
    .space 2
_LS:
    .asciiz " busts with the big "
_LT:
    .space 4
_LU:
    .asciiz "!\n"
_LV:
    .space 1
_LW:
    .asciiz " stays at "
_LX:
    .space 2
_LY:
    .asciiz ".\n"
_LZ:
    .space 1
Random:
    .word 0,0,0,0
Deck:
    .word 0,0,0,0
BJDeck:
    .word 0,0,0,0,0
Player:
    .word 0,0,0,0,0,0,0,0,0,0
House:
    .word 0,0,0,0,0,0,0,0
Dealer:
    .word 0,0,0,0,0,0,0,0,0,0

