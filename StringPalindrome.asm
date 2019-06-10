.data 
txt : .space 1000
len : .word 1000
right : .asciiz "Yes this string is palindrome"
left : .asciiz "No this string isn't palindrome"
.text 
main : 
la $a0,txt
lw $a1,len 
li $v0,8
syscall 
#Now to get the actual size of the enterd word, don't forget to load as byte 
la $t5,txt
LoopCount :
lb $s7,($t5)
beq $s7,$0,LoopCountOuter
addi $t7,$t7,1
add $t5,$t5,1
j LoopCount
LoopCountOuter:
# result will be stored in t7 in (n) 
sw $t7,len

Outer:
#we will send the a0 = address , a1 = 0 , a2 = n 
la $a0,txt
li $a1,0
lw $a2,len
addi $a2,$a2,-2
jal StringPalindrome

bne $v0,1,wrong 
la $a0,right
li $v0,4
syscall

j Exit
wrong :
la $a0,left
li $v0,4
syscall
addi $a0,$v0,0
li $v0,1
syscall
Exit:

li $v0,10
syscall
 
StringPalindrome:
#t1 = address of a[0] , t3 = address of a[n-1] 
#t2 = actual val , t4 = actual val 
addi $sp,$sp,-4
sw $ra,($sp)
add $t1,$a0,$a1
lb $t2, ($t1)	

add $t3 , $a0,$a2
lb $t4 , ($t3)

li $v0,0
bne $t4,$t2,StringPalindromeExit
li $v0,1
bgt $a1,$a2,StringPalindromeExit
addi $a1,$a1,1
addi $a2,$a2,-1
jal StringPalindrome
StringPalindromeExit:

lw $ra,($sp)
addi $sp,$sp,4

jr $ra
