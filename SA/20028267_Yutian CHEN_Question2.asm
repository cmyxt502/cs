			.data 0x10010010
input:		.space 1000
read_x:  	.asciiz "please enter the number x: "
read_y:  	.asciiz "please enter the number y: "
res:		.asciiz "the result is: "
overflow:	.asciiz "Overflow!"
invalid:	.asciiz "Invalid number!\n"
shift:		.asciiz "\n"
	 		.text
			.globl main

# x^3 + 3x^2y + 3xy^2 + 9y^3 = (x^2 + 3y^2)(x + 3y)

main:	

		la $a0, read_x				
		li $v0, 4 					
		syscall 						# print out user prompts to read x
		jal checkinput
		add $s0, $v0, $zero				# x -> $s0

		mult $s0, $s0					# get x^2
		mflo $s2						# get the result of x^2
		slt $t5, $s2, $zero 			# if x^2 < 0 then overflow
		bne $t5, $zero, of
		mfhi $t0						# move Hi -> $t0
		bne $t0, $zero, of 				# if Hi != 0 then there is an overflow (because x^2 >= 0, so only need to check whether Hi is 0)
		

		la $a0, read_y				
		li $v0, 4 					
		syscall 						# print out user prompts to read y
		jal checkinput
		add $s1, $v0, $zero				# y -> $s1			

		mult $s1, $s1					# get y^2
		mflo $s3						# get the result of y^2 -> $s3
		slt $t5, $s3, $zero 			# if y^2 < 0 then overflow
		bne $t5, $zero, of
		mfhi $t0						# move Hi -> $t0
		bne $t0, $zero, of 				# if Hi != 0 then overflow 
		addi $t4, $zero, 3
		mult $s3, $t4
		mflo $s3						# get the result of 3*y^2 -> $s3
		slt $t5, $s3, $zero 			# if 3*y^2 < 0 then overflow
		bne $t5, $zero, of
		mfhi $t0						# move Hi -> $t0
		bne $t0, $zero, of 				# if Hi != 0 then there is an overflow (because 3*y^2 >= 0, so only need to check whether Hi is 0)

		add $s4, $s2, $s3				# get (x^2+3*y^2) store in $s4
		slt $t0, $s4, $zero 			# check if (x^2+3*y^2) is overflow (because (x^2+3*y^2) >= 0, so only need to check whether $s4 < 0)
		bne $t0, $zero, of 			

		mul $s1, $s1, $t4 				# get 3y -> $s1
		add $s5, $s0, $s1				# get (x + 3y) -> $s5
										# do not need to check the overflow of (x +3y), because (x^2 + 3y^2) >= |x + 3y| >=0 when x & y are both integers.
										# if (x + 3y) is overflow then (x^2 + 3y^2) is definite overflow

		slt $t0, $s5, $zero				# find that if (x + 3y) is positive

		mult $s4, $s5					# multiply (x + 3y) and (x^2 + 3y^2)
		mfhi $t2						# Hi -> $t2
		beq $t0, $zero, of2				# split to 2 situations to discuss the overflow of (x^2 + 3y^2)(x + 3y)
of1:
		nor $t1, $zero, $zero 			# sign-extending to check the overflow of Hi when (x + 3y) < 0
		bne $t2, $t1, of 				# check overflow if Hi isn't the sign-extending of Lo
		mflo $s6						# move Lo -> $s6
		slt $t5, $s6, $zero 			# if (x^2 + 3y^2)(x + 3y) < 0 then overflow
		beq $t5, $zero, of
		j result
of2:
		bne $t2, $zero, of 				# check overflow if Hi isn't the sign-extending of Lo
		mflo $s6
		slt $t5, $s6, $zero 			# if (x^2 + 3y^2)(x + 3y) < 0 then overflow
		bne $t5, $zero, of

result:
		la $a0, res			
		li $v0, 4 					
		syscall 						# print out user prompts of result

		move $a0, $s6
		li $v0, 1 						# print out the result 
		syscall
		j Exit

of:
		la $a0, overflow			
		li $v0, 4 					
		syscall 						# print out user prompts of overflow

Exit:
		la $a0, shift		
		li $v0, 4 					
		syscall							# shift to the next line

		li $v0, 10
		syscall 						# exit


	# function to check that whether the input is character of floating point number
	checkinput:

			la $a0, input
			li $v0, 8					
			syscall							# input the string
			move $t4, $a0					# string address -> $t0
			li $t6, 1000 					
			li $t7, -38

			lb $t0, 0($t4)
			li $t1, 45
			bne $t0, $t1, check
			li $t7, 1
			addi $t4, $t4, 1

	check:
			addi $t3, $t3, 1
			lb $t0, 0($t4)
			addi $t0, $t0, -48
			beq $t0, $t7, OK
			mul $t5, $t5, 10
			slt $t1, $t0, $zero
			bne $t1, $zero, Extra
			li $t2, 9
			slt $t1, $t0, $t2
			beq $t1, $zero, Extra
			beq $t3, $t6, OK	
			addi $t4, $t4, 1
			add $t5, $t5, $t0
			j check



	Extra:
			la $a0, invalid			
			li $v0, 4 					
			syscall 						# print out user prompts of the invalid input of N
			li $v0, 10
			syscall 						# exit the program

	OK:
			bne $t7, $zero, negative
			li $v0, 1 						# print out the numbers for column
			syscall
			j Extra		

	negative:
			sub $t5, $zero, $t5
			move $v0, $t5
			jr $ra	
