        .data
new:    .asciiz "\n"
inv:    .asciiz "Invalid Input!\n"
string: .space 64
blank:  .asciiz " "
        .text
        .globl main
main:   la $a0, string
        li $a1, 64
        li $v0, 8
        syscall
        move $s1, $zero
        addi $s1, $s1, 1        #s1 = 1
while:  lbu $t5, 0($a0)         #get 1st char of string
        addi $t5, $t5, -48      #change the ascii code into integer
        blt $t5, 0, invalid
        bgt $t5, 9, invalid     #if the char isn't between 0 and 9, consider it's an invalid integer
        mul $s0, $s0, 10
        add $s0, $s0, $t5       #after converting to integer, add it to N (s0)
        addi $a0, $a0, 1        #point string to next char
        lbu $t6, 0($a0)
        bne $t6, 10, while      #while not reach the end of the string('\n'), do loop again

loop1:  beq $s0, $zero, wexit   #goto wexit if N equal to 0
        addi $s0, $s0, -1       #N=N-1
        addi $s1, $s1, 1
        move $s2, $zero
        addi $s2, $s2, 1        #initialize s2 at the start of a new line
        j loop2                 #goto loop2 which is a subcycle of loop1
loop2:  beq $s1, $s2, newline   #print in a new line after printting current line
        move $a0, $s2
        li $v0, 1
        syscall                 #print s2
        la $a0, blank
        li $v0, 4
        syscall                 #print a blank after printing each integer
        addi $s2, $s2, 1        #s2=s2+1
        j loop2
newline:
        la $a0, new
        li $v0, 4
        syscall                 #make a new line
        j loop1                 #go back to loop1
invalid:
        la $a0, inv
        li $v0, 4
        syscall
wexit:  li $v0, 10
        syscall                 #exit the program
