.data
	ms1: .asciiz"Enter the value of n: "
	msg1: .asciiz"Sum of 1 to "
	msg2: .asciiz" is: "
.text
main:
	#initialize i=0
	li $v0,4
	la $a0,ms1
	syscall
	
	#taking input
	li $v0,5
	syscall
	move $s0,$v0
	
	li $t0,1
	j for_loop
	
	for_loop:
		bgt $t0,$s0,Exit #if i>10, then Exit
		
		add $t1,$t1,$t0 #like:sum=sum+i
		
		addi $t0,$t0,1 #increment i=i+1
		j for_loop
		
	Exit:
		li $v0,4
		la $a0,msg1
		syscall
		
		#print the integer
		li $v0,1
		move $a0,$s0
		syscall
		
		li $v0,4
		la $a0,msg2
		syscall
		
		#printing sum which is stored in $t1
		li $v0,1
		move $a0,$t1
		syscall
	
		li $v0,10
		syscall
		
		