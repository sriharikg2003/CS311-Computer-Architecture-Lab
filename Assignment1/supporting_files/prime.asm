	.data
a:
	10
	.text
main:
	load %x0, $a, %x3		;x3 = a
	addi %x4, 2, %x4		;x4 = 2
	divi %x3, 2, %x5		;x5 = a/2
	addi %x5, 1, %x5		;x5 += 1
	subi %x0, 0, %x31		;x31 = 0 //remainder 
	bgt %x3, 1, checkprime	;if number is greater than 1 then checkprime
	jmp notprime			;if number is less than or equal to 1 then it is non-prime
checkprime:
	beq %x5, %x4, prime		;if x5 = 2 then it is prime(initial condition)
	div %x3, %x4, %x6 		;x6 = x3/x4
	beq %x0, %x31, notprime	;if x0 == x31 then itis nonprime
	addi %x4, 1, %x4 		;increamenting x4
	jmp checkprime 
prime:
	subi %x0, 0, %x10
	addi %x10, 1, %x10		;x = 1
	end
notprime:
	subi %x0, 0, %x10
	subi %x10, 1, %x10		;x = -1
	end