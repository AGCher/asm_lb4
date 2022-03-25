%include "syscall.mac"
SECTION .text
GLOBAL _start
_start:
mov eax, 7
mov ecx, 0
cpuid
mov eax, 1<<3
and eax, ebx
jz m1
WRITE bmi1, bmi1.len
next:
mov eax, 7
mov ecx, 0
cpuid
mov eax, 1<<8
and eax, ebx
jz m2
WRITE bmi2, bmi2.len
next2:
mov eax, 7
mov ecx, 0
cpuid
mov eax, 1<<19
and eax, ebx
jz m3
WRITE adx, adx.len
EXIT
m1:
WRITE nobmi1, nobmi1.len
jmp next
m2:
WRITE nobmi2, nobmi2.len
jmp next2
m3:
WRITE noadx, noadx.len
EXIT
;======================================================
SECTION .data
bmi1: DB "BMI1 присутсвует", 0xA
.len: EQU $ - bmi1
nobmi1: DB "BMI1 отсутсвует", 0xA
.len: EQU $ - nobmi1
bmi2: DB "BMI2 присутсвует", 0xA
.len: EQU $ - bmi2
nobmi2: DB "BMI2 отсутсвует", 0xA
.len: EQU $ - nobmi2
adx: DB "ADX присутсвует", 0xA
.len: EQU $ - adx
noadx: DB "ADX отсутсвует", 0xA
.len: EQU $ - noadx