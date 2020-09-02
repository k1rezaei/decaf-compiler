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
la $s0, _C
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
_C:
    .asciiz "input your name:"
_D:
    .space 4

