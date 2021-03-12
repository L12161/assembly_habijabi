.MODEL SMALL ;depends on the size of the code
.STACK 100H ; 100h hexadecimal porjonto stack memory
.DATA

.CODE ; ekhane amader kaj shuru
;ekhane code statement
MAIN PROC ; almost like int main
    MOV BH , 4
    MOV BL , 5 
    ;register - data or register-register interaction always
    ; duita integer interaction kokhono hobe na
    ;
    ADD BH,10
    SUB BH,BL; subtract korarjonno
    ;MUL BX,2;kaj kortese na akhono:p
    ;DIV AX,BL
    MAIN ENDP
END MAIN ;kamkha6tam 