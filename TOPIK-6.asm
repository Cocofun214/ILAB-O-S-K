----------  LAB 6 --------------

== to_binary.asm ==

; directive include
%include "asm_io.inc"

segment .data
   ; directive Dx
   prompt          db    	"Masukkan angka (0 s.d 255): ", 0
	
segment .bss
   ; directive RESx

segment .text
    global _main
    _main:
        ; Routine “setup”
        enter  0, 0
        pusha

        ; Program Anda di bawah
        mov eax, prompt
        call print_string
        call read_int
        mov edx, eax
        mov ebx, 10000000b
        mov ecx, 7d
        ; mov edx, 15d

        ; test al, 01h
        ; jz print_0
        ; jnz print_1

        jmp loop_start

        loop_start:
            mov eax, edx
            ; call print_int
            ; call print_nl
            cmp ebx, 000000000b
            je end
            ; shr ebx, 1
            test eax, ebx
            je print_0
            jne print_1
            jmp loop_start
        print_0:
            mov eax, 0d
            call print_int
            jmp end_if
        print_1:
            mov eax, 1d
            call print_int
            jmp end_if
        end_if:
            shr ebx, 1
            jmp loop_start

        end:
            ; Routine “cleanup”
            popa
            mov    eax, 0
            leave
            ret
