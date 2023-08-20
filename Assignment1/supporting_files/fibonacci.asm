	.data
n:
	10
	.text
main:
	load %x0, $n, %x3
	addi %x0, 65535, %x30
	addi %x0, 65534, %x29
	beq %x3, 0, endzero
	addi %x0, 1, %x21
	beq %x3, %x21, endone
	store %x21, $n, %x29
	addi %x21, 1, %x21
	jmp fibo
endzero:
	addi %x0, 999, %x27
	end
endone:
	end
fibo:
	beq %x3, %x21, endfibo
	load %x30, $n, %x15
	load %x29, $n, %x14
	add %x15, %x14, %x17
	subi %x29, 1, %x29
	subi %x30, 1, %x30
	store %x17, $n, %x29
	subi %x3, 1, %x3
	jmp fibo
endfibo:
	end