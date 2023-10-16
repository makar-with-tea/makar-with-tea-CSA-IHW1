.include "macroslib.s"

.data
.align 2
# массивы A и B для 1 теста
array_A1:  .space 4	# массив A
array_B1:  .space 4	# массив B
# массивы A и B для 2 теста
array_A2:  .space 32   # массив A
array_B2:  .space 32   # массив B
# массивы A и B для 3 теста
array_A3:  .space 40   # массив A
array_B3:  .space 40   # массив B
# массивы A и B для 4 теста
array_A4:  .space 12   # массив A
array_B4:  .space 12   # массив B

.text
# тест 1
print_str("TEST 1\n")
li t0 1 # длина массива
la t1 array_A1
la t2 array_B1
# заполнение массива A
li a1 2 # элемент массива
sw a1 (t1)
print_str("Array A:\n")
print_array(t1, t0)
addi sp sp -4
sw t2 (sp) # кладем адрес массива B в стек
addi sp sp -4
sw t1 (sp) # кладем адрес массива A в стек
addi sp sp -4
sw  t0 (sp) # кладем длину массива в стек
jal fill_array_B
mv t2 a0
print_str("Array B, where B_i = A_(i-1) + A_i + A_(i+1):\n")
print_array(t2, t0)

# тест 2
print_str("\nTEST 2\n")
li t0 8 # длина массива
la t1 array_A2
la t2 array_B2
# заполнение массива A
li a1 1 # элемент массива
li a2 0 # текущий индекс
li a3 -1 # коэффициент умножения
loop_fill_A2:
	load_array_elem(t1, a1, a2)
	mul a1 a1 a3
	blt a2 t0 loop_fill_A2
la t1 array_A2
print_str("Array A:\n")
print_array(t1, t0)
addi sp sp -4
sw t2 (sp) # кладем адрес массива B в стек
addi sp sp -4
sw t1 (sp) # кладем адрес массива A в стек
addi sp sp -4
sw  t0 (sp) # кладем длину массива в стек
jal fill_array_B
mv t2 a0
print_str("Array B, where B_i = A_(i-1) + A_i + A_(i+1):\n")
print_array(t2, t0)

# тест 3
print_str("\nTEST 3\n")
li t0 10 # длина массива
la t1 array_A3
la t2 array_B3
# заполнение массива A
li a1 1 # элемент массива
li a2 0 # текущий индекс
loop_fill_A3:
	load_array_elem(t1, a1, a2)
	addi a1 a1 2
	blt a2 t0 loop_fill_A3
la t1 array_A3
print_str("Array A:\n")
print_array(t1, t0)
addi sp sp -4
sw t2 (sp) # кладем адрес массива B в стек
addi sp sp -4
sw t1 (sp) # кладем адрес массива A в стек
addi sp sp -4
sw  t0 (sp) # кладем длину массива в стек
jal fill_array_B
mv t2 a0
print_str("Array B, where B_i = A_(i-1) + A_i + A_(i+1):\n")
print_array(t2, t0)

# тест 4
print_str("\nTEST 4\n")
li t0 3 # длина массива
la t1 array_A4
la t2 array_B4
# заполнение массива A
li a1 -4 # элемент массива
li a2 0 # текущий индекс
loop_fill_A4:
	load_array_elem(t1, a1, a2)
	addi a1 a1 -3
	blt a2 t0 loop_fill_A4
la t1 array_A4
print_str("Array A:\n")
print_array(t1, t0)
addi sp sp -4
sw t2 (sp) # кладем адрес массива B в стек
addi sp sp -4
sw t1 (sp) # кладем адрес массива A в стек
addi sp sp -4
sw  t0 (sp) # кладем длину массива в стек
jal fill_array_B
mv t2 a0
print_str("Array B, where B_i = A_(i-1) + A_i + A_(i+1):\n")
print_array(t2, t0)

li a7 10 # Останов
ecall
.include "fill_array_B.s"
