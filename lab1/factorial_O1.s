.file	"factorial.cpp"         ; Имя исходного файла
	.text                   ; Начало секции кода

; Деструктор статического объекта инициализации ввода/вывода
	.def	__tcf_0;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_0
__tcf_0:
.LFB2085:
	subq	$40, %rsp        ; Выделение места в стеке
	.seh_stackalloc	40
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx  ; Загрузка адреса объекта инициализации
	call	_ZNSt8ios_base4InitD1Ev  ; Вызов деструктора
	nop
	addq	$40, %rsp        ; Освобождение стека
	ret
	.seh_endproc

; Функция вычисления факториала
	.globl	_Z9factoriali    ; Объявление глобальной функции factorial(int)
	.def	_Z9factoriali;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9factoriali
_Z9factoriali:
.LFB1594:
	.seh_endprologue
	movl	$0, %eax         ; Инициализация результата 0 (по умолчанию)
	testl	%ecx, %ecx       ; Проверка входного параметра (n)
	js	.L2              ; Если n < 0, переход к возврату
	je	.L6              ; Если n == 0, переход к специальному случаю
	
	; Основной цикл вычисления факториала
	movl	$1, %edx         ; Инициализация счетчика i = 1 (в %edx)
	movl	$1, %eax         ; Инициализация результата = 1 (в %eax)
.L4:
	imulq	%rdx, %rax       ; result *= i (64-битное умножение)
	addq	$1, %rdx         ; i++
	cmpl	%edx, %ecx       ; Сравнение i с n
	jge	.L4              ; Если i <= n, продолжение цикла
.L2:
	ret                     ; Возврат из функции
.L6:
	movl	$1, %eax         ; Возврат 1 для n == 0
	jmp	.L2
	.seh_endproc

	.def	__main;	.scl	2;	.type	32;	.endef  ; Для MinGW (инициализация CRT)

; Строковые константы
	.section .rdata,"dr"
.LC0:
	.ascii "Enter a positive integer: \0"  ; Приглашение ввода
.LC1:
	.ascii "Factorial of \0"              ; Часть выходной строки
.LC2:
	.ascii " is \0"                       ; Часть выходной строки

; Главная функция программы
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB1595:
	pushq	%rbx            ; Сохранение %rbx (будет использоваться)
	.seh_pushreg	%rbx
	subq	$48, %rsp       ; Выделение места в стеке
	.seh_stackalloc	48
	.seh_endprologue
	call	__main          ; Инициализация CRT (для MinGW)

	; Вывод приглашения
	leaq	.LC0(%rip), %rdx  ; Адрес строки приглашения
	movq	.refptr._ZSt4cout(%rip), %rcx  ; cout
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc  ; operator<<

	; Ввод числа
	leaq	44(%rsp), %rdx    ; Адрес переменной number в стеке
	movq	.refptr._ZSt3cin(%rip), %rcx  ; cin
	call	_ZNSirsERi        ; operator>>

	; Вывод "Factorial of "
	movl	$13, %r8d         ; Длина строки
	leaq	.LC1(%rip), %rdx   ; Адрес строки
	movq	.refptr._ZSt4cout(%rip), %rcx  ; cout
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x

	; Вывод введенного числа
	movl	44(%rsp), %edx    ; Загрузка number
	movq	.refptr._ZSt4cout(%rip), %rcx  ; cout
	call	_ZNSolsEi         ; operator<<

	; Вывод " is "
	movq	%rax, %rbx        ; Сохранение cout в %rbx
	movl	$4, %r8d          ; Длина строки
	leaq	.LC2(%rip), %rdx   ; Адрес строки
	movq	%rax, %rcx        ; cout
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x

	; Вычисление и вывод факториала
	movl	44(%rsp), %ecx    ; Загрузка number
	call	_Z9factoriali     ; Вызов factorial(number)
	movq	%rax, %rdx        ; Результат factorial
	movq	%rbx, %rcx        ; cout
	call	_ZNSo9_M_insertIyEERSoT_  ; Вывод unsigned long long

	; Вывод endl
	movq	%rax, %rcx        ; cout
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_

	movl	$0, %eax          ; Возврат 0
	addq	$48, %rsp         ; Освобождение стека
	popq	%rbx             ; Восстановление %rbx
	ret
	.seh_endproc

; Глобальная инициализация
	.def	_GLOBAL__sub_I__Z9factoriali;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I__Z9factoriali
_GLOBAL__sub_I__Z9factoriali:
.LFB2086:
	subq	$40, %rsp       ; Выделение места в стеке
	.seh_stackalloc	40
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx  ; Статический объект инициализации
	call	_ZNSt8ios_base4InitC1Ev  ; Конструктор
	leaq	__tcf_0(%rip), %rcx  ; Деструктор
	call	atexit           ; Регистрация деструктора
	nop
	addq	$40, %rsp       ; Освобождение стека
	ret
	.seh_endproc

	.section	.ctors,"w"    ; Секция конструкторов
	.align 8
	.quad	_GLOBAL__sub_I__Z9factoriali  ; Указатель на функцию инициализации

.lcomm _ZStL8__ioinit,1,1  ; Статический объект для инициализации ввода/вывода

	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"

; Импорт внешних символов
	.def	_ZNSt8ios_base4InitD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc;	.scl	2;	.type	32;	.endef
	.def	_ZNSirsERi;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIyEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	atexit;	.scl	2;	.type	32;	.endef

; Ссылки на стандартные потоки
	.section	.rdata$.refptr._ZSt3cin, "dr"
	.globl	.refptr._ZSt3cin
	.linkonce	discard
.refptr._ZSt3cin:
	.quad	_ZSt3cin         ; Ссылка на cin
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout        ; Ссылка на cout