.text
# ���� ������������� ����� �������
# ������� �� ��������� �� ���� ����������
input_length:
	read_int(a1)
	# ���� ��������� ����� �� ����� � ���������� �� 1 �� 10, ���� �����������
	blez a1 incorrect_input
	bgt a1 s3 incorrect_input
	ret # ������������ ��������� (����� �������) ����� � �������� a1

incorrect_input:
	# ����� ��������� �� ������. ��� ������ ���������� �����. ������ � ���������� - ��������� �������
	print_str("Incorrect input: your number should be between 1 and 10. Try again!\n")
	b input_length