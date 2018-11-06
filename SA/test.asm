main:	addi $a0, $a0, 3
fact: addi $sp, $sp, -8 
sw $ra, 4($sp) 
sw $a0, 0($sp) 
li $v0, 1 
ble $a0, $zero, fact_return 
addi $a0, $a0, -1 
jal fact 
tmpl: lw $a0, 0($sp) 
mul $v0, $v0, $a0 
fact_return: lw $ra 4($sp) 
addi $sp, $sp, 8 
jr $ra