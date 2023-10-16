.include "macroslib.s"

.data
.align 2
# ������� A � B ��� 1 �����
array_A1:  .space 4	# ������ A
array_B1:  .space 4	# ������ B
# ������� A � B ��� 2 �����
array_A2:  .space 32   # ������ A
array_B2:  .space 32   # ������ B
# ������� A � B ��� 3 �����
array_A3:  .space 40   # ������ A
array_B3:  .space 40   # ������ B
# ������� A � B ��� 4 �����
array_A4:  .space 12   # ������ A
array_B4:  .space 12   # ������ B

.text
# ���� 1
print_str("TEST 1\n")
li t0 1 # ����� �������
la t1 array_A1
la t2 array_B1
# ���������� ������� A
li a1 2 # ������� �������
sw a1 (t1)
print_str("Array A:\n")
print_array(t1, t0)
addi sp sp -4
sw t2 (sp) # ������ ����� ������� B � ����
addi sp sp -4
sw t1 (sp) # ������ ����� ������� A � ����
addi sp sp -4
sw  t0 (sp) # ������ ����� ������� � ����
jal fill_array_B
mv t2 a0
print_str("Array B, where B_i = A_(i-1) + A_i + A_(i+1):\n")
print_array(t2, t0)

# ���� 2
print_str("\nTEST 2\n")
li t0 8 # ����� �������
la t1 array_A2
la t2 array_B2
# ���������� ������� A
li a1 1 # ������� �������
li a2 0 # ������� ������
li a3 -1 # ����������� ���������
loop_fill_A2:
	load_array_elem(t1, a1, a2)
	mul a1 a1 a3
	blt a2 t0 loop_fill_A2
la t1 array_A2
print_str("Array A:\n")
print_array(t1, t0)
addi sp sp -4
sw t2 (sp) # ������ ����� ������� B � ����
addi sp sp -4
sw t1 (sp) # ������ ����� ������� A � ����
addi sp sp -4
sw  t0 (sp) # ������ ����� ������� � ����
jal fill_array_B
mv t2 a0
print_str("Array B, where B_i = A_(i-1) + A_i + A_(i+1):\n")
print_array(t2, t0)

# ���� 3
print_str("\nTEST 3\n")
li t0 10 # ����� �������
la t1 array_A3
la t2 array_B3
# ���������� ������� A
li a1 1 # ������� �������
li a2 0 # ������� ������
loop_fill_A3:
	load_array_elem(t1, a1, a2)
	addi a1 a1 2
	blt a2 t0 loop_fill_A3
la t1 array_A3
print_str("Array A:\n")
print_array(t1, t0)
addi sp sp -4
sw t2 (sp) # ������ ����� ������� B � ����
addi sp sp -4
sw t1 (sp) # ������ ����� ������� A � ����
addi sp sp -4
sw  t0 (sp) # ������ ����� ������� � ����
jal fill_array_B
mv t2 a0
print_str("Array B, where B_i = A_(i-1) + A_i + A_(i+1):\n")
print_array(t2, t0)

# ���� 4
print_str("\nTEST 4\n")
li t0 3 # ����� �������
la t1 array_A4
la t2 array_B4
# ���������� ������� A
li a1 -4 # ������� �������
li a2 0 # ������� ������
loop_fill_A4:
	load_array_elem(t1, a1, a2)
	addi a1 a1 -3
	blt a2 t0 loop_fill_A4
la t1 array_A4
print_str("Array A:\n")
print_array(t1, t0)
addi sp sp -4
sw t2 (sp) # ������ ����� ������� B � ����
addi sp sp -4
sw t1 (sp) # ������ ����� ������� A � ����
addi sp sp -4
sw  t0 (sp) # ������ ����� ������� � ����
jal fill_array_B
mv t2 a0
print_str("Array B, where B_i = A_(i-1) + A_i + A_(i+1):\n")
print_array(t2, t0)

li a7 10 # �������
ecall
.include "fill_array_B.s"