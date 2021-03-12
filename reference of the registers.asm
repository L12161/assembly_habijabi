.MODEL SMLL
.STACK 100H
.DATA
;jeshob variables declared hocche 
; BH and BL --> 8bit registers , 1BYTE
; BX = BH+BL --> 16 bit register, 1 WORD
; general purpose register AX BX CX DX
; CS - points at the segment containing the current program.
;DS - generally points at segment where variables are defined.
;ES - extra segment register, it's up to a coder to define its usage.
;SS - points at the segment containing the stack.
 NUM DB 100 ; variable_name declared_by value
 NUM2 DB ?  ;default 
 CHAR DB '#'          ;character
 STR DB "hello world" ; string

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS , AX
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN