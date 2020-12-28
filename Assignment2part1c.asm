##########################################################################
# Reagan Carter, CS 2318-253, Assignment 2 Part 1 Program C
############################
# Allocate a global array enough for 5 integers (44,99,33,11,and 55)
# re-order the values in memory and display each operation
############################ data segment ################################
                 .data
array:           .word 44,99,33,11,55
outputArray:     .asciiz "Array 1st to 5th element:  "
outputArray2:    .asciiz "Array from 5th to last element: "
examFinal:       .asciiz "Enter the integer score for final Exam: "
avgScore:        .asciiz "Average score: "
############################ code segment ################################
			.text
			.globl main
main:
                        li $t0,0
                        li $t1,1
loop1:                  bgt $t1,4,exit1