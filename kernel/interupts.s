bits 64
global __isr0
global __isr1
global __isr2
global __isr3
global __isr4
global __isr5
global __isr6
global __isr7
global __isr8
global __isr9
global __isr10
global __isr11
global __isr12
global __isr13
global __isr14
global __isr15
global __isr16
global __isr17
global __isr18
global __isr19
global __isr20
global __isr21
global __isr22
global __isr23
global __isr24
global __isr25
global __isr26
global __isr27
global __isr28
global __isr29
global __isr30
global __isr31

__isr0:
	cli
	push byte 0
	push byte 0
	jmp common_isr
	
__isr1:
	cli
	push byte 0
	push byte 1
	jmp common_isr
	
__isr2:
	cli
	push byte 0
	push byte 2
	jmp common_isr
	
__isr3:
	cli
	push byte 0
	push byte 3
	jmp common_isr
	
__isr4:
	cli
	push byte 0
	push byte 4
	jmp common_isr
	
__isr5:
	cli
	push byte 0
	push byte 5
	jmp common_isr
	
__isr6:
	cli
	push byte 0
	push byte 6
	jmp common_isr
	
__isr7:
	cli
	push byte 0
	push byte 7
	jmp common_isr
	
__isr8:
	cli
	push byte 8
	jmp common_isr
	
__isr9:
	cli
	push byte 0
	push byte 9
	jmp common_isr
	
__isr10:
	cli
	push byte 10
	jmp common_isr
	
__isr11:
	cli
	push byte 11
	jmp common_isr
	
__isr12:
	cli
	push byte 12
	jmp common_isr
	
__isr13:
	cli
	push byte 13
	jmp common_isr
	
__isr14:
	cli
	push byte 14
	jmp common_isr
	
__isr15:
	cli
	push byte 0
	push byte 15
	jmp common_isr
	
__isr16:
	cli
	push byte 0
	push byte 16
	jmp common_isr
	
__isr17:
	cli
	push byte 0
	push byte 17
	jmp common_isr
	
__isr18:
	cli
	push byte 0
	push byte 18
	jmp common_isr
	
__isr19:
	cli
	push byte 0
	push byte 19
	jmp common_isr
	
__isr20:
	cli
	push byte 0
	push byte 20
	jmp common_isr
	
__isr21:
	cli
	push byte 0
	push byte 21
	jmp common_isr
	
__isr22:
	cli
	push byte 0
	push byte 22
	jmp common_isr
	
__isr23:
	cli
	push byte 0
	push byte 23
	jmp common_isr
	
__isr24:
	cli
	push byte 0
	push byte 24
	jmp common_isr
	
__isr25:
	cli
	push byte 0
	push byte 25
	jmp common_isr
	
__isr26:
	cli
	push byte 0
	push byte 26
	jmp common_isr
	
__isr27:
	cli
	push byte 0
	push byte 27
	jmp common_isr
	
__isr28:
	cli
	push byte 0
	push byte 28
	jmp common_isr
	
__isr29:
	cli
	push byte 0
	push byte 29
	jmp common_isr
	
__isr30:
	cli
	push byte 0
	push byte 30
	jmp common_isr
	
__isr31:
	cli
	push byte 0
	push byte 31
	jmp common_isr
	
extern go.idt.ISR
extern go.proc.KillProc
extern go.video.PrintCurrent
	
common_isr:

	push rax
	mov rax, [rsp+0x20] ; cs
    test rax, 3

    jz .kernel_panic

    swapgs

    mov rdi, -1
    call go.syscall.Syscall

    mov rax, cr3
    mov cr3, rax

    swapgs

    mov ecx, 0xC0000101
	mov rax, go.proc.CurrentID
	mov rax, [rax]
	imul rax, proc.size
	mov rdx, go.proc.Procs
	lea rdx, [rdx + rax]
	mov eax, edx
	shr rdx, 32
	wrmsr

	add rsp, 0x18

    mov rax, [gs:proc.rsp]
	mov [rsp+0x18], rax
	mov rax, [gs:proc.rip]
 	mov [rsp+0x00], rax

 	mov rbx, [gs:proc.rbx]
 	mov rax, [gs:proc.rax]
	
	swapgs

	mov qword [rsp+0x20], 0x23
	;xchg bx,bx
	iretq

