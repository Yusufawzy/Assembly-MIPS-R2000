.data 
enter : .asciiz "Enter the number for Fibonanci Function "
error : .asciiz "The number entered is less than Zero"
.text 
j main
Func  :
addi $sp, $sp,-4 # make room on stack
sw $ra, ($sp) # push $ra

addi $v0,$s7,0 # if n ==1 return c
beq $a0,1,rtn

rem $t0,$a0,2
addi $s7,$s7,1
bne $t0,$0,odd
even:
div $a0,$a0,2
jal Func
j rtn
odd:
mul $a0,$a0,3
addi $a0,$a0,1
jal Func

rtn :
lw $ra, 0($sp) # pop $ra
addi $sp, $sp,4 # restore sp
jr $ra
   
   
main :
la $a0,enter
li $v0,4
syscall  
# the result will be in v0
li $v0,5
syscall
addi $a0,$v0,0
jal Func

#printing the result of Fact
addi $a0,$v0,0
li $v0,1
syscall
Exit :
li $v0,10
syscall
