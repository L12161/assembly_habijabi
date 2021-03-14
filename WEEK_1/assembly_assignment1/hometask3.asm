.model small 
.stack 100h

.code
main proc                                                      
    
    mov bx, 1001H       ; moving x to bx 
    mov cx, 0999H       ; moving y to cx
    
    cmp bx, 1000H
    jg label1
    jmp label3 
    
    
    label1:
    cmp cx, 1000H
    jl label2
    jmp label5
    
    
    label2:
    not bx 
    jmp exit
    
    label3:
    cmp cx, 1000H
    jl label4
    jmp exit
    
    label4:
    sub bx, cx
    jmp exit
    
    label5:
    add bx, cx
    jmp exit
    
    exit: 
    mov ah, 4ch 
    int 21h
    main endp

end main 
     
    
    
    



