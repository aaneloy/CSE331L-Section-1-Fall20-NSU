
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.STACK 100H
.DATA
PROMPT_1 DB '/Enter the First digit : $\'
PROMPT_2 DB '/Enter the Second digit : $\'
PROMPT_3 DB '/LCM  : $\'
VALUE_1 DW ?
VALUE_2 DW ?
.CODE
MAIN PROC
MOV AX, @DATA ; 
MOV DS, AX
LEA DX, PROMPT_1 
MOV AH, 9
INT 21H
MOV AH, 1 
INT 21H
SUB AL, 30H
MOV PROMT_1,AL
MOV AH, 2 
MOV DL, 0DH
INT 21H
MOV DL, 0AH 
INT 21H
LEA DX, PROMPT_2 

MOV AH, 9
INT 21H
MOV AH, 1 
INT 21H
SUB AL, 30H 
MOV PROMT_2,AL
MOV AH, 2 
MOV DL, 0DH
INT 21H
MOV DL, 0AH 
INT 21H
LEA DX, PROMPT_3 
MOV AH, 9
INT 21H    


     
  
  CMP AL,BL
  JB ANS
  
  
ANS:
MOV AX,@DATA
MOV DS,AX
MOV AX,VALUE_1
MOV BX,VALUE_2
WHILE:MOV DX,0
MOV CX,BX
DIV BX
MOV BX,DX
MOV AX,CX
CMP BX,0
JNE WHILE


MUL BX
DIV CX
MOV LCM,AX
MOV AH,4CH
INT 21H  
   
   
   
MAIN ENDP
END MAIN

ret




             
             