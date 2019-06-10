.data #here we declare variables
arr : .space 20
enter : .asciiz "Enter the array numbers "
num : .asciiz "Enter the number to search for it"
newline : .asciiz "\n"
.text 
main :
la $a0,enter
li $v0,4
syscall  
la $s7,arr #s s7 = &arr [0]
#Enter array Numbers
ReadLoop :
beq $t7,5,Outer
addi $t7,$t7,1
li $v0,5
syscall
beq $v0,$0,Outer  # read numbers till we get zero that means stop input exclude zero
sw $v0, ($s7)
addi $s7,$s7,4
j ReadLoop


Outer:
li $t6 , 0 # t6 = i = 0 
la $s7,arr # s7 = &arr [0]
li $t5,-1  #t5 = res 
	   #t7 =  counter of prev problem
Search :
la $a0,num
li $v0,4
syscall
li $v0,5
addi $t7,$t7,-1
syscall
addi $s4,$v0,0  #s4 is our target 
LoopSearch:
beq $t7,$t6,Exit 
lw $t0 , ($s7)
addi $t6,$t6,1
beq $t0,$s4,Found
addi $s7,$s7,4
j LoopSearch
Found:
addi $t5,$t6,-1
Exit:
#printing the result
addi $a0,$t5,0
li $v0,1
syscall
li $v0,10
syscall