org 100h

section .text

        XOR SI,SI

        mov AX,0d
        mov byte[200h],0d
        mov byte[201h],0d
        mov byte[202h],1d
        mov byte[203h],7d
        mov byte[204h],9d
        mov byte[205h],1d
        mov byte[206h],1d
        mov byte[207h],8d
        mov BX,8d
        MOV CX,8d

        jmp sumar

sumar:
        ADD AL,[200h+SI]
        INC SI
        LOOP sumar


        DIV BX
        mov [20Ah],AX

        int 20h