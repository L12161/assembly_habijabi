CODE SEGMENT

ASSUME CS:CODE, DS:CODE

MOV AX,CS ; these two lines are here to ensure DS=CS. Remember, MOV DS,CS is illegal

MOV DS,AX ; you may ignore these line in EMU. But they are necessary in Hardware



MOV AX, YEAR

MOV DX,0 ; be careful to put 0 in DX before you use DIV in case of 16 bit operand

; As DX:AX is dividend, if there is garbage value in DX, you’ll get ; specious result
;WRITE YOUR CODE HERE
    MOV BX,4d
    DIV BX     ;IF LEAP YEAR, REMAINDER DX =0
    CMP DX,0d
    JNE NOT_LEAP_YEAR
    
    ;DIVISIBILITY BY 100
    MOV AX, YEAR    
    MOV DX,0d
    MOV BX,100D    
    
    DIV BX
    CMP DX,0D
    JNE LEAP_YEAR
    
    MOV AX, YEAR    
    MOV DX,0d
    MOV BX,400D    
    ;DIVISIBILITY BY 400
    DIV BX
    CMP DX,0D
    JE LEAP_YEAR
    JNE NOT_LEAP_YEAR     
    
LEAP_YEAR:
    MOV LEAPYEAR,1
    HLT
   
NOT_LEAP_YEAR:
    MOV LEAPYEAR,0
    HLT 


HLT



YEAR DW 2000D

LEAPYEAR DB ?

CODE ENDS

END