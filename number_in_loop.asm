.data
	Comma: .asciiz","
.text
main:
	#initialize i=0
	li $t0,1 #$t0=1
	j for_loop
	
	li $v0,10
	syscall
	
	#check if(i>10) then Exit
	for_loop:
		bgt $t0,10,Exit #branch if greater than -> if $t0>10 then Exit
		#print the value of i
		li $v0,1
		move $a0,$t0
		syscall
		
		#no comma for the last number
		beq $t0,10 Exit
		
		#print a comma
		li $v0,4
		la $a0,Comma
	
		syscall
		
		#increment i (like: i++)
		addi $t0, $t0, 1
		j for_loop
		
		Exit:
			li $v0,10
			syscall