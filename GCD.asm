.data 
enter : .asciiz "Enter the number for GCD Function "
error : .asciiz "The number entered is less than Zero"
.text 
j main
GCD:  # if we have two recursive functions so make save to a0
addi $sp, $sp, -12 
sw $s0, 0($sp) 
sw $ra, 4($sp) 
sw $s1, 8($sp)

addi $s0,$a0,0#store current a0 to s0 if we don't get into yes
addi $s1,$a1,0#store current a1 to s1 so we can change each other
bne $a1,$0,yes

addi $v0,$s0,0 
j rtn 	
yes:
addi $a0,$s1,0
rem $a1,$s0,$s1
jal GCD 
rtn: 
lw $s0, 0($sp) # pop $a0
lw $ra, 4($sp) # pop $ra
lw $s1, 8($sp)
addi $sp, $sp, 12 # restore sp
jr $ra



main :
la $a0,enter
li $v0,4
syscall  
# the result will be in v0
li $v0,5
syscall
addi $a0,$v0,0 #prepate a0 for gcd(a,b)
li $v0,5
syscall
addi $a1,$v0,0 # prepare a1 for gcd (a,b)
jal GCD

#printing the result of GCD
addi $a0,$v0,0
li $v0,1
syscall
Exit :
li $v0,10
syscall
