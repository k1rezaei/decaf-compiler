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
bne $t3, $t2, _X
j _W
_X :
li $t3, 0
bne $t3, $t2, _Y
j _W
_Y :
li $t3, 10
bne $t3, $t2, _D
j _W
_D :
li $t3, 45
bne $t3, $t2, _E
li $t1, 1
j _F
_E :
li $t3, 43
bne $t3, $t2, _G
_F :
lb $t2, 0($a0)
addi $a0, $a0, 1
_G :
li $t3, 13
bne $t2, $t3, _Z
j _W
_Z :
li $t3, 0
bne $t2, $t3, _BA
j _W
_BA :
li $t3, 10
bne $t2, $t3, _U
j _W
_U :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _H
li $t1, -1
j _O
_H :
li $t3, 10
bgt $t3, $t2, _I
li $t1, -1
j _O
_I :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _O
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BB
j _W
_BB :
li $t3, 0
bne $t2, $t3, _BC
j _W
_BC :
li $t3, 10
bne $t2, $t3, _J
j _W
_J :
li $t3, 88
beq $t2, $t3, _N
li $t3, 120
beq $t2, $t3, _N
j _K
_N :
li $t4, 16
j _O
_K :
li $t3, 48
bge $t2, $t3, _L
li $t1, -1
j _O
_L :
li $t3, 57
ble $t2, $t3, _M
li $t1, -1
j _O
_M :
addi $t2, $t2, -48
move $t0, $t2
_O :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BD
j _V
_BD :
li $t3, 0
bne $t2, $t3, _BE
j _V
_BE :
li $t3, 10
bne $t2, $t3, _P
j _V
_P :
li $t3, 48
blt $t2, $t3, _S
li $t3, 57
bgt $t2, $t3, _Q
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _O
_Q :
li $t3, 65
blt $t2, $t3, _S
li $t3, 70
bgt $t2, $t3, _R
addi $t2, $t2, -55
bge $t2, $t4, _S
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _O
_R :
li $t3, 97
blt $t2, $t3, _S
li $t3, 102
bgt $t2, $t3, _S
addi $t2, $t2, -87
bge $t2, $t4, _S
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _O
_S :
li $t1, -1
j _O
_V :
li $t4, -1
bne $t4, $t1, _T
li $t0, 0
j _W
_T :
li $t4, 1
bne $t4, $t1, _W
sub $t0, $zero, $t0
_W :
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
bne $t3, $t2, _BZ
j _BY
_BZ :
li $t3, 0
bne $t3, $t2, _CA
j _BY
_CA :
li $t3, 10
bne $t3, $t2, _BF
j _BY
_BF :
li $t3, 45
bne $t3, $t2, _BG
li $t1, 1
j _BH
_BG :
li $t3, 43
bne $t3, $t2, _BI
_BH :
lb $t2, 0($a0)
addi $a0, $a0, 1
_BI :
li $t3, 13
bne $t2, $t3, _CB
j _BY
_CB :
li $t3, 0
bne $t2, $t3, _CC
j _BY
_CC :
li $t3, 10
bne $t2, $t3, _BW
j _BY
_BW :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _BJ
li $t1, -1
j _BQ
_BJ :
li $t3, 10
bgt $t3, $t2, _BK
li $t1, -1
j _BQ
_BK :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _BQ
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CD
j _BY
_CD :
li $t3, 0
bne $t2, $t3, _CE
j _BY
_CE :
li $t3, 10
bne $t2, $t3, _BL
j _BY
_BL :
li $t3, 88
beq $t2, $t3, _BP
li $t3, 120
beq $t2, $t3, _BP
j _BM
_BP :
li $t4, 16
j _BQ
_BM :
li $t3, 48
bge $t2, $t3, _BN
li $t1, -1
j _BQ
_BN :
li $t3, 57
ble $t2, $t3, _BO
li $t1, -1
j _BQ
_BO :
addi $t2, $t2, -48
move $t0, $t2
_BQ :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _CF
j _BX
_CF :
li $t3, 0
bne $t2, $t3, _CG
j _BX
_CG :
li $t3, 10
bne $t2, $t3, _BR
j _BX
_BR :
li $t3, 48
blt $t2, $t3, _BU
li $t3, 57
bgt $t2, $t3, _BS
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BQ
_BS :
li $t3, 65
blt $t2, $t3, _BU
li $t3, 70
bgt $t2, $t3, _BT
addi $t2, $t2, -55
bge $t2, $t4, _BU
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BQ
_BT :
li $t3, 97
blt $t2, $t3, _BU
li $t3, 102
bgt $t2, $t3, _BU
addi $t2, $t2, -87
bge $t2, $t4, _BU
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _BQ
_BU :
li $t1, -1
j _BQ
_BX :
li $t4, -1
bne $t4, $t1, _BV
li $t0, 0
j _BY
_BV :
li $t4, 1
bne $t4, $t1, _BY
sub $t0, $zero, $t0
_BY :
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
move $s0, $ra
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -20
sw $t7, 0($s0)
la $s0 _C
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
lw $a0, 0($s0)
li $v0, 1
syscall
addi $sp, $sp, 4
la $a0, __newLine
li $v0, 4
syscall
addi $sp, $sp, 8
move $sp, $fp
jr $ra
_C :
move $fp, $sp
addi $sp, $sp, -4
addi $s0, $fp, 8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
slt $s0, $s1, $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _CH
addi $s0, $fp, 4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 8
lw $s0, 0($s0)
sub $s0, $s1, $s0
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
j _CI
_CH :
addi $s0, $fp, 8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
sub $s0, $s1, $s0
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
_CI :
addi $s0, $fp, -4
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 4
lw $s0, 0($s0)
mult $s0, $s1
mflo $s0
addi $sp, $sp, -4
move $t7, $s0
addi $s0, $fp, -8
sw $t7, 0($s0)
addi $s0, $fp, -8
lw $s0, 0($s0)
move $s1, $s0
addi $s0, $fp, 8
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
move $v0, $s0
move $sp, $fp
jr $ra
addi $sp, $sp, 8
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

