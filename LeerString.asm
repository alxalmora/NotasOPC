TITLE LeerString
; Irvine Library procedures and functions
INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib
; End Irvine

.DATA
   MAX_SIZE = 31
   input_string BYTE MAX_SIZE +1 DUP (?)
   string_size DWORD ?
.CODE

  main PROC
  MOV EDX, OFFSET input_string
  MOV ECX, MAX_SIZE
  CALL ReadString
  MOV string_size, EAX
   ;Regresa la cadena en input_string con un tamaño
   ;guardado en string_size
   exit
  main ENDP

  LeerCad PROC
    MOV EDX, OFFSET input_string
    MOV ECX, MAX_SIZE
    CALL ReadString
    MOV string_size, EAX
    RET
  LeerCad ENDP
