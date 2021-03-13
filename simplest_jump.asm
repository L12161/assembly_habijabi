;practical exercise 1 prob a
code segment
    assume cs:code ds:code
 MOV AX, 3254H 
 MOV BX, 1F4BH 
 MOV CX, 412AH 
 ADD AX, CX 
 JMP L3T2 
 SUB AX, BX 
 
L3T2: 
 AND AX, BX 
 HLT
code ends
end