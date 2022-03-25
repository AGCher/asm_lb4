%include "syscall.mac"
SECTION .text
GLOBAL _start
_start:
mov eax, 1
cpuid
mov eax, 1<<25
and eax, edx
jz m1
WRITE sse, sse.len
next:
mov eax, 1
cpuid
mov eax, 1<<26
and eax, edx
jz m2
WRITE sse2, sse2.len
next2:
mov eax, 1
cpuid
mov eax, 1<<28
and eax, ecx
jz m3
WRITE sse3, sse3.len
next3:
mov eax, 1
cpuid
mov eax, 1<<0
and eax, ecx
jz m4
WRITE sse4.1, sse4.1.len
next4:
mov eax, 1
cpuid
mov eax, 1<<19
and eax, ecx
jz m5
WRITE sse4.2, sse4.2.len
next5:
mov eax, 1
cpuid
mov eax, 1<<20
and eax, ecx
jz m6
WRITE avx, avx.len
EXIT
m1:
WRITE nosse, nosse.len
jmp next
m2:
WRITE nosse2, nosse2.len
jmp next2
m3:
WRITE nosse3, nosse3.len
jmp next3
m4:
WRITE nosse4.1, nosse4.1.len
jmp next4
m5:
WRITE nosse4.2, nosse4.2.len
jmp next5
m6:
WRITE noavx, noavx.len
EXIT
;======================================================
SECTION .data
sse: DB "SSE присутсвует", 0xA
.len: EQU $ - sse
nosse: DB "SSE отсутсвует", 0xA
.len: EQU $ - nosse
sse2: DB "SSE2 присутсвует", 0xA
.len: EQU $ - sse2
nosse2: DB "SSE2 отсутсвует", 0xA
.len: EQU $ - nosse2
sse3: DB "SSE3 присутсвует", 0xA
.len: EQU $ - sse3
nosse3: DB "SSE3 отсутсвует", 0xA
.len: EQU $ - nosse3
sse4.1: DB "SSE4.1 присутсвует", 0xA
.len: EQU $ - sse4.1
nosse4.1: DB "SSE4.1 отсутсвует", 0xA
.len: EQU $ - nosse4.1
sse4.2: DB "SSE4.2 присутсвует", 0xA
.len: EQU $ - sse4.2
nosse4.2: DB "SSE4.2 отсутсвует", 0xA
.len: EQU $ - nosse4.2
avx: DB "AVX присутсвует", 0xA
.len: EQU $ - avx
noavx: DB "AVX отсутсвует", 0xA
.len: EQU $ - noavx