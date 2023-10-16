# ������ ��� ������ ���������� ������������� ������ ����� � ������� %x
.macro read_int(%x)
	li a7 5
	ecall
	mv %x a0
.end_macro 
# ������ ��� ������ ������ ����� �� ��������� �������� %x
.macro print_int(%x)
	li a7 1
	mv a0 %x
	ecall
.end_macro 
# ������ ��� ������� �������� � �������� %ind �������, �������� �� ������ %adress_arr, ��������, �������� � �������� %x
.macro load_array_elem(%adress_arr, %x, %ind)
	sw %x(%adress_arr)
	addi %ind %ind 1
	addi %adress_arr %adress_arr 4
	# ���������� �� ������� �� 1 ������� ������
.end_macro
# ������ ��� ������ ������ �� ��������� �������� %x
.macro print_str(%x)
	.data
	str: .asciz %x
	.text
	li a7, 4
	la a0, str
	ecall
.end_macro
# ������ ��� ������ �������, �������� �� ������ %adress � �������� ����� %length
# � ���������� ������� ������������ ���������� ��������� ���������� �� ����
.macro print_array(%adress, %length)
	addi sp sp -4
	sw  ra (sp) # ������� �������� ra �� ����
	addi sp sp -4
	sw %adress (sp) # ������� ����� ������ ������� �� ����
	li t4 0 # ������� ������
	print_array_loop:
		lw t5(%adress)
		print_int(t5) # ������ �������� ��������
		print_str("\n")
		# ��������� � ���������� ��������
		addi t4 t4 1
		addi %adress %adress 4
		blt t4 %length print_array_loop
	lw  %adress (sp) # � ������� ����������� � ����� ���������� ���������� ���������� %adress ����������� ��������
	addi sp sp 4 # ������� ����� ������� �� �����
	lw ra (sp)
	addi sp sp 4 # ������� �������� ra �� �����
.end_macro