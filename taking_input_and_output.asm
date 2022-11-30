.data
	ms1: .asciiz"Enter your number: "
	ms2: .asciiz"You entered: "
.text
main:
	li $v0, 4
	la $a0, ms1
	syscall
	
	#taking input
	li $v0, 5
	syscall
	move $s0,$v0
	
	#print message
	li $v0,4
	la $a0, ms2
	syscall
	
	#print the integer
	li $v0,1
	move $a0,$s0
	syscall
	
	#successfully exit
	li $v0, 10
	syscall