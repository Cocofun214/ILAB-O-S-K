================= Prelab 5 ==============

--- No.1 ----

Intruksi CMP


--- No.2 ---

// mov ax, 5

JG

--- No.3 ----

// Intruksi JO

OF = 1


--- No.4 ----

// mov ax, -42

tidak


--- No.5 ----

// percabangan unconditional

JMP


--- No.6 ----

// SF = OF dalam a>b (a-b>0) jiika

* Jika tidak ada overflow, maka (a-b) adalah bil.positif (yang valid)
* Jika ada overflow, maka (a-b) adalah bil.negatif (yang tidak valid)


--- No.7 ----

// Intruksi JNZ

ZF = 0


--- No.8 ----

// CMP a,b

ZF = 0 dan CF = 1


--- No.1/2 ----

// Intruksi JMP yang benar

* Intruksi JMP hanya bisa lompat ke label dalam prosedur yang dikerjakan
* Intruksi JMP adalah unconditional tranfer instruction


--- No.2/2 ----

// alur instruksi

* Uncontional
* Conditional


--- No.3/2 ----

// Intruksi JNA

JBE


--- No.4/2 ----

// mengenai instruksi CMP

instruksi CMP membandingkan nilai dari dua operand dan men-set register EFLAG berdasarkan hasilnya


--- No.5/2 ----

// Flag-Flag

* ZF
* OF
* SF

--- No.6/2 ----

//instruksi JNG

JLE


--- No.7/2 ----

// JMP digunakan untuk..

Lompat ke suatu llabel kode


--- No.8/2 ----

// 2 instruksi

* Instruksi operand
* instruksi lompat kondisional




==================== ACT 5 ====================

---- 5.1 ------

   ; directive include
%include "asm_io.inc"

segment .data
   ; directive Dx
   inp1 db "Masukkan Nilai 1 (0 s.d 100): ", 0
   inp2 db "Masukkan Nilai 2 (0 s.d 100): ", 0
   lulus db "Anda lulus!", 0
   galulus db "Anda tidak lulus!", 0
   invalid db "Angka yang Anda masukkan tidak dalam 0 s.d 100", 0
	
segment .bss
   ; directive Dx
   a1 RESb 32
   a2 RESb 32

segment .text
   global _main
   _main:
      ; Routine “setup”
      enter  0, 0
      pusha

      ; Program Anda di bawah
      mov   eax, inp1      ; Input pertama
      call  print_string
      call  read_int
      
      cmp   eax, 0         ; compare inpu1
      jl    Invalid

      cmp   eax, 100
      jg    Invalid

      mov   [a1], eax
      jmp   endif

   endif:
      mov   eax, inp2      ; Input kedua
      call  print_string
      call  read_int
      
      cmp   eax, 0         ; compare input2
      jl    Invalid

      cmp   eax, 100
      jg    Invalid

      mov   [a2], eax
      jmp   endif2

   endif2:
      mov   eax, [a1]      
      add   eax, [a2]

      cmp   eax, 150       ; compare lulus / galulus
      jl    GaLulus
      jge   Lulus
      jmp   close

   Lulus:
      mov   eax, lulus
      call  print_string
      jmp   close

   GaLulus:
      mov   eax, galulus
      call  print_string
      jmp   close

   Invalid:
      mov   eax, invalid
      call  print_string
      jmp   close
   
   close:
      ; Routine “cleanup”
      popa
      mov    eax, 0
      leave
      ret
      
      
      
      
 ------------- 5.2 ----------
 
 
    ; directive include
%include "asm_io.inc"

segment .data
   ; directive Dx
   inp db "Masukkan angka (0 s.d 10): ", 0
   error db "Angka yang Anda masukkan tidak diantara 0 s.d 10", 0
	
segment .bss
   ; directive RESx

segment .text
   global _main
   _main:
      ; Routine “setup”
      enter  0, 0
      pusha

      ; Program Anda di bawah
      mov   eax, inp       ; Input
      call  print_string
      call  read_int
         
      cmp   eax, 0         ; compare input
      jl    Invalid

      cmp   eax, 10
      jg    Invalid

      mov   ebx, eax

      cmp ebx, 0
      je satu

   while:
      dec ebx
      cmp ebx, 0
      jle end
      imul eax, ebx
      jmp while

   end:
      call print_int
      jmp close

   satu:
      mov eax, 1
      call print_int
      jmp close

   Invalid:
      mov eax, error
      call print_string
      jmp close

   close:
      ; Routine “cleanup”
      popa
      mov    eax, 0
      leave
      ret
