;practical exercise 1 prob a
code segment
    assume cs:code ds:code
 MOV AX, 7A24H 
 MOV BX, 15A3H 
 SUB AX, BX 
 JMP L3T2 
EEE316: DIV BX 
 JMP Last 
L3T2: MOV CX, 45B1H 
 AND AX, CX 
 TEST AX, BX 
 JMP EEE316 
Last: HLT
code ends
end