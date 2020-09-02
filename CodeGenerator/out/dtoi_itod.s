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
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $t0, $s0
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -16
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
bne $t3, $t2, _CB
j _CA
_CB :
li $t3, 0
bne $t3, $t2, _CC
j _CA
_CC :
li $t3, 10
bne $t3, $t2, _BH
j _CA
_BH :
li $t3, 45
bne $t3, $t2, _BI
li $t1, 1
j _BJ
_BI :
li $t3, 43
bne $t3, $t2, _BK
_BJ :
lb $t2, 0($a0)
addi $a0, $a0, 1
_BK :
li $t3, 13
bne $t2, $t3, _CD
j _CA
_CD :
li $t3, 0
bne $t2, $t3, _CE
j _CA
_CE :
li $t3, 10
bne $t2, $t3, _BY
j _CA
_BY :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _BL
li $t1, -1
j _BS
_BL :
li $t3, 10
bgt $t3, $t2, _BM
li $t1, -1
j _BS
_BM :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _BS
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CF
j _CA
_CF :
li $t3, 0
bne $t2, $t3, _CG
j _CA
_CG :
li $t3, 10
bne $t2, $t3, _BN
j _CA
_BN :
li $t3, 88
beq $t2, $t3, _BR
li $t3, 120
beq $t2, $t3, _BR
j _BO
_BR :
li $t4, 16
j _BS
_BO :
li $t3, 48
bge $t2, $t3, _BP
li $t1, -1
j _BS
_BP :
li $t3, 57
ble $t2, $t3, _BQ
li $t1, -1
j _BS
_BQ :
addi $t2, $t2, -48
move $t0, $t2
_BS :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CH
j _BZ
_CH :
li $t3, 0
bne $t2, $t3, _CI
j _BZ
_CI :
li $t3, 10
bne $t2, $t3, _BT
j _BZ
_BT :
li $t3, 48
blt $t2, $t3, _BW
li $t3, 57
bgt $t2, $t3, _BU
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BS
_BU :
li $t3, 65
blt $t2, $t3, _BW
li $t3, 70
bgt $t2, $t3, _BV
addi $t2, $t2, -55
bge $t2, $t4, _BW
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BS
_BV :
li $t3, 97
blt $t2, $t3, _BW
li $t3, 102
bgt $t2, $t3, _BW
addi $t2, $t2, -87
bge $t2, $t4, _BW
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BS
_BW :
li $t1, -1
j _BS
_BZ :
li $t4, -1
bne $t4, $t1, _BX
li $t0, 0
j _CA
_BX :
li $t4, 1
bne $t4, $t1, _CA
sub $t0, $zero, $t0
_CA :
move $s0, $t0
move $t7, $s0
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
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
addi $s0, $fp, -8
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
la $s0 ___itod
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
addi $s0, $fp, -16
mfc1 $t7, $f0
sw $t7, 0($s0)
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
la $s0 ___itod
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
addi $s0, $fp, -20
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
mtc1 $s0, $f0
mov.s $f2, $f0
addi $s0, $fp, -20
lw $s0, 0($s0)
mtc1 $s0, $f0
div.s $f0, $f2, $f0
addi $sp, $sp, 8
addi $sp, $sp, -4
addi $s0, $fp, -16
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
mtc1 $s0, $f0
move $t0, $s0
addi $s0, $fp, -4
mfc1 $t7, $f0
sw $t7, 0($s0)
move $s0, $t0
addi $sp, $sp, 4
addi $sp, $sp, -4
addi $s0, $fp, -16
mfc1 $t7, $f0
sw $t7, 0($s0)
addi $sp, $sp, 4
addi $s0, $fp, -4
lw $s0, 0($s0)
mtc1 $s0, $f0
addi $sp, $sp, -4
addi $s0, $fp, -16
mfc1 $t7, $f0
sw $t7, 0($s0)
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
la $s0 ___dtoi
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
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -12
lw $s0, 0($s0)
div $s1, $s0
mflo $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -20
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
addi $s0, $fp, -16
sw $t7, 0($s0)
addi $s0, $fp, -16
lw $s0, 0($s0)
beqz $s0, _CJ
la $a0, __true
j _CK
_CJ :
la $a0, __false
_CK :
li $v0, 4
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, 12
move $sp, $fp
jr $ra
A__set_a :
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
A__get_a :
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
A__comp :
move $fp, $sp
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
addi $s0, $fp, 8
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
addi $s0, $fp, 4
lw $s0, 0($s0)
addi $s0, $s0, 4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s2, $s0
li $s0, 1
_CP :
lb $t0, 0($s1)
lb $t1, 0($s2)
addi $s1, $s1, 1
addi $s2, $s2, 1
beq $t0, $t1, _CQ
li $s0, 0
_CQ :
beqz $t0, _CR
beqz $t1, _CR
j _CP
_CR :
addi $sp, $sp, 4
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -4
sw $t7, 0($s0)
addi $s0, $fp, -4
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CO
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
_CO :
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
main: move $t8, $sp
addi $sp, $sp, -4
la $s1, A
la $s0, A__set_a
sw $s0, 0($s1)
la $s0, A__get_a
sw $s0, 4($s1)
la $s0, A__comp
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
A:
    .word 0,0,0,0

