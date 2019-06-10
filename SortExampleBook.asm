.data 
arr :.word -100,-1,-33,-22
newline :.asciiz "\n"
.text main:
# assumung that a0 = address of arr , a1 = n = 4

la $a0,arr
li $a1,4
jal Sort
b Print_Arr

#==============we used s0,s7,s1,s2================#
Sort:
addi $sp,$sp,-20

sw $ra,($sp)
sw $s0,4($sp)
sw $s7,8($sp)
sw $s1,12($sp)
sw $s2,16($sp)



addi $s2,$a0,0 #s2 = arr
addi $s7,$a1,0 #s7 = 4 = n
li $s0,0 # s0 = i


Loop1 :
beq  $s0,$s7,Exit1
addi $s1,$s0,-1     # j = i-1
Loop2:
blt $s1,0,Exit2

sll $t1,$s1,2 # j*4
add $t2,$t1,$s2 # t2 = arr + j*4
lw  $t3,($t2)
lw  $t4,4($t2)
blt $t3,$t4,Exit2
#preparing for the swapping
la $a0,arr
addi $a1,$s1,0
jal swap

addi $s1,$s1,-1 #j--
j Loop2
Exit2:
addi $s0,$s0,1 #i++
j Loop1
Exit1:
lw $ra,($sp)
lw $s0,4($sp)
lw $s7,8($sp)
lw $s1,12($sp)
lw $s2,16($sp)
addi $sp,$sp,20
jr $ra

swap: #a0 = arr[], a1=k
sll $t1,$a1,2 # j*4
add $t2,$t1,$a0 # t2 = arr + j*4
lw  $t3,($t2)
lw  $t4,4($t2)
sw $t4, ($t2)
sw $t3, 4($t2)
jr $ra



Print_Arr:
la $t1,arr
lp :
beq $t0,4,Exit
lb $a0,($t1)
li $v0,1
syscall
la $a0,newline
li $v0,4
syscall
addi $t0,$t0,1
addi $t1,$t1,4
j lp



Exit:
li $v0,10
syscall
