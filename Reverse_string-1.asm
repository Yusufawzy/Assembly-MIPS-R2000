.data
 array: .space 60

.text
.globl  main

insertionSort:

for:
li $s5,2 # $s5 =i
lw $t0,$s5($a0) # key = A[i]
addi $s6,$s5,-1 #j=$s6   , 

while: #loop
bgt $s6,$zero,next
next:
bgt $s4($a0),$t,con
con:
li $s7,$s6
mul $s6,$s6,4  #next address
lw $s6($a0),$s7($a0) # A[j+1]=A[j]
addi $s6,$s6,-1

j while
addi $s6,$s6,1 
lw $s6($a0),($t0)
j for

main:

la $t0,array

again:
li $v0,5
syscall
li $s3,0 #counting
li $s4,4 #multiply

add $s0,$zero,$v0


beq $s0,$zero,Exit
	sw $s0,$s3(t0)
	addi $s3,$s3,1 # $s3 ++
	mul $s3,$s4	#   *4
	j again

Exit:
	lw $a0,array # load array to sent it to insertionSort

	jal insertionSort
	

	
	

  syscall
.end main
