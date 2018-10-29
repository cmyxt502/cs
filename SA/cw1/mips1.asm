	.data
new:	.asciiz "\n"
blank:	.asciiz " "
	.text
	.globl main
main:	li $v0, 5	
	syscall			#read integer N
	move $s0, $v0		#store N in $s0
	move $s1, $zero
	addi $s1, $s1, 1
loop1:	beq $s0, $zero, wexit	#goto wexit if N equal to 0
	addi $s0, $s0, -1	#N=N-1
	addi $s1, $s1, 1
	move $s2, $zero
	addi $s2, $s2, 1	#initialize $s2 at the start of a new line
	j loop2			#goto loop2 which is a subcycle of loop1
loop2:	beq $s1, $s2, newline	#print in a new line after printting current line
	move $a0, $s2
	li $v0, 1
	syscall			#print $s2
	la $a0, blank
	li $v0, 4
	syscall			#print a blank after printing each integer
	addi $s2, $s2, 1	#$s2=$s2+1
	j loop2
newline:la $a0, new
	li $v0, 4
	syscall			#make a new line
	j loop1			#go back to loop1
wexit:	li $v0, 10
	syscall			#exit the program
