	.data
a:
	10
	.text
main:
	load %x0, $a, %x3			;x3 = 10
	divi %x3, 2, %x3			;x3 = x3/2
	bne %x0, %x31, isodd		;if x31 != 0, then go to isodd funtion 
	subi %x0, 0, %x10			
	subi %x10, 1, %x10			;x10 = -1 if a is even
	end
isodd:
	subi %x0, 0, %x10
	addi %x0, 1, %x10			;x10 = 1 if a is odd
	end