        org     100
        section .text
        mov byte[200h],"F"
        mov byte[201h],"J"
        mov byte[202h],"V"
        mov byte[203h],"H"

;direccionamiento directo
        mov AL, [200h]
;direccionamiento indirecto por registro
        mov BL, [201h]
        mov CL, BL
;direccionamiento indirecto base mas indice
        mov BX, 200h
        mov SI, 002h
        mov DL,[BX+SI]
;direccionamiento por direccionamiento relativo por registro
        mov DI,[BX+003h]

        int 20h

