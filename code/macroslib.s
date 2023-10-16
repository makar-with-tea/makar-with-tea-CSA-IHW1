# ћакрос дл€ записи введенного пользователем целого числа в регистр %x
.macro read_int(%x)
	li a7 5
	ecall
	mv %x a0
.end_macro 
# ћакрос дл€ вывода целого числа из заданного регистра %x
.macro print_int(%x)
	li a7 1
	mv a0 %x
	ecall
.end_macro 
# ћакрос дл€ придачи элементу с индексом %ind массива, лежащего по адресу %adress_arr, значени€, лежащего в регистре %x
.macro load_array_elem(%adress_arr, %x, %ind)
	sw %x(%adress_arr)
	addi %ind %ind 1
	addi %adress_arr %adress_arr 4
	# сдвигаемс€ по массиву на 1 элемент вперед
.end_macro
# ћакрос дл€ вывода строки из заданного регистра %x
.macro print_str(%x)
	.data
	str: .asciz %x
	.text
	li a7, 4
	la a0, str
	ecall
.end_macro
# ћакрос дл€ вывода массива, лежащего по адресу %adress и имеющего длину %length
# ¬ реализации макроса используетс€ сохранение локальных переменных на стек
.macro print_array(%adress, %length)
	addi sp sp -4
	sw  ra (sp) # ѕоложим значение ra на стек
	addi sp sp -4
	sw %adress (sp) # ѕоложим адрес начала массива на стек
	li t4 0 # текущий индекс
	print_array_loop:
		lw t5(%adress)
		print_int(t5) # печать текущего элемента
		print_str("\n")
		# переходим к следующему элементу
		addi t4 t4 1
		addi %adress %adress 4
		blt t4 %length print_array_loop
	lw  %adress (sp) # с помощью сохраненной в стеке информации возвращаем переменной %adress изначальное значение
	addi sp sp 4 # удал€ем адрес массива со стека
	lw ra (sp)
	addi sp sp 4 # удал€ем значение ra со стека
.end_macro