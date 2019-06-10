
.data 
.text 
main : 
li $a0,1234
jal Count
addi $a0,$v0,0
li $v0,1
syscall

Exit:
li $v0,10
syscall
  
Count :
addi $sp,$sp,-8
sw $s7,4($sp)
sw $ra,($sp)
#public static int count7(int n){
 #       int a = n %10;
  #      if (a==0) return 0;
   #     return a + count7(n/10);
rem $s7,$a0,10
li  $v0,0
beq $s7,0,Outer 
div $a0,$a0,10
jal Count
add $v0,$v0,$s7
Outer :
lw $ra,($sp)
lw $s7,4($sp)
addi $sp,$sp,8

jr $ra

