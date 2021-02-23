section .data										;Data segment
	str1 db 'Enter String 1 : '						;Ask the user to enter a name1
	str1len equ $-str1								;The length of the name1	
	str2 db 'Enter String 2 : '						;Ask the user to enter a name2
	str2len equ $-str2								;The length of the name1
	str3 db 'String are equal',10					;message
	str3len equ $-str3								;message length
	str4 db 'String are not equal',10				;message
	str4len equ $-str4								;message length
	
section .bss										;Uninitialized data
	s1 resb 32
	s2 resb 32
	
section .text										;code segment
	global _start
	
	%macro print 2
		mov rax, 1									;primary accumulator
		mov rdi, 1									;Distination index
		mov rsi, %1									;source index
		mov rdx,%2									;data register
		syscall
	%endmacro

	%macro getstring 1
		mov rax, 0									;primary accumulator
		mov rdi, 0									;Distination index
		mov rsi, %1									;source index
		mov rdx, 32									;data register
		syscall
	%endmacro
		
	_start:
		print str1,str1len							;user input length
		getstring s1
		print str2,str2len							;user input length
		getstring s2
		mov rsi,s1									;source index
		mov rdi,s2									;Distination index
		mov rcx,32									;count register
		repe  cmpsb									;compare string
		jrcxz  _equal
		
		mov rax, 1									;primary accumulator
		mov rdi, 1									;Distination index
		mov rsi, str4								;source index
		mov rdx, str4len							;data register
		syscall

		call exit
		
	_equal:
		mov rax, 1									;primary accumulator
		mov rdi, 1									;Distination index
		mov rsi, str3								;source index
		mov rdx, str3len							;data register
		syscall
		
	exit:
		mov rax, 60									;primary accumulator
		mov rdi, 0									;Distination index
		syscall

	