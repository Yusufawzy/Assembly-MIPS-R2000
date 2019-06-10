.data 
enter: .asciiz "\n"
.text 
li $v0,1
nor $a0,$a0,$0
syscall
la $a0,enter
li $v0,4
syscall
li $v0,1
li $a0,0
nor $a0,$a0,$a0
syscall



li $v0,10
syscall