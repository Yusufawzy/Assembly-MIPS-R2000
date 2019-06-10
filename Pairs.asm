.data 
a : .asciiz "0x0x0"
n : .word 5
.text 
j main 
#t0 = i  = counter
#s5 = no_of_pairs
Pairs:
addi $sp,$sp,-4
sw $ra,($sp)
#sw $s5,4($sp)
#check if t1 == n -3 then it means to stop , as 0x0 so 3-2 = 1 , if t1 = 1 then stop
li $v0,0
beq $t1,$a1,Outer

#compare bteween t5 and t6
lb $t5,($a0)
addi $t0,$a0,2
lb $t6,($t0)
beq $t5,$t6,inc
j others
#if (str.charAt(0) == str.charAt(2))
inc :
addi $t3,$t3,1
others:
addi $a0,$a0,1 # countPairs(str.substring(1))
addi $t1,$t1,1
jal Pairs
Outer:
addi $v0,$t3,0
lw $ra,($sp)
addi $sp,$sp,4
jr $ra


main :
la $a0,a
lw $a1,n
addi $a1,$a1,-2
jal Pairs

exit :
addi $a0,$v0,0
li $v0,1
syscall


li $v0,10
syscall