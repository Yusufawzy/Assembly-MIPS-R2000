 
.data 
arr : .space 20
n : .word 5 #will be a3 - 1 
k : .word  50

.text :

main :
la $t0,arr
li $t5,0 #will be the counter
lw $s0,n

LoopEnter:
li $v0,5
syscall
sw $v0,($t0)
addi $t5,$t5,1
addi $t0,$t0,4
beq $t5,$s0,Outer
j LoopEnter
Outer:
la $a0,arr
lw $a1,k
li $a2,0
lw $a3,n
addi $a3,$a3,-1
jal BST

addi $a0,$v0,0
li $v0,1
syscall

Exit:
li $v0,10
syscall

#t7 = m 
# t5 = address of m
# t3 = arr[m]
# a0 = arr , a1 = k , a2 = 0 , a3 = n  - 1
BST:
#int m = (l+r)/2;
  #      if (arr[m]==k) return m;
   #     if (l>=r) return  -1;
    #    if (arr[m]> k) return BST(arr,k,l,m-1);
#        return BST(arr,k,m+1,r);
addi $sp,$sp,-4
sw $ra,($sp)
add  $t7,$a2,$a3
div  $t7,$t7,2
sll  $t5,$t7,2
add  $t5,$t5,$a0

lw $t3,($t5)

addi $v0,$t7,0
beq $t3,$a1,BSTOuter
li $v0,-1
bge $a2,$a3,BSTOuter
ble $t3,$a1,second
first:

addi $a3,$t7,-1
jal BST
j here
second:
addi $a2,$t7,1
jal BST
here:
jal BST
BSTOuter:
lw $ra,($sp)
addi $sp,$sp,4
jr $ra