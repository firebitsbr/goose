section .text
bits 64

global inportb
inportb:
	push rbp
	mov	rbp, rsp
	
	sub	esp, 4
	mov rax, 0
	mov rdx, rdi
	in al, dx
	
	leave
	ret

global outportb
outportb:
	push rbp
	mov	rbp, rsp
	
	mov	rdx, rdi
	mov rax, rsi
	out dx, al
	
	leave
	ret
	
global io_wait
io_wait:
	mov eax, 0
	out 0x80, al
	ret
	

global enable_ints
enable_ints:
	sti
	ret