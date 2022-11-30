.data
	msg:.asciiz"Hello World..\n"
.text
main:
	#print message
	li $v0,4 #code for syscall: print message
	la $a0, msg #Pointer to string (load the address of msg)
	syscall
	
	#exit from the program
	li $v0, 10 #code for syscall: exit
	syscall