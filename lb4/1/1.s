section .text
extern printf
global main
main:
push rbp
mov rbp, rsp
mov rdi, format_text
mov rsi, cpu_cores
call printf wrt ..plt
mov eax, 1
cpuid
mov rdx, rbx
shr rdx, 16
and rdx, 0xFF
mov rdi, format_numeric
mov rsi, rdx
call printf wrt ..plt
mov eax, 0
pop rbp
retn
section .data
format_numeric: dd `%d\n` ; формат числовой(десятичный)
format_text: dd `%s` ; формат текстовый
cpu_cores: db "Количество ядер процессора: ", 0
