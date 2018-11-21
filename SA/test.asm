main:	addi $s0, $zero, 65535
	mult $s0, $s0
	mflo $a0
	li $v0, 1
	syscall
	li $v0, 10
	syscall