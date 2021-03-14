.model small 
.stack 100h

.code

main proc 
    mov ax, 3F42H
    mov bx, 86B1H
    sub ax, bx
    
    jo OverFlow
    mov cx, 1
    jmp exit
    
    
    OverFlow:
    mov cx, 0
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main 