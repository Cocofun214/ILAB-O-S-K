----aritmatika1.asm------

; directive include
%include "asm_io.inc"

segment .data
   ; directive Dx
   msg1 db "Masukkan x: ",0
   msg2 db "Masukkan y: ",0
   msg3 db "x + y = ",0
   msg4 db 0AH,"x - y = "
   
	
segment .bss
   ; directive RESx
   x resd 1
   y resd 1

segment .text
   global _main
   _main:
      ; Routine â€œsetupâ€
      enter  0, 0
      pusha
        
      ; Program Anda di bawah
      mov eax, msg1
      call print_string
      call read_int
      mov [x], eax
      
      mov eax, msg2
      call print_string
      call read_int
      mov [y], eax
      
      mov ebx, [x]
      add ebx, [y]
      mov eax, msg3
      call print_string
      mov eax, ebx
      call print_int
      
      mov ebx, [x]
      sub ebx, [y]
      mov eax, msg4
      call print_string
      mov eax, ebx
      call print_int
      
      ; Routine â€œcleanupâ€
      popa
      mov    eax, 0
      leave
      ret
      
      ================
      
      ------aritmatika2.asm----
      
      
         ; directive include
%include "asm_io.inc"

segment .data
   ; directive Dx
   msg1 db "Masukkan x: ",0
   msg2 db "Masukkan y: ",0
   msg3 db "x * y = ",0
   msg4 db 0AH,"x / y = ",0
   msg5 db 0AH,"Sisa x / y = "
   
	
segment .bss
   ; directive RESx
   x resq 2
   y resq 2
   z resw 2
   
segment .text
   global _main
   _main:
      ; Routine â€œsetupâ€
      enter  0, 0
      pusha
        
      ; Program Anda di bawah
      mov eax, msg1
      call print_string
      call read_int
      mov [x], eax
      
      mov eax, msg2
      call print_string
      call read_int0
      mov [y], eax
      
      mov ebx, [x]
      imul ebx, [y]
      mov eax, msg3
      call print_string
      mov eax, ebx
      call print_int
      
      mov eax, [x]
      cdq
      mov ebx, [y]
      idiv ebx
      mov [z], eax
      mov eax, msg4
      call print_string
      mov eax, [z]
      call print_int
      
      mov eax, msg5
      call print_string
      mov eax, edx
      call print_int
      ; Routine â€œcleanupâ€
      popa
      mov    eax, 0
      leave
      ret
