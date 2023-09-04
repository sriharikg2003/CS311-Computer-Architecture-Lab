    .data
n:
    10
    .text
main:
	load %x0, $n, %x3			;x3 = n
	addi %x0, 0, %x4			;f = 0 
	addi %x4, 1, %x5			;f = 0 + 1
	addi %x0, 65535, %x6		;storing 655535 in x6 i.e. x6 = 2^16 - 1
	addi %x4, 1, %x7			;x7 = i
	store %x4, 0, %x6			;store x4 at address 2^16 - 1
	jmp fibonacciloop
fibonacciloop:
	beq %x7, %x3, break			;terminate condition i.e. n == i
	add %x4, %x5, %x8			;x8 = x4 + x5 fibonancci formula
	subi %x6, 1, %x6			;again given address - i(for loop)
	store %x8, 0, %x6			;storing x4 at address 2^16 - i 
	addi %x4, 0, %x5		    ;x5 = x4
	addi %x8, 0, %x4			;x4 = x8
    addi %x7, 1, %x7	       	;increamenting i
    jmp fibonacciloop
break:
	end