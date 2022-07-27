## _Sharif UT CE 142_: Compiler Design

### What is this project?

This project is a Decaf compiler. it takes a decaf code as input and translates it to spim language which can be run by MIPS architecture.

Our project is written in python. it uses `LARK` to parse the input. `LARK` creates a ParseTree instance. This object then is given to the CodeGeneration file which uses `cgen` function to create spim code. 

### How to Run?
Clone the project, the install lark on python. By running `run.sh` all the decaf codes in `test/` folder (\*.d) will be compiled by our code. spim codes will be generated in `out/` folder (\*.s). Then generated codes will be executed by spim and the output of the execution will be stored in `out/` folder (\*.out). At the end, the comparision between generated output and the expected output will be done and results will be stored in `reports/` folder.

Also, you can directly compile your decaf code in `CodeGenerator/` folder with this command.
```
python main.py -i <inputfile> -o <outputfile>
```

A simple example can be seen here:

**_Decaf code_**
```
int f(int x){
    if ( x <= 2 ){
        return 1;
    }
    return f(x-1) + f(x-2);
}

int main()  {
    Print(f(3));
    Print(f(6));
}
```

**_Spim code (generated)_**
```
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
lui $s0, 0
addiu $s0, $s0, 2
...
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
```

**_Output_**
28

### Details about Decaf and SPIM

+ Details about the Decaf language can be found in `Resources/Decaf.pdf`.
+ Details about the SPIM language can be found in `/Resources/Phase3/spim-documentation.pdf`



Developed By:
+ <i>Keivan Rezaei</i>
+ <i>Seyed Mohammad Seyed Javadi</i>
+ <i>Mohammad Amin Sharifi</i>

###### Compiler Design Project Sharif UT.

 _Spring 1399/ 2020_

