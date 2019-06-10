.data
arr : .word 1 , 2 , 5 , 7 , 9 , 16
n : .word 16 
k : .word 4
.text 
j main 
BST :
# m  = s4 
# &arr[m] = s7 
# arr[m] = s5
addi $sp,$sp,-4
sw $ra,($sp)

add $s4,$a3,$a2
div $s4,$s4,2
addi $s2,$s4,0
sll $s4,$s4,2
add $s4,$s4,$a0
lw $s5,($s4)


addi $v0,$s2,0
beq $a1,$s5,Outer

li $v0,-1
bgt $a2,$a3,Outer

bgt $a1,$s5,right 
left:
addi $a3,$a3,-1
jal BST

right :
addi $a2,$a2,1
jal BST

Outer :
lw $ra,($sp)
addi $sp,$sp,4
jr $ra


main :
la $a0,arr
lw $a1,k
li $a2,0
lw $a3,n
addi $a3,$a3,-1
jal BST


Exit :
addi $a0,$v0,0
li $v0,1
syscall
li $v0 , 10
syscall