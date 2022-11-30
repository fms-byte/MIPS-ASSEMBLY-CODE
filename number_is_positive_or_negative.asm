.data
	ms1: .asciiz"Enter your number: "
	ms2: .asciiz"The number is Positive\n"
	ms3: .asciiz"The number is Negative\n"
.text
main:
	li $v0,4
	la $a0,ms1
	syscall
	
	#taking input
	li $v0,5
	syscall
	move $s0,$v0 #set $s0=$v0
	
	addi $t2,$t2,0 #set $t2 to ($t2 plus 0)
	slt $t0,$s0,$t2 #if $s0 is less than $t2, then set $t0 to 1 else $t0 to 0
	#if $s0<0, $t0=1
	#else $t0=0
	
	beq $t0,0,positive #if $t0=0, POSITIVE, go to positive:
	j negative
		
	#print message for positive
	positive:
		li $v0,4
		la $a0,ms2
		syscall
		j Exit
	#print message for negative
	negative:	
		li $v0,4
		la $a0, ms3
		syscall
		j Exit
	Exit:
		li $v0,10
		syscall