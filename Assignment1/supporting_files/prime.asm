	.data
a:
	77
	.text
main:
	load %x0, $a, %x3
	addi %x0, 2, %x4
	blt %x4, %x3, loop
	addi %x0, 1, %x10
	end
loop:
	div %x3, %x4, %x6
	mul %x6, %x4, %x7
	beq %x3, %x7, notprime
	addi %x4, 1, %x4
	blt %x4, %x3, loop
	jmp prime	
notprime:
	subi %x10, %x10, %x10
	subi %x10, 1, %x10
	end
prime:
	subi %x10, %x10, %x10
	addi %x10, 1, %x10
	end