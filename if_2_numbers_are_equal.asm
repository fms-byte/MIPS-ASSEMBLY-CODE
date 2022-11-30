.data
	num1: .asciiz"Enter 1st number: "
	num2: .asciiz"Enter 2nd number: "
	equal: .asciiz"\nNumbers are equal\n"
	NotEqual: .asciiz"\nNumbers are not equal\n"
.text
main:
	li $v0,4
	la $a0,num1
	syscall
	
	#taking 1st number
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,num2
	syscall
	
	#taking 2nd number
	li $v0,5
	syscall
	move $t2,$v0
	
	#check equality
	beq $t1,$t2, Equal
	j Not_Equal
	
	#message for equal
	Equal:
		li $v0,4
		la $a0,equal
		syscall
		j Exit
	#message for not equal
	Not_Equal:
		li $v0,4
		la $a0,NotEqual
		syscall
		j Exit
	#Exit the program
	Exit:
		li $v0,10
		syscall