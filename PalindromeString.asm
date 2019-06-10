.data 
a : .asciiz "joe" #input will be using lb and sb

.text 
j main 
main :
la $s4,a

li $t7,0
Loop1:
lb $t0,($s4)
beq $t0,0,Loop2
addi $t7,$t7,1
addi $s4,$s4,1



j Loop1

Loop2:

exit :
addi $a0,$t7,0
li $v0,1
syscall

li $v0,10
syscall