.kernel_panic:
	pop rax
	pop rdi
	pop rsi
	pop rdx
	push rdx
	mov rax, qword go.idt.ISR
	call rax       ; A special call, preserves the 'eip' register

	iretq           ; pops 5 things at once: CS, EIP, EFLAGS, SS, and ESP!

global __irq0
global __irq1
global __irq2
global __irq3
global __irq4
global __irq5
global __irq6
global __irq7
global __irq8
global __irq9
global __irq10
global __irq11
global __irq12
global __irq13
global __irq14
global __irq15

__irq0:
	;cli
	push byte 0
	push byte 32
	jmp common_irq
	
__irq1:
	cli
	;xchg bx,bx
	push byte 0
	push byte 33
	jmp common_irq
	
__irq2:
	cli
	push byte 0
	push byte 34
	jmp common_irq
	
__irq3:
	cli
	push byte 0
	push byte 35
	jmp common_irq
	
__irq4:
	cli
	push byte 0
	push byte 36
	jmp common_irq
	
__irq5:
	cli
	push byte 0
	push byte 37
	jmp common_irq
	
__irq6:
	cli
	push byte 0
	push byte 38
	jmp common_irq
	
__irq7:
	cli
	push byte 0
	push byte 39
	jmp common_irq
	
__irq8:
	cli
	push byte 0
	push byte 40
	jmp common_irq
	
__irq9:
	cli
	push byte 0
	push byte 41
	jmp common_irq
	
__irq10:
	cli
	push byte 0
	push byte 42
	jmp common_irq
	
__irq11:
	cli
	push byte 0
	push byte 43
	jmp common_irq
	
__irq12:
	cli
	push byte 0
	push byte 44
	jmp common_irq
	
__irq13:
	cli
	push byte 0
	push byte 45
	jmp common_irq
	
__irq14:
	cli
	push byte 0
	push byte 46
	jmp common_irq
	
__irq15:
	cli
	push byte 0
	push byte 47
	jmp common_irq
	
extern go.idt.IRQ
extern go.syscall.Syscall
extern go.proc.CurrentID
extern go.proc.Procs

%include "../proc.inc"
	
common_irq:
	push rax
	mov rax, [rsp+0x20] ; cs
    test rax, 3
    jz .skip_store

    swapgs

    mov rax, [rsp+0x30]
    mov [gs:proc.rsp], rax ; rsp
    mov rax, [rsp+0x18]
	mov [gs:proc.rip], rax ; rip
	pop rax
	mov [gs:proc.rax], rax
	mov [gs:proc.rbx], rbx

	;swapgs

	mov rax, [rsp]
	cmp rax, 32
	jne .after_store

	push rdi
	xor rdi, rdi
	call go.syscall.Syscall
	;xchg bx,bx
	pop rdi

	mov rax, cr3
	mov cr3, rax

	mov ecx, 0xC0000101
	mov rax, go.proc.CurrentID
	mov rax, [rax]
	imul rax, proc.size
	mov rdx, go.proc.Procs
	lea rdx, [rdx + rax]
	mov eax, edx
	shr rdx, 32
	wrmsr

	;xchg bx,bx
	;swapgs

	jmp .after_store

    .skip_store:

    pop rax

    .after_store:
	pop rdi
	pop rsi
	pop rdx
	push rdx
	push rax

    mov rax, qword go.idt.IRQ
    call rax

    mov rax, [rsp+0x10] ; cs
    test rax, 3
    jz .kernel_ret

    ;xchg bx,bx

    ;mov rax, [gs:proc.id]

    mov rax, [gs:proc.rsp]
	mov [rsp+0x20], rax
	mov rax, [gs:proc.rip]
 	mov [rsp+0x08], rax

 	mov rbx, [gs:proc.rbx]
 	mov rax, [gs:proc.rax]
	
	swapgs

    mov qword [rsp+0x28], 0x23 ; iret complains where sysret doesn't
    ;or qword [rsp+0x10], 1<<9 ; make sure interrupts  are set

    .kernel_ret:
    pop rax

    iretq	; pops 5 things at once: CS, RIP, RFLAGS, SS, and RSP!