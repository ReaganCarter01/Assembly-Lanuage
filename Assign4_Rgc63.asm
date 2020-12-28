############################ data segment ################################
	          .data 
multiplicand:	 .asciiz "\nEnter the multiplicand: "
multiplier:      .asciiz "\nEnter the multiplier: "
newline:         .asciiz "\n"
sign:            .asciiz " * "
equal:           .asciiz " = "
num1:            .word 0
num2:            .word 0
result:          .word 0
############################ code segment ################################ 
         .text
         .globl main
main:
         #prompts the multiplicand
	 li $v0,4
	 la $a0,multiplicand
	 syscall
	 
	 #gets user's input 
	 li $v0,5
	 syscall
	 
	 #store word to num1
	 sw $v0,num1
	 
	 #prompts the multiplier
	 li $v0,4 
	 la $a0,multiplier
	 syscall
	 
	 #gets user's input
	 li $v0,5
	 syscall
	 
	 #store word to num2
	 sw $v0,num2
	 
	 #load word to address $a0
	 lw $a0,num1
	 
	 #load word to address $a1
	 lw $a1,num2
	 
	 #jump and link to multiply
	 jal multiply
	 
	 #store word to result
	 sw $v0,result
	 
	 #prompt newline
	 li $v0,4
	 la $a0,newline
	 syscall
	 
	 #prompt user's given multiplicand
	 li $v0,1
	 lw $a0,num1
	 syscall
	
	 #prompt sign
	 li $v0,4
	 la $a0,sign
	 syscall
	 
	 #prompt user's given multiplier
	 li $v0,1
	 lw $a0,num2
	 syscall
	 
	 #prompt equal sign
	 li $v0,4
	 la $a0,equal
	 syscall
	 
	 #prompt the result 
	 li $v0,1
	 lw $a0,result
	 syscall
	 
	 #ending program
	 li $v0,10
	 syscall
	 
	 
	 .globl multiply
multiply:
	 #add stack and store contents
	 addi $sp,$sp,-12
	 subu $sp,$sp,4
	 sw $a0, ($sp)
	 
	 #store contents of $ra to the new top
	 subu $sp,$sp,4
	 sw $a1, ($sp)
	 subu $sp,$sp,4
	 sw $ra,($sp)
	 
	 #branch if equal zero
	 beqz $a1,zero
	 
	 #subtract by 1
	 sub $a1,$a1,1
	 
	 #jump and link to multiply
	 jal multiply
	 
	 #add $a0 to $v0 for result
	 add $v0,$v0,$a0
	 
	 #jump to exit
	 j exit
	
	
	
zero:
	#load zero
        li $v0,0
exit:
	#store contents of $ra to the top of stack
	lw $ra,($sp)
	addu $sp,$sp,4
	
	#set contents of stack into address #a1 and add stack
	lw $a1,($sp)
	addu $sp,$sp,4
	
	#set contents of stack into address #a0 and add stack
	lw $a0,($sp)
	addu $sp,$sp,4
	addi $sp,$sp,12
	
	#jump to register $ra
	jr $ra