%include "syscall.mac"
SECTION .text
GLOBAL _start
_start:
mov eax, 7
mov ecx, 0
cpuid
mov eax, 1<<29
and eax, ebx
jz n1
WRITE SHA, SHA.len
next:
mov eax, 1
cpuid
mov eax, 1<<25
and eax, ecx
jz n2
WRITE AES, AES.len
next2:
mov eax, 1
cpuid
mov eax, 1<<30
and eax, ecx
jz n3
WRITE RANDOM, RANDOM.len
EXIT
n1: 
WRITE SHA_NO, SHA_NO.len
jmp next
n2:
WRITE AES_NO, AES_NO.len
jmp next2
n3:
WRITE RANDOM_NO, RANDOM_NO.len
EXIT
SECTION .data
SHA: db "SHA присутсвует", 0xA
.len: equ $ - SHA
SHA_NO: db "SHA отсутствует", 0xA
.len: equ $ - SHA_NO
AES: db "AES присутсвует", 0xA
.len: equ $ - AES
AES_NO: db "AES отсутствует", 0xA
.len: equ $ - AES_NO
RANDOM: db "RANDOM присутсвует", 0xA
.len: equ $ - RANDOM
RANDOM_NO: db "RANDOM отсутствует", 0xA
.len: equ $ - RANDOM_NO
