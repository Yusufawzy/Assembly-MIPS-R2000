.data 
enter : .asciiz "Enter the number for Fibonanci Function "
error : .asciiz "The number entered is less than Zero"
.text 
j main
sum:  # if we have two recursive functions so make save to a0 
addi $sp, $sp,-8 # make room on stack
sw $ra, 4($sp) # push $ra
sw $s0, 0($sp) # push $a0 (N)
addi $v0,$a0,0 # if a0<2 return a0
li $v0,0
beq $a0,$0,rtn 
addi $s0,$a0,0
addi $a0,$a0,-1#we will save a0 to be s0 and prepare a0 for being transferred 
jal sum
add $v0,$v0,$s0
rtn: 
lw $s0, 0($sp) # pop $a0
lw $ra, 4($sp) # pop $ra
addi $sp, $sp, 8 # restore sp
jr $ra



main :
la $a0,enter
li $v0,4
syscall  
# the result will be in v0
li $v0,5
syscall
addi $a0,$v0,0
jal sum

#printing the result of Fact
addi $a0,$v0,0
li $v0,1
syscall
Exit :
li $v0,10
syscall
