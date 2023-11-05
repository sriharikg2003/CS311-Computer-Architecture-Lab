    .data
a:
    1
    2
    3
    4
    5
    6
    7
.text
main:
    sub %x12, %x12, %x12
    sub %x3, %x3, %x3
    addi %x3, 10, %x3
lol:
    load %x12, $a, %x12
    load %x12, $a, %x12
    load %x12, $a, %x12
    load %x12, $a, %x12
    load %x12, $a, %x12
    load %x12, $a, %x12
    load %x12, $a, %x12
    sub %x12, %x12, %x12
    subi %x3, 1, %x3
    bgt %x3, %x0, lol
    end
