CODE SEGMENT
    ASSUME CS:CODE 
    ASSUME DS:CODE    
    ORG 100h
    
; MULTIPLYING THE LESSER SIGNIFICANT 16BIT VALUES     
    MOV AX,A
    MUL B
    MOV P,AX
    ADC P+2,0h
    
    MOV AX,A+2
    MUL B
    ADD P+2,AX
    ADC P+4,DX
    ADC P+6,0h 
     
; MULTIPLYING THE MORE SIGNIFICANT 16BIT VALUES 
    MOV AX,A
    MUL B+2
    MOV P+2,AX
    ADC P+4,DX
    ADC P+6,0h
    
    MOV AX,A+2
    MUL B+2
    ADD P+4,AX
    ADC P+6,DX    
    HLT
    
; DEFINING THE VARIABLES
    A DW 1606h,3800h
    B DW 4141h,4160h
    P DW 0h,0h,0h,0h         
CODE ENDS
END         


