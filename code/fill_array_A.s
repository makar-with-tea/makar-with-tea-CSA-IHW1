.text
# ������������, ����������� ������ � �������, ��������� �������������
# ��������� ��������� (����� ������� � ������, ����� �������) �������� ����� ����
# ��������� ����������, �������� �������� �������� �������, ������������ �� ����
# ������ ������� �� �������� �����������, ��� ������ - ����������������� ������ �� ������
fill_array_A:
	addi sp sp -4
	sw  ra (sp) # ������� �������� ra �� ����
	# ������� ������ �� �����
	addi a2 sp 4
	lw a1 (a2) # �������� ����� ������� � a1
	addi a2 a2 4
	lw a0 (a2)  # �������� ����� ������� � a0
	li t3 0 # ������� ������
	addi sp sp -4
	sw t3 (sp) # ������� �������� �������� ������� �� ����
	array_loop_A:
		read_int(t5)
		lw t3 (sp) # �������� �������� �������� ������� �� �����
		# � ������� ������� �������� �������� �������� A ��������� ������������� ��������
		# � ������ �������� ���������: t0 - ����� ������� B, t5 - ��������� ��������, t3 - ������ �������� ��������
		load_array_elem (t0, t5, t3)
		sw t3 (sp) # ������� �������� �������� ������� �� �����
		bltu t3 a1 array_loop_A
	addi sp sp 4 # ������ �� ����� �������� �������
	lw ra (sp)    # ����������� ������� ra
	addi sp sp 8 # ������ �� ����� ra � ����� �������
	lw a0 (sp) # ��������� � a0 ����� ������� �� �����
	addi sp sp 4  # ������ ����� ������� �� �����
	ret