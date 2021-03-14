.MODEL SMALL          ;depends on the size of the code
.STACK 100H           ; 100h hexadecimal  stack memory
.DATA

.CODE 
MAIN PROC             ; almost like int main
    MOV AX,3H
    CMP AX,5H
    je EQUAL_TO_5     ;dx WILL BE 1
    jg GREATER_THAN_5 ;dx WILL BE 0
    jmp LESS_THAN_5   ;dx WILL BE 2
    
LESS_THAN_5:
    MOV DX,2H
    JMP LAST
EQUAL_TO_5:
    MOV DX,1H
    JMP LAST
GREATER_THAN_5:
    MOV DX,0H
    JMP LAST
LAST:
    HLT   
    
    MAIN ENDP
END MAIN ;