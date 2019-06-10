.data
input: .asciiz "joe 3aml eh"
n     : .word 11 #total number of chars
output : .space 12
.text
j main
lw $t5,n    # t5 = n
# a0 = input , a1 = n , a2 = outpu
Reverse:
addi $sp,$sp,-4
sw $ra,($sp)

blt $a1,$0,Outer 
add $t4, $a0 , $a1 # t4 = &a[n-1]
add $t1 ,$a2,  $t3 # t0 = &b[0] , t3 = i = 0
                
lb $t0, ($t4)
sb  $t0, ($t1) 
addi $a1,$a1,-1   # Func(n-1)
addi $t3,$t3,1    # increase b index to store in the next  t3++
jal Reverse 
Outer:
lw $ra,($sp)
addi $sp,$sp,4
jr $ra

main:#send two parameters (&str_to , int n)
la $a0, input
lw $a1, n
addi $a1,$a1,-1
la $a2, output 
jal Reverse 

Exit:
la $a0, output#printing the output it has been reversed 5alas
li $v0, 4
syscall
li $v0, 10
syscall
