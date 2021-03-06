; GUARDAR UNA CADENA EN UN VARIABLE Y ESCRIBIRLA EN LA CONSOLA DE MS-DOS
; MAIN
	org 	100h

	section	.text

	; print msg1
	mov 	DX, msg1
	call  	EscribirCadena

	; input frase
	mov 	BP, frase
	call  	LeerCadena

	; print msg2
	call For

	call	EsperarTecla

	int 	20h

	section	.data

msg1    db      "ingrese la contraseña: ", "$"
msg2 	db 	"contr", "$"
msg3    db      "Correcto", "$"
msg4    db      "Incorrecto", "$"
frase 	times 	20  	db	" " 	

; FUNCIONES

; Permite leer un carácter de la entrada estándar con echo
; Parámetros:   AH: 07h         
; Salida:       AL: caracter ASCII leído
EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret


; Leer cadena de texto desde el teclado
; Salida:       SI: longitud de la cadena 		BP: direccion de guardado
LeerCadena:
        xor     SI, SI          ; SI = 0
while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit            ; si AL == EnterKey, saltar a exit
        mov     [BP+SI], AL   	; guardar caracter en memoria
        inc     SI              ; SI++
        jmp     while           ; saltar a while
exit:
	mov 	byte [BP+SI], "$"	; agregar $ al final de la cadena
        ret


; Permite escribir en la salida estándar una cadena de caracteres o string, este
; debe tener como terminación el carácter “$”
; Parámetros:	AH: 09h 	DX: dirección de la celda de memoria inicial de la cadena
EscribirCadena:
	mov 	AH, 09h
	int 	21h
	ret

For:
        mov BL,[frase+SI]
        mov CL,[msg2+SI]
        inc SI
        cmp BL,CL
        JNE diferente
        cmp SI,6d
        JE igual
        ret



diferente:
        xor     DX,DX
        mov 	DX, msg4
	call 	EscribirCadena

igual:
        xor     DX,DX
        mov     DX, msg3
        call    EscribirCadena
