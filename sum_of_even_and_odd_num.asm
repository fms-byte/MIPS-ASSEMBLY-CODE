.data
	Even: .asciiz"Sum of Even numbers: "
	Odd: .asciiz"\nSum of Odd Numbers: "
.text
main:
	li $t0,0 #initialize Even sum=0
	li $t1,0 #initialize Odd sum=0
	li $s2,2 #will be used for finding even and odd
	li $s0,0 #initial number i= 0, $s0=i
	
	for_loop:
		beq $s0,20,Exit
		addi $s0,$s0,1 #i=i+1
		
		div $s0,$s2 #s0/s2, lo= quotient, hi= reminder
		#example: 5/2, lo=2, hi=1
		
		mfhi $s3 #store reminder, #s3=hi 
		#if reminder=0, then jump Even_sum lebel
		
		beq $s3,0,Even_sum
		j Odd_sum #else jump to Odd_sum
		j for_loop
		
		Even_sum:
			add $t0,$t0,$s0 #t0=t0+s0 , s0 is Even
			j for_loop
		Odd_sum:
			add $t1,$t1,$s0 #t1=t1+s0 , s0 is Odd
			j for_loop
	Exit:
		#print the sum of Even
		li $v0,4
		la $a0, Even
		syscall
		
		#print even number sum stored in $t0
		li $v0,1
		move $a0,$t0
		syscall
		
		#print the sum of Odd
		li $v0,4
		la $a0, Odd
		syscall
		
		#print odd number sum stored in $t1
		li $v0,1
		move $a0,$t1
		syscall
		
		#finished succesfully, Now time to Exit
		li $v0,10
		syscall