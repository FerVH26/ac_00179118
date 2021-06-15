org 100h
        section .text
        xor ax, ax
        xor si,si
        xor bx,bx
        xor cx,cx
        xor dx,dx

        mov si, 0
        mov di, 0d
        
        mov dh, 10
        mov dl, 20

        call modotexto
        
        iterar1:
                call movercursor
                mov cl, [nombre1+si]
                call escribircaracter
                inc si
                inc di
                inc dl
                cmp di, 8d
                jb iterar1
                xor ah,ah
                xor cx,cx
                xor al, al
                xor di,di
                xor dl, dl
                xor si, si
                mov dl,20
                inc dh
                jmp iterar2
        iterar2:
                call movercursor
                mov cl, [nombre2+si]
                call escribircaracter
                inc si
                inc di
                inc dl
                cmp di, 5d
                jb iterar2
                xor ah,ah
                xor cx,cx
                xor al, al
                xor di,di
                xor dl, dl
                xor si, si
                mov dl,20
                inc dh
                jmp iterar3

        iterar3:
                call movercursor
                mov cl, [nombre3+si]
                call escribircaracter
                inc si
                inc di
                inc dl
                cmp di, 7d
                jb iterar3
                xor ah,ah
                xor cx,cx
                xor al, al
                xor di,di
                xor dl, dl
                xor si, si
                mov dl,20
                inc dh
                jmp iterar4

        iterar4:
                call movercursor
                mov cl, [nombre4+si]
                call escribircaracter
                inc si
                inc di
                inc dl
                cmp di, 9d
                jb iterar4
                xor ah,ah
                xor cx,cx
                xor al, al
                xor di,di
                xor si, si
                xor dl, dl
                mov dl,20
                inc dh
                jmp esperartecla

        movercursor:
                mov ah,02H
                mov bh,0h
                int 10H
                ret
        
        modotexto:
                mov ah,0h
                mov al,03h
                int 10h
                ret

        escribircaracter:
                mov ah,0ah
                mov al, cl
                mov bh,0h
                mov cx, 1h
                int 10h
                ret

        esperartecla:
                mov ah, 00h
                int 16h
        exit:
                int 20h

        section .data
        
        nombre1 DB 'Fernando'
        nombre2 DB 'Josue'
        nombre3 DB 'Vasquez'
        nombre4 DB 'Hernandez'