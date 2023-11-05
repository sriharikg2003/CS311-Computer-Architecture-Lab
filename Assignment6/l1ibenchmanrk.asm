	.data
a:
	10
	.text
main:
	sub %x19, %x19, %x19
	addi %x19, 10, %x19
loop:
	addi %x23, 1, %x23
	addi %x23, 2, %x23
	addi %x23, 3, %x23
	addi %x23, 4, %x23
	addi %x23, 3, %x23
	addi %x23, 4, %x23
	addi %x23, 5, %x23
	addi %x23, 6, %x23
	subi %x19, 1, %x19
	bgt %x19, %x0, loop
	end
