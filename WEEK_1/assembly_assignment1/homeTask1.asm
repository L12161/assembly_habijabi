.model small 
.stack 100h 
.data 

x db 6
y db 5


; --------------------Finding bigger, equal or less --------------
.code
main proc
    mov ax,@data    ; load everything from data segment
    mov ds,ax       ; moving everything to ds register   
    
    mov bh, x       ; moving x to bh 
    mov bl, y       ; moving t to bl
    
    
    findBig:
    cmp bh, bl       ; comparing
    jg bigger        ; if greater --> go to bigger
    je equal         ; if equal --> go to equal
    jmp less         ; if less --> go to less
    
    
    bigger:
    mov dx, 0
    jmp exit
    
    equal:
    mov dx, 1
    jmp exit
    
    less: 
    mov dx, 2
    jmp exit
    
    exit: 
    mov ah, 4ch 
    int 21h
    main endp

end main 
     