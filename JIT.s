; method std.kernel#Runtime.nativeExit

; starting save state
push rbp
mov rbp, rsp
push r12
push r13
push r14
push r15
push r8
push r9
sub rsp, 160
mov qword [rbp-56], rcx
xor r12, r12
xor r13, r13
mov qword [rbp-72], 0
mov qword [rbp-64], 0
mov qword [rbp-80], 0
mov r14, qword [rcx+8]
mov r15, qword [rcx]
mov rcx, qword [rcx+16]
mov rcx, qword [rcx]
mov qword [rbp-64], rcx
mov rcx, qword [rcx]
test rcx, rcx
jne code_start
jmp init_addr_tbl
code_start:
; instr 0
L0:
mov ecx, 169
call 4566704
lea r12, [L7]
mov r13, 0
mov rcx, r15
mov ecx, qword [rcx+80]
cmp ecx, 0
jne .thread_check
L7:
movzx ecx, [5832448]
cmp ecx, 0
je L8
mov r13, 0
jmp func_end
L8:
nop
; instr 1
L1:
mov r13, 1
cmp r13, -1
je L9
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L9:
mov r13, 0
jmp func_end
nop
mov r13, 1
cmp r13, -1
je L10
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L10:
mov r13, 0
jmp func_end
init_addr_tbl:
nop
; setting label values
mov rax, qword [rbp-64]
lea rcx, [L0]
mov qword [rax], rcx
add rax, 8
lea rcx, [L1]
mov qword [rax], rcx
nop
jmp code_start
func_end:
mov rcx, r15
call 4330096
mov rcx, r15
mov rdx, qword [rcx+72]
lea rdx, [rdx+8]
mov qword [rcx+72], rdx
add rsp, 160
pop r9
pop r8
pop r15
pop r14
pop r13
pop r12
pop rbp
ret
.thread_check:
mov rcx, r15
mov eax, qword [rcx+80]
sar eax, 2
and eax, 1
test eax, eax
je L11
call 4235712
L11:
mov rcx, r15
mov eax, qword [rcx+136]
cmp eax, 3
jne L12
short jmp func_end
L12:
mov rcx, r15
mov eax, qword [rcx+80]
sar eax, 1
and eax, 1
test eax, eax
je L13
cmp r13, -1
je L15
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L15:
mov r13, 0
mov rcx, qword [rcx+32]
call 4563280
cmp rax, 1
je L14
jmp func_end
L14:
mov rcx, r15
call 4563168
mov rdx, qword [rbp-64]
imul rax, 8
add rdx, rax
mov r12, [rdx]
jmp r12
L13:
jmp r12
nop
nop
nop
align 64
.data:
; data section start
[rcx], xmm0
nop
lea r12, [L12]
mov r13, 12
mov rcx, r15
mov ecx, qword [rcx+80]
cmp ecx, 0
jne .thread_check
; instr 12
L12:
mov rcx, r14
add rcx, 16
movsd xmm0, qword [rcx]
cvttsd2si rax, xmm0
cmp rax, 0
jne L88
mov rcx, r14
movsd xmm0, qword [rcx]
cvttsd2si rdx, xmm0
mov rax, qword [rbp-64]
cmp rdx, 0
je L89
imul rdx, 8
add rax, rdx
L89:
mov rax, [rax]
jmp rax
L88:
nop
; instr 13
L13:
L14:
movsd xmm0, [L86]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 15
L15:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r15
add qword [rcx+16], 16
mov rdx, qword [rcx+16]
movsd qword [rdx], xmm0
mov rcx, r15
mov rdx, qword [rcx+16]
mov rax, qword [rcx+8]
mov r12, qword [rcx+56]
sub rdx, rax
sar rdx, 4
add rdx, 1
cmp rdx, r12
jb L90
mov r13, 15
cmp r13, -1
je L91
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L91:
mov r13, 0
call 4568240
mov r13, -1
jmp .thread_check
L90:
nop
; instr 16
L16:
mov rcx, r15
mov rcx, qword [rcx+24]
add rcx, 16
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 17
L17:
mov rcx, r15
mov rax, qword [rcx+16]
sub qword [rcx+16], 16
mov rcx, rax
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 72
movsd qword [rcx], xmm0
nop
; instr 18
L18:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 72
movsd xmm1, qword [rcx]
addsd xmm0, xmm1
L19:
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 20
L20:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r15
add qword [rcx+16], 16
mov rdx, qword [rcx+16]
movsd qword [rdx], xmm0
mov rcx, r15
mov rdx, qword [rcx+16]
mov rax, qword [rcx+8]
mov r12, qword [rcx+56]
sub rdx, rax
sar rdx, 4
add rdx, 1
cmp rdx, r12
jb L92
mov r13, 20
cmp r13, -1
je L93
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L93:
mov r13, 0
call 4568240
mov r13, -1
jmp .thread_check
L92:
nop
; instr 21
L21:
mov rcx, r15
mov rax, qword [rcx+16]
sub qword [rcx+16], 16
mov rcx, rax
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 22
L22:
mov rcx, r15
mov rcx, qword [rcx+24]
add rcx, 32
mov rax, rcx
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, rax
movsd qword [rcx], xmm0
nop
lea r12, [L23]
mov r13, 23
mov rcx, r15
mov ecx, qword [rcx+80]
cmp ecx, 0
jne .thread_check
; instr 23
L23:
jmp L73
nop
; instr 24
L24:
mov rcx, r15
mov rcx, qword [rcx+24]
add rcx, 16
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 25
L25:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r15
add qword [rcx+16], 16
mov rdx, qword [rcx+16]
movsd qword [rdx], xmm0
mov rcx, r15
mov rdx, qword [rcx+16]
mov rax, qword [rcx+8]
mov r12, qword [rcx+56]
sub rdx, rax
sar rdx, 4
add rdx, 1
cmp rdx, r12
jb L94
mov r13, 25
cmp r13, -1
je L95
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L95:
mov r13, 0
call 4568240
mov r13, -1
jmp .thread_check
L94:
nop
; instr 26
L26:
L27:
pxor xmm0, xmm0
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 28
L28:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 72
movsd qword [rcx], xmm0
nop
; instr 29
L29:
mov rcx, r15
mov rax, qword [rcx+16]
sub qword [rcx+16], 16
mov rcx, rax
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 30
L30:
mov rcx, r14
add rcx, 24
movsd xmm1, qword [rcx]
mov rcx, r14
add rcx, 72
movsd xmm0, qword [rcx]
ucomisd xmm0, xmm1
jp L96
jne L96
movsd xmm0, [L86]
jmp L97
L96:
pxor xmm0, xmm0
L97:
mov rcx, r14
add rcx, 16
movsd qword [rcx], xmm0
nop
; instr 31
L31:
mov rcx, r14
add rcx, 16
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 32
L32:
L33:
movsd xmm0, [L98]
mov rcx, r14
movsd qword [rcx], xmm0
nop
lea r12, [L34]
mov r13, 34
mov rcx, r15
mov ecx, qword [rcx+80]
cmp ecx, 0
jne .thread_check
; instr 34
L34:
mov rcx, r14
add rcx, 16
movsd xmm0, qword [rcx]
cvttsd2si rax, xmm0
cmp rax, 0
jne L99
mov rcx, r14
movsd xmm0, qword [rcx]
cvttsd2si rdx, xmm0
mov rax, qword [rbp-64]
cmp rdx, 0
je L100
imul rdx, 8
add rax, rdx
L100:
mov rax, [rax]
jmp rax
L99:
nop
; instr 35
L35:
L36:
movsd xmm0, [L86]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 37
L37:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r15
add qword [rcx+16], 16
mov rdx, qword [rcx+16]
movsd qword [rdx], xmm0
mov rcx, r15
mov rdx, qword [rcx+16]
mov rax, qword [rcx+8]
mov r12, qword [rcx+56]
sub rdx, rax
sar rdx, 4
add rdx, 1
cmp rdx, r12
jb L101
mov r13, 37
cmp r13, -1
je L102
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L102:
mov r13, 0
call 4568240
mov r13, -1
jmp .thread_check
L101:
nop
; instr 38
L38:
mov rcx, r15
mov rcx, qword [rcx+24]
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 39
L39:
mov rcx, r15
mov rax, qword [rcx+16]
sub qword [rcx+16], 16
mov rcx, rax
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 72
movsd qword [rcx], xmm0
nop
; instr 40
L40:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 72
movsd xmm1, qword [rcx]
subsd xmm0, xmm1
L41:
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 42
L42:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r15
add qword [rcx+16], 16
mov rdx, qword [rcx+16]
movsd qword [rdx], xmm0
mov rcx, r15
mov rdx, qword [rcx+16]
mov rax, qword [rcx+8]
mov r12, qword [rcx+56]
sub rdx, rax
sar rdx, 4
add rdx, 1
cmp rdx, r12
jb L103
mov r13, 42
cmp r13, -1
je L104
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L104:
mov r13, 0
call 4568240
mov r13, -1
jmp .thread_check
L103:
nop
; instr 43
L43:
L44:
movsd xmm0, [L86]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 45
L45:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r15
add qword [rcx+16], 16
mov rdx, qword [rcx+16]
movsd qword [rdx], xmm0
mov rcx, r15
mov rdx, qword [rcx+16]
mov rax, qword [rcx+8]
mov r12, qword [rcx+56]
sub rdx, rax
sar rdx, 4
add rdx, 1
cmp rdx, r12
jb L105
mov r13, 45
cmp r13, -1
je L106
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L106:
mov r13, 0
call 4568240
mov r13, -1
jmp .thread_check
L105:
nop
; instr 46
L46:
mov r13, 46
cmp r13, -1
je L107
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L107:
mov r13, 0
mov rcx, r15
mov rdx, 8
call 4567792
cmp rax, 0
je L108
mov rcx, qword [rbp-56]
call rax
L108:
lea r12, [L46]
mov r13, 46
mov rcx, r15
mov ecx, qword [rcx+80]
cmp ecx, 0
jne .thread_check
nop
; instr 47
L47:
mov rcx, r15
mov rax, qword [rcx+16]
sub qword [rcx+16], 16
mov rcx, rax
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 48
L48:
mov rcx, r15
mov rcx, qword [rcx+24]
add rcx, 32
mov rax, rcx
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, rax
movsd qword [rcx], xmm0
nop
lea r12, [L49]
mov r13, 49
mov rcx, r15
mov ecx, qword [rcx+80]
cmp ecx, 0
jne .thread_check
; instr 49
L49:
jmp L73
nop
; instr 50
L50:
L51:
movsd xmm0, [L86]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 52
L52:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r15
add qword [rcx+16], 16
mov rdx, qword [rcx+16]
movsd qword [rdx], xmm0
mov rcx, r15
mov rdx, qword [rcx+16]
mov rax, qword [rcx+8]
mov r12, qword [rcx+56]
sub rdx, rax
sar rdx, 4
add rdx, 1
cmp rdx, r12
jb L109
mov r13, 52
cmp r13, -1
je L110
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L110:
mov r13, 0
call 4568240
mov r13, -1
jmp .thread_check
L109:
nop
; instr 53
L53:
mov rcx, r15
mov rcx, qword [rcx+24]
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 54
L54:
mov rcx, r15
mov rax, qword [rcx+16]
sub qword [rcx+16], 16
mov rcx, rax
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 72
movsd qword [rcx], xmm0
nop
; instr 55
L55:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 72
movsd xmm1, qword [rcx]
subsd xmm0, xmm1
L56:
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 57
L57:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r15
add qword [rcx+16], 16
mov rdx, qword [rcx+16]
movsd qword [rdx], xmm0
mov rcx, r15
mov rdx, qword [rcx+16]
mov rax, qword [rcx+8]
mov r12, qword [rcx+56]
sub rdx, rax
sar rdx, 4
add rdx, 1
cmp rdx, r12
jb L111
mov r13, 57
cmp r13, -1
je L112
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L112:
mov r13, 0
call 4568240
mov r13, -1
jmp .thread_check
L111:
nop
; instr 58
L58:
mov rcx, r15
mov rcx, qword [rcx+24]
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 59
L59:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r15
add qword [rcx+16], 16
mov rdx, qword [rcx+16]
movsd qword [rdx], xmm0
mov rcx, r15
mov rdx, qword [rcx+16]
mov rax, qword [rcx+8]
mov r12, qword [rcx+56]
sub rdx, rax
sar rdx, 4
add rdx, 1
cmp rdx, r12
jb L113
mov r13, 59
cmp r13, -1
je L114
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L114:
mov r13, 0
call 4568240
mov r13, -1
jmp .thread_check
L113:
nop
; instr 60
L60:
L61:
movsd xmm0, [L86]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 62
L62:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r15
add qword [rcx+16], 16
mov rdx, qword [rcx+16]
movsd qword [rdx], xmm0
mov rcx, r15
mov rdx, qword [rcx+16]
mov rax, qword [rcx+8]
mov r12, qword [rcx+56]
sub rdx, rax
sar rdx, 4
add rdx, 1
cmp rdx, r12
jb L115
mov r13, 62
cmp r13, -1
je L116
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L116:
mov r13, 0
call 4568240
mov r13, -1
jmp .thread_check
L115:
nop
; instr 63
L63:
mov rcx, r15
mov rcx, qword [rcx+24]
add rcx, 16
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 64
L64:
mov rcx, r15
mov rax, qword [rcx+16]
sub qword [rcx+16], 16
mov rcx, rax
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 72
movsd qword [rcx], xmm0
nop
; instr 65
L65:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r14
add rcx, 72
movsd xmm1, qword [rcx]
subsd xmm0, xmm1
L66:
mov rcx, r14
add rcx, 24
movsd qword [rcx], xmm0
nop
; instr 67
L67:
mov rcx, r14
add rcx, 24
movsd xmm0, qword [rcx]
mov rcx, r15
add qword [rcxd rax, 8
lea rcx, [L8]
mov qword [rax], rcx
add rax, 8
lea rcx, [L9]
mov qword [rax], rcx
add rax, 8
lea rcx, [L10]
mov qword [rax], rcx
add rax, 8
lea rcx, [L11]
mov qword [rax], rcx
add rax, 8
lea rcx, [L12]
mov qword [rax], rcx
add rax, 8
lea rcx, [L13]
mov qword [rax], rcx
add rax, 8
lea rcx, [L14]
mov qword [rax], rcx
add rax, 8
lea rcx, [L15]
mov qword [rax], rcx
add rax, 8
lea rcx, [L16]
mov qword [rax], rcx
add rax, 8
lea rcx, [L17]
mov qword [rax], rcx
add rax, 8
lea rcx, [L18]
mov qword [rax], rcx
add rax, 8
lea rcx, [L19]
mov qword [rax], rcx
add rax, 8
lea rcx, [L20]
mov qword [rax], rcx
add rax, 8
lea rcx, [L21]
mov qword [rax], rcx
add rax, 8
lea rcx, [L22]
mov qword [rax], rcx
add rax, 8
lea rcx, [L23]
mov qword [rax], rcx
add rax, 8
lea rcx, [L24]
mov qword [rax], rcx
add rax, 8
lea rcx, [L25]
mov qword [rax], rcx
add rax, 8
lea rcx, [L26]
mov qword [rax], rcx
add rax, 8
lea rcx, [L27]
mov qword [rax], rcx
add rax, 8
lea rcx, [L28]
mov qword [rax], rcx
add rax, 8
lea rcx, [L29]
mov qword [rax], rcx
add rax, 8
lea rcx, [L30]
mov qword [rax], rcx
add rax, 8
lea rcx, [L31]
mov qword [rax], rcx
add rax, 8
lea rcx, [L32]
mov qword [rax], rcx
add rax, 8
lea rcx, [L33]
mov qword [rax], rcx
add rax, 8
lea rcx, [L34]
mov qword [rax], rcx
add rax, 8
lea rcx, [L35]
mov qword [rax], rcx
add rax, 8
lea rcx, [L36]
mov qword [rax], rcx
add rax, 8
lea rcx, [L37]
mov qword [rax], rcx
add rax, 8
lea rcx, [L38]
mov qword [rax], rcx
add rax, 8
lea rcx, [L39]
mov qword [rax], rcx
add rax, 8
lea rcx, [L40]
mov qword [rax], rcx
add rax, 8
lea rcx, [L41]
mov qword [rax], rcx
add rax, 8
lea rcx, [L42]
mov qword [rax], rcx
add rax, 8
lea rcx, [L43]
mov qword [rax], rcx
add rax, 8
lea rcx, [L44]
mov qword [rax], rcx
add rax, 8
lea rcx, [L45]
mov qword [rax], rcx
add rax, 8
lea rcx, [L46]
mov qword [rax], rcx
add rax, 8
lea rcx, [L47]
mov qword [rax], rcx
add rax, 8
lea rcx, [L48]
mov qword [rax], rcx
add rax, 8
lea rcx, [L49]
mov qword [rax], rcx
add rax, 8
lea rcx, [L50]
mov qword [rax], rcx
add rax, 8
lea rcx, [L51]
mov qword [rax], rcx
add rax, 8
lea rcx, [L52]
mov qword [rax], rcx
add rax, 8
lea rcx, [L53]
mov qword [rax], rcx
add rax, 8
lea rcx, [L54]
mov qword [rax], rcx
add rax, 8
lea rcx, [L55]
mov qword [rax], rcx
nop
jmp code_start
func_end:
mov rcx, r15
call 4330096
mov rcx, r15
mov rdx, qword [rcx+72]
lea rdx, [rdx+8]
mov qword [rcx+72], rdx
add rsp, 160
pop r9
pop r8
pop r15
pop r14
pop r13
pop r12
pop rbp
ret
.thread_check:
mov rcx, r15
mov eax, qword [rcx+80]
sar eax, 2
and eax, 1
test eax, eax
je L107
call 4235712
L107:
mov rcx, r15
mov eax, qword [rcx+136]
cmp eax, 3
jne L108
short jmp func_end
L108:
mov rcx, r15
mov eax, qword [rcx+80]
sar eax, 1
and eax, 1
test eax, eax
je L109
cmp r13, -1
je L111
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L111:
mov r13, 0
mov rcx, qword [rcx+32]
call 4563280
cmp rax, 1
je L110
jmp func_end
L110:
mov rcx, r15
call 4563168
mov rdx, qword [rbp-64]
imul rax, 8
add rdx, rax
mov r12, [rdx]
jmp r12
L109:
jmp r12
nop
nop
nop
align 64
.data:
; data section start
L61:
db 0000000000001840
L64:
db 000000000000F03F
L65:
db 0000000000004A40
L70:
db 0000000000804740
], rcx
add rax, 8
lea rcx, [L23]
mov qword [rax], rcx
add rax, 8
lea rcx, [L24]
mov qword [rax], rcx
add rax, 8
lea rcx, [L25]
mov qword [rax], rcx
add rax, 8
lea rcx, [L26]
mov qword [rax], rcx
add rax, 8
lea rcx, [L27]
mov qword [rax], rcx
add rax, 8
lea rcx, [L28]
mov qword [rax], rcx
add rax, 8
lea rcx, [L29]
mov qword [rax], rcx
add rax, 8
lea rcx, [L30]
mov qword [rax], rcx
add rax, 8
lea rcx, [L31]
mov qword [rax], rcx
add rax, 8
lea rcx, [L32]
mov qword [rax], rcx
add rax, 8
lea rcx, [L33]
mov qword [rax], rcx
add rax, 8
lea rcx, [L34]
mov qword [rax], rcx
add rax, 8
lea rcx, [L35]
mov qword [rax], rcx
add rax, 8
lea rcx, [L36]
mov qword [rax], rcx
add rax, 8
lea rcx, [L37]
mov qword [rax], rcx
add rax, 8
lea rcx, [L38]
mov qword [rax], rcx
add rax, 8
lea rcx, [L39]
mov qword [rax], rcx
add rax, 8
lea rcx, [L40]
mov qword [rax], rcx
add rax, 8
lea rcx, [L41]
mov qword [rax], rcx
add rax, 8
lea rcx, [L42]
mov qword [rax], rcx
add rax, 8
lea rcx, [L43]
mov qword [rax], rcx
add rax, 8
lea rcx, [L44]
mov qword [rax], rcx
add rax, 8
lea rcx, [L45]
mov qword [rax], rcx
add rax, 8
lea rcx, [L46]
mov qword [rax], rcx
add rax, 8
lea rcx, [L47]
mov qword [rax], rcx
add rax, 8
lea rcx, [L48]
mov qword [rax], rcx
add rax, 8
lea rcx, [L49]
mov qword [rax], rcx
add rax, 8
lea rcx, [L50]
mov qword [rax], rcx
add rax, 8
lea rcx, [L51]
mov qword [rax], rcx
add rax, 8
lea rcx, [L52]
mov qword [rax], rcx
add rax, 8
lea rcx, [L53]
mov qword [rax], rcx
add rax, 8
lea rcx, [L54]
mov qword [rax], rcx
add rax, 8
lea rcx, [L55]
mov qword [rax], rcx
add rax, 8
lea rcx, [L56]
mov qword [rax], rcx
add rax, 8
lea rcx, [L57]
mov qword [rax], rcx
add rax, 8
lea rcx, [L58]
mov qword [rax], rcx
add rax, 8
lea rcx, [L59]
mov qword [rax], rcx
add rax, 8
lea rcx, [L60]
mov qword [rax], rcx
add rax, 8
lea rcx, [L61]
mov qword [rax], rcx
add rax, 8
lea rcx, [L62]
mov qword [rax], rcx
add rax, 8
lea rcx, [L63]
mov qword [rax], rcx
add rax, 8
lea rcx, [L64]
mov qword [rax], rcx
add rax, 8
lea rcx, [L65]
mov qword [rax], rcx
add rax, 8
lea rcx, [L66]
mov qword [rax], rcx
add rax, 8
lea rcx, [L67]
mov qword [rax], rcx
add rax, 8
lea rcx, [L68]
mov qword [rax], rcx
add rax, 8
lea rcx, [L69]
mov qword [rax], rcx
add rax, 8
lea rcx, [L70]
mov qword [rax], rcx
add rax, 8
lea rcx, [L71]
mov qword [rax], rcx
add rax, 8
lea rcx, [L72]
mov qword [rax], rcx
add rax, 8
lea rcx, [L73]
mov qword [rax], rcx
add rax, 8
lea rcx, [L74]
mov qword [rax], rcx
add rax, 8
lea rcx, [L75]
mov qword [rax], rcx
add rax, 8
lea rcx, [L76]
mov qword [rax], rcx
nop
jmp code_start
func_end:
mov rcx, r15
call 4330096
mov rcx, r15
mov rdx, qword [rcx+72]
lea rdx, [rdx+8]
mov qword [rcx+72], rdx
add rsp, 160
pop r9
pop r8
pop r15
pop r14
pop r13
pop r12
pop rbp
ret
.thread_check:
mov rcx, r15
mov eax, qword [rcx+80]
sar eax, 2
and eax, 1
test eax, eax
je L125
call 4235712
L125:
mov rcx, r15
mov eax, qword [rcx+136]
cmp eax, 3
jne L126
short jmp func_end
L126:
mov rcx, r15
mov eax, qword [rcx+80]
sar eax, 1
and eax, 1
test eax, eax
je L127
cmp r13, -1
je L129
mov rcx, r15
mov rax, qword [rcx+64]
imul r13, 8
add rax, r13
mov qword [rcx+72], rax
L129:
mov r13, 0
mov rcx, qword [rcx+32]
call 4563280
cmp rax, 1
je L128
jmp func_end
L128:
mov rcx, r15
call 4563168
mov rdx, qword [rbp-64]
imul rax, 8
add rdx, rax
mov r12, [rdx]
jmp r12
L127:
jmp r12
nop
nop
nop
align 64
.data:
; data section start
L86:
db 000000000000F03F
L87:
db 0000000000003840
L98:
db 0000000000004940
