	.data
msg1:	.asciiz "Input string: "
msg2:	.asciiz "Input character: "
msg3:	.asciiz "Output: "
string:	.space 64
char1:	.space 8
char2:	.space 8
	.text
	.globl main
main:	li $v0, 8
	la $a0, string
	li $a1, 64
	syscall			#read string
	la $s0, string
	
	la $a0, char1
	li $a1, 8
	syscall			#read char1
	la $s1, char1
	
	la $a0, char2
	li $a1, 8
	syscall			#read char2
	la $s2, char2
loop:	lb $t0, 0($s0)		#取string第一个字符
	lb $t1, 0($s1)		#取char1
	bne $t0, $t1, else
	move $a0, $t0
	li $v0, 4
	syscall
	addi $s0, $s0, 1	#删掉第一个字符
	j loop
else:
	