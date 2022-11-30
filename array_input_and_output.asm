.data
	array: .space 2000 #2000 bytes
	space: .asciiz" "
	Size: .asciiz"Enter the number of integers less than 500: "
	inputMsg: .asciiz"\nEnter the elements of array: "
	outputMsg: .asciiz"\nArray: "
.text
main:
	#print string Size
	li $v0,4
	la $a0,Size
	syscall
	
	#Number of input arraysize
	li $v0,5 #for taking input
	syscall
	move $s1,$v0 #s1=5 integers
	
	mul $s1,$s1,4 #s1=20 bytes
	
	#printing inputMsg, asking for elements of the array
	li $v0,4
	la $a0, inputMsg
	syscall
	addi $s0,$zero,0 #i=0
	inputLoop:
		#s0(i) will be 0,4,8,12,16.... if S0==20, exit the loop
		beq $s0,$s1, output #S0==s1, go to output, finished taking input
		li $v0,5 #taking input
		syscall
		move $t1,$v0
		
		#store value in array
		sw $t1, array($s0) #array[0]= $t1 0,4,8,12,16
		addi $s0,$s0,4 #i=i+4
		j inputLoop
	output:
		#printing outputMsg
		li $v0,4
		la $a0,outputMsg
		syscall
		
		addi $s0,$zero,0
	printLoop:
		beq $s0,$s1,Exit
		lw $t4, array($s0) #t4=array[i]
		#print the instant array position value
		
		li $v0,1 #printing an integer
		move $a0,$t4
		syscall
		
		#print a space after a number
		li $v0,4
		la $a0,space
		syscall
		
		#increment index, s0= s0+4
		addi $s0,$s0,4 #i=i+4
		j printLoop
	Exit:
		li $v0,10
		syscall
		
