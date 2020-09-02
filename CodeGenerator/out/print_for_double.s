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
la $t0, _D
l.s $f0, 0($t0)
addi $s0, $fp, -8
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, -8
lw $s0, 0($s0)
mtc1 $s0, $f0
add.s $f0, $f2, $f0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -8
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
mtc1 $s0, $f0
move $t0, $s0
addi $s0, $fp, 4
mfc1 $t7, $f0
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -8
mfc1 $t7, $f0
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
_E :
addi $sp, $sp, -4
la $t0, _G
l.s $f0, 0($t0)
addi $s0, $fp, -8
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, 4
lw $s0, 0($s0)
mtc1 $s0, $f0
c.lt.s $f2, $f0
li $s0, 1
bc1t _H
li $s0, 0
_H :
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
la $t0, _I
l.s $f0, 0($t0)
addi $s0, $fp, -8
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, 4
lw $s0, 0($s0)
mtc1 $s0, $f0
c.eq.s $f2, $f0
li $s0, 1
bc1t _J
li $s0, 0
_J :
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
beqz $t0, _F
addi $sp, $sp, -4
la $t0, _K
l.s $f0, 0($t0)
addi $s0, $fp, -8
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, -8
lw $s0, 0($s0)
mtc1 $s0, $f0
div.s $f0, $f2, $f0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -8
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
mtc1 $s0, $f0
move $t0, $s0
addi $s0, $fp, 4
mfc1 $t7, $f0
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -8
mfc1 $t7, $f0
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
_L :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
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
lw $s0, 0($s0)
move $s2, $s0
addi $sp, $sp, 4
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
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
beqz $t0, _M
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
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
_N :
addi $sp, $sp, -4
la $t0, _P
l.s $f0, 0($t0)
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, 4
lw $s0, 0($s0)
mtc1 $s0, $f0
c.lt.s $f2, $f0
li $s0, 1
bc1t _Q
li $s0, 0
_Q :
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
la $t0, _R
l.s $f0, 0($t0)
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, 4
lw $s0, 0($s0)
mtc1 $s0, $f0
c.eq.s $f2, $f0
li $s0, 1
bc1t _S
li $s0, 0
_S :
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
beqz $t0, _O
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
addi $sp, $sp, -4
la $t0, _T
l.s $f0, 0($t0)
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, -12
lw $s0, 0($s0)
mtc1 $s0, $f0
sub.s $f0, $f2, $f0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
mtc1 $s0, $f0
move $t0, $s0
addi $s0, $fp, 4
mfc1 $t7, $f0
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $sp, $sp, 4
j _N
_O :
li $t6, -8
add $t6, $t6, $fp
move $sp, $t6
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
la $t0, _U
l.s $f0, 0($t0)
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, -12
lw $s0, 0($s0)
mtc1 $s0, $f0
mul.s $f0, $f2, $f0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
mtc1 $s0, $f0
move $t0, $s0
addi $s0, $fp, 4
mfc1 $t7, $f0
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -12
mfc1 $t7, $f0
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
j _L
_M :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, -4
la $s0, _V
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
_X :
addi $sp, $sp, -4
lui $s0, 0
addiu $s0, $s0, 4
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
beqz $t0, _Y
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
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -12
sw $t7, 0($s0)
addi $sp, $sp, 4
_Z :
addi $sp, $sp, -4
la $t0, _BB
l.s $f0, 0($t0)
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, 4
lw $s0, 0($s0)
mtc1 $s0, $f0
c.lt.s $f2, $f0
li $s0, 1
bc1t _BC
li $s0, 0
_BC :
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
la $t0, _BD
l.s $f0, 0($t0)
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, 4
lw $s0, 0($s0)
mtc1 $s0, $f0
c.eq.s $f2, $f0
li $s0, 1
bc1t _BE
li $s0, 0
_BE :
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
beqz $t0, _BA
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
addi $sp, $sp, -4
la $t0, _BF
l.s $f0, 0($t0)
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, -12
lw $s0, 0($s0)
mtc1 $s0, $f0
sub.s $f0, $f2, $f0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
mtc1 $s0, $f0
move $t0, $s0
addi $s0, $fp, 4
mfc1 $t7, $f0
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $sp, $sp, 4
j _Z
_BA :
li $t6, -8
add $t6, $t6, $fp
move $sp, $t6
addi $s0, $fp, -8
lw $a0, 0($s0)
li $v0, 1
syscall
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, -4
la $t0, _BG
l.s $f0, 0($t0)
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, 4
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, -12
lw $s0, 0($s0)
mtc1 $s0, $f0
mul.s $f0, $f2, $f0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -12
lw $s0, 0($s0)
mtc1 $s0, $f0
move $t0, $s0
addi $s0, $fp, 4
mfc1 $t7, $f0
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -12
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $sp, $sp, 4
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
j _X
_Y :
li $t6, -4
add $t6, $t6, $fp
move $sp, $t6
addi $sp, $sp, 4
move $sp, $fp
jr $ra
_____main :
move $fp, $sp
addi $sp, $sp, -4
la $t0, _BH
l.s $f0, 0($t0)
addi $s0, $fp, -4
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $s0, 0($s0)
mtc1 $s0, $f0
addi $sp, $sp, -4
addi $s0, $fp, -8
mfc1 $t7, $f0
sw $t7, 0($s0)
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
addi $sp, $sp, 12
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $sp, $sp, -4
la $t0, _BI
l.s $f0, 0($t0)
addi $s0, $fp, -4
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -4
l.s $f12, 0($s0)
li $v0, 2
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
_D:
    .float 0.00005
_G:
    .float 10.0
_I:
    .float 10.0
_K:
    .float 10.0
_P:
    .float 1.0
_R:
    .float 1.0
_T:
    .float 1.0
_U:
    .float 10.0
_V:
    .asciiz "."
_W:
    .space 3
_BB:
    .float 1.0
_BD:
    .float 1.0
_BF:
    .float 1.0
_BG:
    .float 10.0
_BH:
    .float 123456789.12346
_BI:
    .float 123456789.12346

