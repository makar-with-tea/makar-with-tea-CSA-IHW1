.text
# Ввод пользователем длины массива
# Функция не принимает на вход аргументов
input_length:
	read_int(a1)
	# Если введенное число не лежит в промежутке от 1 до 10, ввод повторяется
	blez a1 incorrect_input
	bgt a1 s3 incorrect_input
	ret # Возвращаемый результат (длина массива) лежит в регистре a1

incorrect_input:
	# Вывод сообщения об ошибке. Для вывода используем соотв. макрос с аргументом - выводимой строкой
	print_str("Incorrect input: your number should be between 1 and 10. Try again!\n")
	b input_length