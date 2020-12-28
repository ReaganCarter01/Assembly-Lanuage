# Reagan Carter, CS 2318-253, Assignment 2 part 1 Program 1 Part A
# Description:Prompt the user to enter the following: integer,String, Character
#             and display the results in a prompt-read-display sequence.

                    .data
prmptInt:           .asciiz "Enter an integer: "
prmptStr:           .asciiz "\nEnter a string (up to 25 characters): "
stringSz:           .space 25
prmptChr:           .asciiz "Enter a character: "
showsInt:           .asciiz "The integer: "
showsStr:           .asciiz "The string: "
showsChr:           .asciiz "\nThe character: "

                    .text
                    .globl main
main:
                    li $v0,4               
                    la $a0,prmptInt        # $a0 has address of prmptInt
                    syscall                # should print "Enter an integer"
                    
                    li $v0,5               # Read integer
                    syscall                
                    
                    move $t0,$v0           # Copy integer read (in $v0) to $t0
                    li $v0,4 
                    la $a0,showsInt        # $a0 has address of showsInt
                    syscall                # should print "The integer: "
                    
                    li $v0,1
                    move $a0,$t0           # Copy integer read (in $t0) to $a0 
                    syscall
                    
                    li $v0,4
                    la $a0,prmptStr        # $a0 has address of prmptStr
                    syscall                # should print "Enter a string..."
                    
                    li $v0,8
                    la $a0,stringSz        # $a0 has address of stringSz
                    li $a1, 25
                    syscall
                    
                    li $v0,4
                    la $a0,showsStr        # $a0 has address of showsStr
                    syscall                # should print "The string: "
                    
                    li $v0,4
                    la $a0,stringSz        # $a0 has address of stringSz
                    syscall
                    
                    li $v0,4
                    la $a0,prmptChr        # $a0 has address of prmptChr
                    syscall                # should print "Enter a character: "
                    
                    li $v0,12
                    syscall 
                     
                    move $t1,$v0           # Copy character read (in $vo)to $t1
                    li $v0,4
                    la $a0,showsChr        # $a0 has address showsChr
                    syscall                # should print "The character: "
                    
                    li $v0,11
                    move $a0,$t1           # Copy character read (in $t1)to $a0
                    syscall
                    
                    li $v0,10              # Exit
                    syscall


