org     100h
        mov ch,00
        mov cl,5d
        mov ah,00
        mov al,01
        cmp cl,00
        jz salto1
condic  mul ecx
        loop condic

salto1 mov[0210h],eax

        int 20h