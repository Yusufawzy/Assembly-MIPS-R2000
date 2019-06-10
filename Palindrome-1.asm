.data :
arr : .word 1 , 3 , 2 , 3 , 5 #our problem was in passing the paramters bl3ks
n : .word 4 #n-1
.text :
j main 
checkPalindrome:
addi $sp,$sp,-4
sw $ra,($sp)

# t0 will hold address of the content of arr[start]
# t4 will hold address of the content of arr[end]
sll $t0,$a1,2
add $t0,$a0,$t0
lw $s0,($t0)
sll $t0,$a2,2
add $t0,$a0,$t0
lw $s4,($t0)

li $v0,0
bne $s4,$s0,Outer
li $v0,1
bge $a1,$a2,Outer

addi $a1,$a1,1
addi $a2,$a2,-1
jal checkPalindrome
Outer:
lw $ra,($sp)
addi $sp,$sp,4

jr $ra



main :
la $a0,arr
li $a1,0
lw $a2,n
jal checkPalindrome
addi $a0,$v0,0 #print 0 if not palindrome , 1 if it's palindrome
li $v0,1
syscall

Exit :
li $v0,10
syscall