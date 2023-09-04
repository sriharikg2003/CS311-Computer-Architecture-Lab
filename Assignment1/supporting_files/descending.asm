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
	load %x0, $n, %x3		;x3 = n
	addi %x0, 0, %x4		;x4 = i
	addi %x0, 1, %x5		;x5(j) = i
forloop:
	beq %x4, %x3, break
	load %x4, $a, %x6		;x6 = a[i]  "load move data from memory to register"
	load %x5, $a, %x7		;x7 = a[j]
	blt %x6, %x7, swap		;swaping elements if x6 < x7
	addi %x5, 1, %x5		;j += 1
	beq %x5, %x3, fun		;increment function for i
	jmp forloop				
fun:
	addi %x4, 1, %x4		; i += 1
	addi %x4, 0, %x5		; j = i 
	jmp forloop
swap:
	addi %x7, 0, %x8		;x8(temp) = x7
	addi %x6, 0, %x7		;x7 = x6
	addi %x8, 0, %x6		;x6 = x8(temp)
	store %x6, $a, %x4		;a[i] = x7	"store moves data from register to memory"
	store %x7, $a, %x5		;a[j] = x6
	jmp forloop
break:
	end