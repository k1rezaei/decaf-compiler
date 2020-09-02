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
_C :
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
bne $t3, $t2, _Y
j _X
_Y :
li $t3, 0
bne $t3, $t2, _Z
j _X
_Z :
li $t3, 10
bne $t3, $t2, _E
j _X
_E :
li $t3, 45
bne $t3, $t2, _F
li $t1, 1
j _G
_F :
li $t3, 43
bne $t3, $t2, _H
_G :
lb $t2, 0($a0)
addi $a0, $a0, 1
_H :
li $t3, 13
bne $t2, $t3, _BA
j _X
_BA :
li $t3, 0
bne $t2, $t3, _BB
j _X
_BB :
li $t3, 10
bne $t2, $t3, _V
j _X
_V :
addi $t2, $t2, -48
li $t3, 0
bge $t2, $t3, _I
li $t1, -1
j _P
_I :
li $t3, 10
bgt $t3, $t2, _J
li $t1, -1
j _P
_J :
li $t3, 0
move $t0, $t2
bne $t2, $t3, _P
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BC
j _X
_BC :
li $t3, 0
bne $t2, $t3, _BD
j _X
_BD :
li $t3, 10
bne $t2, $t3, _K
j _X
_K :
li $t3, 88
beq $t2, $t3, _O
li $t3, 120
beq $t2, $t3, _O
j _L
_O :
li $t4, 16
j _P
_L :
li $t3, 48
bge $t2, $t3, _M
li $t1, -1
j _P
_M :
li $t3, 57
ble $t2, $t3, _N
li $t1, -1
j _P
_N :
addi $t2, $t2, -48
move $t0, $t2
_P :
lb $t2, 0($a0)
addi $a0, $a0, 1
li $t3, 13
bne $t2, $t3, _BE
j _W
_BE :
li $t3, 0
bne $t2, $t3, _BF
j _W
_BF :
li $t3, 10
bne $t2, $t3, _Q
j _W
_Q :
li $t3, 48
blt $t2, $t3, _T
li $t3, 57
bgt $t2, $t3, _R
addi $t2, $t2, -48
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _P
_R :
li $t3, 65
blt $t2, $t3, _T
li $t3, 70
bgt $t2, $t3, _S
addi $t2, $t2, -55
bge $t2, $t4, _T
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _P
_S :
li $t3, 97
blt $t2, $t3, _T
li $t3, 102
bgt $t2, $t3, _T
addi $t2, $t2, -87
bge $t2, $t4, _T
mul $t0, $t0, $t4
add $t0, $t0, $t2
j _P
_T :
li $t1, -1
j _P
_W :
li $t4, -1
bne $t4, $t1, _U
li $t0, 0
j _X
_U :
li $t4, 1
bne $t4, $t1, _X
sub $t0, $zero, $t0
_X :
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
la $s0 ___itob
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
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _D
addi $sp, $sp, -4
la $s0, _BG
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
j _C
_D :
li $t6, 0
add $t6, $t6, $fp
move $sp, $t6
_BI :
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
la $s0 ___itob
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
lw $t0, 0($s0)
addi $sp, $sp, 4
beqz $t0, _BJ
addi $sp, $sp, -4
la $s0, _CM
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
j _BI
_BJ :
li $t6, 0
add $t6, $t6, $fp
move $sp, $t6
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
_BG:
    .asciiz "hey"
_BH:
    .space 1
_CM:
    .asciiz "hoy"
_CN:
    .space 1

