        org     100h
        section .text
        xor     SI, SI
        xor     ax,ax
        xor     cx,cx
        xor     di,di
        mov cx, len

        call for

        int 20h

        section .data

nums db 0,1,2,3,4,5,6,7,8,9
len equ $-nums

par:
        mov     [0300h+di],DL
        inc     di
        dec     CX
        jmp     for
        

impar:
        mov     [0320h+BP],DL
        inc     BP
        dec     CX
        jmp     for


for:
        mov     AL,[nums+SI]
        mov     DL,[nums+SI]
        mov     BL,2d
        DIV     BL
        inc     SI
        cmp     CX,0d
        je      end
        cmp     AH,0d
        jp      par
        jnp     impar


        loop for
end:
        ret
