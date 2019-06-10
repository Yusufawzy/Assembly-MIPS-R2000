.data 
yes:.asciiz "Yes It's Palindrome"
No :.asciiz "No It's not Palindrome"
.text
main:
li $v0,5
syscall
addi $s0,$v0,0
addi $s0,$s0,-1
li $t0,0
#s0 = n-1
#t0 = 0

addi $a0,$v0,0
li $v0,9
syscall 
addi $t1,$v0,0
addi $t2,$v0,0
#t1 = arr
#t2 = arr 
Loop:
li $v0,5
syscall
sb $v0,($t1) 
beq $t0,$s0,Loop2
addi $t1,$t1,1 #used to iterate the address
addi $t0,$t0,1 #used as a counter

j Loop

#t1 is arr[n-1]
#t2 is arr[0]
Loop2 : 
lb $s1,($t2)
lb $s2,($t1)
bne $s1,$s2,NO
addi $t1,$t1,-1
addi $t2,$t2,1
bge $t2,$t1,YES
YES:
la $a0,yes
li $v0,4
syscall
j Exit
NO:
la $a0,No
li $v0,4
syscall
Exit:
li $v0,10
syscall
 
