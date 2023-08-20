	.data
a:
	10
	.text
main:
	load %x0, $a, %x1
	divi %x1, 2, %x2
	muli %x2 , 2, %x3
	beq %x3, %x2 .even
	load %x0, -1, %x10
even:
	load %x0, 1, %x10

	

