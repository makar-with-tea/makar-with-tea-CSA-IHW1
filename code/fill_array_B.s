.text
# ������������, ����������� ������ B
# ��������� (����� �������) �������� ����� ����
# ������ � ��������� ������� ������� B �������������� 0, ��� ��� ��� ��� ���������� ��������� ��������� �������
fill_array_B:
	addi sp sp -4
	sw  ra (sp) # ������� �������� ra �� ����
	# ������� ������ �� �����
	addi a2 sp 4
	lw a1 (a2) # �������� ����� ������� � a1
	addi a2 a2 4
	lw a3 (a2)  # �������� ����� ������� A � a3
	addi a2 a2 4
	lw a0 (a2)  # �������� ����� ������� B � a0
	li t3 0 # ������� ������
	addi sp sp -4
	sw t3 (sp) # ������� �������� �������� ������� �� ����
	li t5 3 # ����� ��� �������� ����� �������
	blt a1 t5 small_length
	lw t3 (sp) # �������� �������� �������� ������� �� �����
	load_array_elem(a0, zero, t3)
	sw t3 (sp) # ������� �������� �������� ������� �� �����
	addi a1 a1 -1 # �������� ����� �� 1, ����� ��������� ������� ������� �� �������������
	#� ��������� ����� ��������: � t4 - ����������� ��-��, � t5 - �������� �-��, � t6 - ���������� ��-�� ������� A
	array_loop_B:
		lw t4 (a3) # ��������� � t4 ���������� ��-�
		addi a3 a3 8 # ��������� � ���������� ��-��
		lw t6 (a3) # ��������� ��� � t6
		addi a3 a3 -4 # ��������� � �������� ��-��
		lw t5 (a3) # ��������� ��� � t5
		add t4 t4 t5
		add t4 t4 t6 # ������� ����� ���� 3 ���������
		lw t3 (sp) # �������� �������� �������� ������� �� �����
		# � ������� ������� �������� �������� �������� B ������ ��������
		# � ������ �������� ���������: a0 - ����� ������� B, t4 - ��������� ��������, t3 - ������ �������� ��������
		load_array_elem(a0, t4, t3)
		sw t3 (sp) # ������� �������� �������� ������� �� �����
		blt t3 a1 array_loop_B
		# � ������� ������� �������� �������� �������� B ��������� ������������� ��������
		# � ������ �������� ���������: a0 - ����� ������� B, zero - ��������� �������� (0), t3 - ������ �������� ��������
		load_array_elem(a0, zero, t3)
		b end_fill_array_B

	small_length:
		lw t3 (sp) # �������� �������� �������� ������� �� �����
		# � ������� ������� �������� �������� �������� B ��������� ������������� ��������
		# � ������ �������� ���������: a0 - ����� ������� B, zero - ��������� �������� (0), t3 - ������ �������� ��������
		load_array_elem(a0, zero, t3)
		sw t3 (sp) # ������� �������� �������� ������� �� �����
		blt t3 a1 small_length
		b end_fill_array_B
	
	end_fill_array_B:
		addi sp sp 4 # ������ �� ����� �������� �������
		lw ra (sp)    # ����������� ������� ra
		addi sp sp 12 # ������ �� ����� ra, ����� ������� � ����� ������� A
		lw a0 (sp) # ��������� � a0 ����� ������� �� �����
		addi sp sp 4  # ������� ����� ������� �� �����
		ret