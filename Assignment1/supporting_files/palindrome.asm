    .data
a:
    12321
    .text
main:
	load %x0, $a, %x3       ;x3(original numnber)
    load %x0, $a, %x30		;x30(copy of original number) = a
    blt %x3, %x0, notpalindrome ;if number is negative then it is non-palindrome
	addi %x0, 0, %x4		;x4(reverse number) = 0
loop:
	divi %x3, 10, %x3		;x3 = x3/10
    muli %x4, 10, %x4       ;x4 = x4*10
	add %x4, %x31, %x4		;x4 = x4 + remainder
	beq %x3, %x0, check		;if x3 == 0 check palindrome
	jmp loop
check:
	beq %x30, %x4, palindrome       ;if original = reverse then palindrome
	addi %x0, 0, %x10;				;else not-palindrome
	subi %x0, 1, %x10;
    end
palindrome:
	addi %x0, 0, %x10;      ;put 1 in x10
	addi %x10, 1, %x10;
	end
notpalindrome:
    addi %x0, 0, %x10;      put -1 in x10
	subi %x0, 1, %x10;
    end
