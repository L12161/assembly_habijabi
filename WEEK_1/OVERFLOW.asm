CODE SEGMENT 
 ASSUME CS:CODE, DS:CODE 
 
 MOV AX,86B1H
 MOV BX,3F42H
 
 SUB AX,BX
 JO OVERFLOW_HOISE
 JNO OVERFLOW_HOYNAI
 HLT
 
OVERFLOW_HOISE:
 MOV CX,0
 JMP LAST 
OVERFLOW_HOYNAI:
 MOV CX,1  
 JMP LAST

LAST: 
 HLT
CODE ENDS 
 END