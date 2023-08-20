	.data
a:
	70
	80
	40
	20
	10
	30
	50
	60
n:
	8
	.text
main:
	load %x0, $n, %x3
	add %x0, %x3, %x5
	jmp startOuter
endOuter:
	end
startOuter:
	subi %x5, 1, %x5
	beq %x5, 0, endOuter
	addi %x0, %x0, %x6
	subi %x5, 0, %x8
	jmp startInner
endInner:
	sub %x6, %x6, %x6
	jmp startOuter
startInner:
	beq %x6, %x8, endInner
	addi %x6, 1, %x11
	load %x6, $a, %x9
	load %x11, $a, %x10
	blt %x9, %10, swap
	addi %x6, 1, %x6
	jmp startInner
swap:
	sub %x12, %x12, %x12
	add %x12, %x9, %x12
	store %x10, $a, %x6
	store %x12, $a, %x11
	addi %x6, 1, %x6
	jmp startInner