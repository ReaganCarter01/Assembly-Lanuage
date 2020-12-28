############################ data segment ################################
	 .data 
chars:	 .ascii "ABCDEFGHIJKLMNOPQRSTUVWXYZ .,!-'"
msg1:    .word 0x93EA9646, 0xCDE50442, 0x34D29306, 0xD1F33720
         .word 0x56033D01, 0x394D963B, 0xDE7BEFA4
msg1end:
############################ code segment ################################ 
              .text
              .globl main
main:
	      #Load address into $t0
              la $t0,msg1        
              #set $t1 to zero
              add $t1, $zero, $zero
              #sum value of 0                            
              li $s0,0
              #Bit counter
              li $s1,0  
              #Bit counter              
              li $s2,0              
              li $s3,4   
              #load $t3 with 28 bytes
              li $t3,28              
num:        
	      #load bytes into $s4
              lb $s7,($t0)      
              #branch if equal zero                   
              beqz $t3,exit   
              #decrease by 1                
              sub $t3,$t3,1 
              #add 1                    
              addi $t2, $zero, 1    
              #shift left     
              sll $t2, $t2, 7  
left:          
	      #check to see if 0 or 1
	      and $t4,$t2,$s7  
	      #branch if equal zero         
              beqz $t4,counter 
              move $a1,$s3                
              #jump and link
              jal p1                              
              #add $v0 to $s0
              add $s0,$s0,$v0                                                        
counter:
	      #move to right 1
              srl $t2,$t2,1                        
              #decrease by 1
              sub $s3,$s3,1                     
              #increase by 1
              add $s1,$s1,1                    
              #increase by 1
              add $s2,$s2,1                    
              #branch if equal 5
              beq $s1,5,reset              
              j process  
reset: 
	      #load address of chars
              la $t5,chars                         
              #add $s0 to $t5
              add $t5,$t5,$s0                 
              #load the character
              lb $a0,($t5)                       
              li $v0,11                                               
              syscall                                  
              #set to 0
              li $s0,0 
              #set to 0                 
              li $s1,0 
              #set to 4                
              li $s3,4               
process:         
	      #branch if equal 8 
              beq $s2,8,zero              
              #jump
              j left                                       
zero: 
	      #reset to 0
              li $s2,0         
              #add 1        
              add $t0,$t0,1                      
              #jump to num
              j num                                    
               
p1:       
              #branch if equal zero
              beqz $a1,r1
              sub $a1,$a1,1
              li $t7,2  
loop: 
	      #branch if equal zero
	      beqz $a1,return
              mul $t7,$t7,2
              sub $a1,$a1,1
              #jump loop
              j loop 
r1: 
	      #return 1
	      li $t7,1 
return:
	      #move $t7 to $v0
              move $v0,$t7    
              #jump to register $ra
              jr $ra  
              
exit:          
              #exit the program
              li $v0, 10                              
              syscall                                             
	
