section .data
	text1 db 'Enter the Name?'							;Ask the user to enter a name
	text1len equ $-text1								;The length of the message
	text2 db 'Hello,'
	text2len equ $-text2
	text3 db 'Welcome to the assembly club',10			;message
	text3len equ $-text3

section .bss											;Uninitialized data
name resb 32

section .text											;code segment
	global _start
	%macro print 2
		mov rax,1										;primary accmulator
		mov rdi,1										;destination index
		mov rsi,%1										;source index
		mov rdx,%2										;data register
		syscall
	%endmacro

	%macro getName 0
		mov rax,0										;primary accmulator
		mov rdi,0										;destination index
		mov rsi,name									;source index
		mov rdx,32										;data register
		syscall
	%endmacro

	_start:
		print text1,text1len
		getName											;user input name
		print text2,text2len
		print name,32									;print name
		print text3,text3len
		mov rax,60										;primary accmulator
		mov rdi,0										;destination index
		syscall
