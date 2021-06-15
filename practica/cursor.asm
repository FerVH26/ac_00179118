        org 100h

        section .text
        ;limpiamos ax
        xor ax,ax
        ;limpiamos cx
        xor cx,cx

        ;asignamos el tamaño
        mov ah, 02H
        ;asignamos la linea inicial de rastreo
        mov ch, 00h
        ;asignamos la linea final de rastreo
        mov cl, 0FH

        ;llamamos rutina del bios
        int 10H

        ;finalizamos el programa
        int 20h
