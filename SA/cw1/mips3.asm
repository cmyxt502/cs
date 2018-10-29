	.data
msg1:	.asciiz "Input string: "
msg2:	.asciiz "Input character: "
msg3:	.asciiz "Output: "
string:	.space 64
char1:	.space 8
char2:	.space 8
temp:	.space 8
	.text
	.globl main
main:	la $a0, msg1
	li $v0, 4
	syscall
	li $v0, 8
	la $a0, string
	li $a1, 64
	syscall			#read string
	la $s0, string
	
	la $a0, msg2
	li $v0, 4
	syscall
	li $v0, 8
	la $a0, char1
	li $a1, 8
	syscall			#read char1
	la $s1, char1
	
	la $a0, msg2
	li $v0, 4
	syscall
	li $v0, 8
	la $a0, char2
	li $a1, 8
	syscall			#read char2
	la $s2, char2
	
	la $s3, temp		#"temp" is used for store char for printing out
	
	la $a0, msg3
	li $v0, 4
	syscall
loop:	lbu $t0, 0($s0)		#load char at address of "string"($s0)
	lbu $t1, 0($s1)		#load char at address of "char1"($s1)
	beq $t0, $zero, end	#exit when the length of string is 0
	beq $t0, $t1, replace	#if the char of string == char1, print out char2
	sb $t0, 0($s3)		#else (char of string != char1), store it into address of "temp" ($s3)
	move $a0, $s3
	li $v0, 4
	syscall			#print origin char out
	addi $s0, $s0, 1	#point $s0 (string) to next char
	j loop
replace:
	lbu $t0, 0($s2)		#load char at address of "char2"($s2)
	sb $t0, 0($s3)		#store into address of "temp" ($s3)
	move $a0, $s3
	li $v0, 4
	syscall			#print char2 (replaced char) out
	addi $s0, $s0, 1	#point $s0 (string) to next char
	j loop
end:	li $v0, 10
	syscall
	
