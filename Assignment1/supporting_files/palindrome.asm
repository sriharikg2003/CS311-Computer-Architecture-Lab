	.data
a:
	121
	.text
main:
	load %x0, $a, %x3
	add %x0, %x3, %x4
	addi %x0, 1, %x6
	addi %x0, 1, %x5
	addi %x0, 0, %x7
	jmp findint
findint:
	divi %x4, 10, %x4 
	beq %x4, 0, endint
	addi %x5, 1, %x5
	jmp findint
endint:
	add %0, %x3, %x4
	jmp multen
multen:
	beq %x5, -1, endmulten
	muli %x6, 10, %x6
	subi %x5, 1, %x5	
	jmp multen
endmulten:
	divi %x6, 10, %x6
	jmp findrev
findrev:
	beq %x6, 0, endfindrev
	divi %x4, 10, %x4
	addi %x7, %x0, %x8
	mul %x31, %x6, %x8
	add %x7, %x8, %x7
	divi %x6, 10, %x6
	jmp findrev
endfindrev:
	beq %x7, %x3, success
	subi %x10, %x10, %x10
	subi %x10, 1, %x10
	end
success:
	subi %x10, %x10, %x10
	addi %x10, 1, %x10
	end