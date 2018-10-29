	.data
str1:	.asciiz "overflow"
	.text
	.globl main
main:	li $v0, 5
	syscall
	move $s0, $v0
	li $v0, 5
	syscall
	move $s1, $v0
	
	#calculate square of x 
	mult $s0, $s0
	mflo $s2	#storge square of x
	mfhi $a0
	jal check_mult_overflow	#check overflow

	#calculate cube of x
	mult $s0, $s2
	mflo $s3	#storge cube of x
	mfhi $a0
	jal check_mult_overflow	#check overflow
	
	#calculate square of x multiply y (x^2 * y)
	mult $s2, $s1
	mflo $s4	#storge square of x multiply y (x^2 * y)
	mfhi $a0
	jal check_mult_overflow	#check overflow
	
	#calculate 3 multiply square of x multiply y (3 * x^2 * y)
	addi $t0, $zero, 3
	mult $t0, $s4
	mflo $s4	#storge 3 multiply square of x multiply y (3 * x^2 * y)
	mfhi $a0
	jal check_mult_overflow	#check overflow
	
	#calculate square of y
	mult $s1, $s1
	mflo $s5	#storge square of y
	mfhi $a0
	jal check_mult_overflow	#check overflow
	
	#calculate x multiply square of y (x * y^2)
	mult $s0, $s5
	mflo $s6	#storge x multiply square of y (x * y^2)
	mfhi $a0
	jal check_mult_overflow	#check overflow
	
	#calculate 3 multiply x multiply square of y (3 * x * y^2)
	addi $t0, $zero, 3
	mult $t0, $s6
	mflo $s6	#storge 3 multiply x multiply square of y (3 * x * y^2)
	mfhi $a0
	jal check_mult_overflow	#check overflow

	#calculate cube of y
	mult $s1, $s5
	mflo $s7	#storge cube of y
	mfhi $a0
	jal check_mult_overflow	#check overflow

	#calculate 3 multiply cube of y (9 * y^3)
	addi $t0, $zero, 9
	mult $t0, $s7
	mflo $s7	#storge 3 multiply cube of y (9 * y^3)
	mfhi $a0
	jal check_mult_overflow	#check overflow
	
	#now,
	#x^3 in $s3
	#3x^2y in $s4
	#3xy^2 in $s6
	#9y^3 in $s7
	
	addu $t0, $s3, $s4
	move $a0, $t0
	move $a1, $s3
	move $a2, $s4
	jal check_addu_overflow
		
	addu $t7, $t0, $s6
	move $a0, $t7
	move $a1, $t0
	move $a2, $s6
	jal check_addu_overflow
	
	addu $t0, $t7, $s7
	move $a0, $t0
	move $a1, $t7
	move $a2, $s7
	jal check_addu_overflow
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
check_mult_overflow:
	slt $t1, $zero, $a0
	slti $t2, $a0, -1
	or $t3, $t1, $t2	#check whether there's an overflow
	beq $t3, 1, error	#if overflow, jump to error
	jr $ra
check_addu_overflow:
	addi $t9, $zero, 1
	slt $t1, $a0, $zero	#if possitive return 0, if nagetive return 1
	slt $t2, $a1, $zero
	slt $t3, $a2, $zero
	and $t4, $t2, $t3
	xor $t4, $t4, $t9		#if and only if both elements are nagetive, return 0
	or $t5, $t2, $t3
	xor $t5, $t5, $t9		#if and only if both elements are possitive, return 1
	or $t6, $t1, $t4
	beq $t6, 0, error	#if two nagetive elements plus togather and return a possitive number, then overflow occurs
	and $t6, $t1, $t5
	beq $t6, 1, error	#if two possitive elements plus togather and return a nagetive number, then overflow occurs
	jr $ra
error:
	la $a0, str1
	li $v0, 4
	syscall
	li $v0, 10
	syscall
