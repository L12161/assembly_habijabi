;practical exercise 1 prob a
code segment
    assume cs:code ds:code
 MOV AX, 1027H 
 MOV BX, 5A27H 
 MOV CX, 54A5H
 OR AX, BX 
 XOR AX, CX 
 NOT AX 
 TEST CX, BX 
 AND CX, AX 
 HLT
code ends
end