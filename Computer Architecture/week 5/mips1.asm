# Store decimal values 42 and 9 in registers $t1 and $t2 respectively
addi $t1, $zero, 42
addi $t2, $zero, 9

# Add them together and store the result in $s1
add $s1, $t1, $t2

# Add 10 to the result and store back in $s1
addi $s1, $s1, 10
