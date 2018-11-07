# Uso de MASM32
## Tipo de datos
| Nombre  |  Descripcion  | Declaracion | Tamaño  | Registro|
|---------|---------------|-------------|---------|---------|
| BYTE    | Guarda un char| BYTE        | 1 BYTE  | AL      |
| Word    | Guarda un int | WORD        | 2 BYTE  | AX      |
| Double Word| Gudarda un long | DWORD  | 4 BYTE  | EAX     |
| S[Type] | Guarda un Type con signo| S[TYPE] |   Mismos que el tipo|
## Manejo de datos con registros
Los registros no saben como estan declaradas las variables o si tienen signo. Asi que para moverlos sin y pasar de Byte a Word o DWORD, o Word a DWORD, usamos
```
MOVSX EAX, var_signed
MOVZX EAX, var_unsigned
```
Recordemos que es muy importante al comparar dos valores, estos deben de ser equivalentes en signo y en tamaño.
## Programación
### Procedimientos hechos en Irvine32
|Procedimiento| Descripcion|
|-------------|------------|
|ClrScr| Limpia la consola y pone el cursor en la esquina superior izquierda|
|CrLf|Hace un enter en la consola|
|DumpMem|Escribe un bloque de memoria en la consola en hexadecimal|
|DumpRegs|Muestra los registros EAX, EBX, ECX, EDX, ESI, EDI, EBP, ESP, EFLAGS y EIP en hexadecimal, tambien muestra las banderas comunes del CPU.|
|Gotoxy|Coloca el cursor en un renglon y columna especifica|
|IsDigit|Pone la ZF = 1 si AL tiene un digito (0-9)|
|ReadChar|Lee un char y lo guarda en AL (no necesita ENTER)|
|ReadDec|Lee un numero entero sin signo de 32-bits |
|ReadHex| Lee un numero en hexadecimal|
|ReadInt| Lee un numero entero con signo de 32-bits|
|ReadString|Lee una cadena con un tamaño maximo predefinido|
|Str_length| Regresa el lenght de una string cargada en EAX|
|WriteChar| Imprime un char en la consola|
|WriteDec|Imprime un entero sin signo de 32 bits en la consola|
|WriteHex|Imprime un entero 32-bit en formato hexadecimal|
|WriteInt|Imprime un entero de 32-bit con signo en la consola|
|WriteString|Imprime una string terminada en null (str BYTE "string",0) en la consola.|
### Header
Lo que lleva cualquier programa para cargar las librerias necesarias.
```
TITLE titulo
INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib
```
### Funciones basicas
#### Condicion if
```
.DATA
  ...
.CODE
  ...
  .IF (condicion)
  [.ELSEIF (condicion) ]
  [.ELSE]
  .ENDIF
```
#### Ciclo WHILE
Usamos el registro ESI como contador (ESI es el int i = 0)
```
.DATA
  ...
.CODE
  ...
  MOV ESI,0
  .WHILE(ESI < N)
    INC ESI
  .ENDW
```
#### Leer una String
Leemos la string y la guardamos en input_string, el tamaño de la string se guarda en string_size.
```
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
   exit
  main ENDP
```
