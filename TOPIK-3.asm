No [1]

; directive include
%include "asm_io.inc"

segment .data
   ; directive Dx
   msg1 db "Masukkan sebuah angka: ",0
   msg2 db "Anda memasukkan angka: ",0

   
	
segment .bss
   ; directive RESx
   input resw 3 

segment .text
   global _main
   _main:
      ; Routine “setup”
      enter  0, 0
      pusha
        
      ; Program Anda di bawah
      mov eax, msg1
      call print_string
      
      call read_int
      mov [input], eax
      
      mov eax, msg2
      call print_string
      
      mov eax, [input]
      call print_int
      
      
      ; Routine “cleanup”
      popa
      mov    eax, 0
      leave
      ret
      
No [2]

   ; directive include
%include "asm_io.inc"

segment .data
   ; directive Dx   
    msg1 db "Masukkan angka 1: ", 0
    msg2 db "Masukkan angka 2: ", 0
    
    msg3 db "Angka pertama yang Anda masukkan: ", 0
    msg4 db 0AH, "Angka kedua yang Anda masukkan: "
	
segment .bss
   ; directive RESx
   satu resd 1
   dua resd 1

segment .text
   global _main
   _main:
      ; Routine "setup"
      enter  0, 0
      pusha

      ; Program Anda di bawah

	mov eax, msg1
	call print_string
	
	call read_int
	mov [satu], eax
	
	mov eax, msg2
	call print_string
    
	call read_int
	mov [dua], eax
	
	
	mov eax, msg3
	call print_string
	mov eax, [satu]
	call print_int
	
	mov eax, msg4
	call print_string
	mov eax, [dua]
	call print_int
      ; Routine "cleanup"
      popa
      mov    eax, 0
      leave
      ret
