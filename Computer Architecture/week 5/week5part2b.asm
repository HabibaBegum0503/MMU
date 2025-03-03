.data
string1: .asciiz "+--+--+--+\n"
string2: .asciiz "|  |  |  |\n"

.text

jal draw
jal draw
jal draw

addi $v0, $zero, 4
la $a0, string1
syscall

addi $v0, $zero, 10
syscall

draw:
	addi $v0, $zero, 4
	la $a0, string1
	syscall
	
	addi $v0, $zero, 4
	la $a0, string2
	syscall
	
	jr $ra