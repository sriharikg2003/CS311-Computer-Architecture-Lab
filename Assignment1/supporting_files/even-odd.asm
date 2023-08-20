	.data
a:
	550
	.text	
main:
	load %x0, $a, %x3	
	divi %x3, 2, %x6		
	beq %x31, 0, even
	addi %x10, 1, %x10 
	end
even:
	subi %x10, 1, %x10 
	end