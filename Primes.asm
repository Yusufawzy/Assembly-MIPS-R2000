.data
yes: .asciiz "Yes It's prime"
no:  .asciiz "No It isn't prime"
.text
main:
li $v0,5
syscall 
addi $s7,$v0,0
#t0 = 2 , t0  = i
li $t0,2
li $s4,50
ble $s7,2,Yes
Loop :
beq $t0,$s7,Yes #if i = 5 then yes prime
div $s7,$t0
mfhi $s4
beq $s4,0,No
addi $t0,$t0,1
j Loop
Yes :
la $a0,yes
li $v0,4
syscall
j Exit
No :
la $a0,no
li $v0,4
syscall
Exit:
li $v0,10
syscall