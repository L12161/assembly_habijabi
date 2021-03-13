;practical exercise 1 prob a
code segment
    assume cs:code ds:code
 MOV AX, 7A24H 
 MOV BX, 95A3H 
 ADD AX, BX 
 JC L3T2 
EEE316: OR AX, 23H 
 JNZ Last 
L3T2: MOV CX, 0FC7H 
 SUB AX,CX 
 JZ EEE316 
 
Last: HLT
end