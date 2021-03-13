;practical exercise 1 prob a

DATA SEGMENT
NUM1 DW 0Fh
NUM2 DW 4Bh
GCD DW ?
LCM DW ?
data ends

code segment
    assume cs:code ds:code
    MOV AX,DATA
    MOV DS,AX
    MOV AX,NUM1
    MOV BX,NUM2
    
    
COMPARE: CMP AX,BX
    JE ANS
    JB SWAP
    
DIVISION:
    MOV DX,0000h
    DIV BX
    CMP DX,0000h
    JE ANS
    MOV AX,DX
    JMP COMPARE
    
SWAP:
    XCHG AX,BX
    JMP DIVISION
ANS:
    MOV GCD,BX
    MOV AX,NUM1
    MOV BX,NUM2
    MUL BX
    DIV GCD
    MOV LCM,AX
    MOV AH,4CH
    INT 21h
code ends
end