; OBSERVE EFFECT OF MUL AND DIV ON FLAGS

CODE SEGMENT
    ASSUME CS:CODE
    

    
; MULTIPLICATION IN WORD FORMAT
    MOV AX,23h
    MOV BX,25h
    XOR DX,DX
    MUL BX
; AT THIS POINT WE CHECK THE  FLAGS
    MOV AX,0FFFEh ;65534
    MOV BX,0FF06h ;65286
    MOV DX,0
    DIV BX
; AT THIS POINT WE CHECK THE  FLAGS   
; MULTIPLICATION IN BYTE FORM
   MOV AL,9h
   MOV BL,5h
   XOR AH,AH
   MUL BL
; AT THIS POINT WE CHECK THE  FLAGS
   MOV AL,0FFh ;255
   MOV BL,0A6h ;160
   XOR AH,AH
   MUL BL
      

;DIVISION IN WORD FORMAT
   MOV DX,0FFF4h ;65524
   MOV AX,0FFA4h ;65444
   MOV CX,0FFh   ;255
;DIVISION IN BYTE FORMAT
   MOV AX,0FAh ;250
   DIV A 
; CHECK FLAGS
   HLT
   
   
   ORG 50h
   A DB 0Fh
          
  
CODE ENDS
END