
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
          
.MODEL SMALL
.STACK 100H
.DATA
PROMPT_1 DB 'Original value of AL : $'
PROMPT_2 DB 0DH,0AH,'Processed value of AL : $'
.CODE
MAIN PROC
MOV AX, @DATA 
MOV DS, AX
LEA DX, PROMPT_1 
MOV AH, 9
INT 21H
MOV AL, 31H 
MOV BL, AL 
MOV AH, 2 
MOV DL, AL
INT 21H          


LEA DX, PROMPT_2 
MOV AH, 9
INT 21H
AND BL, 0FH

SHL BL, 2
OR BL, 30H 
MOV AH, 2 
MOV DL, BL
INT 21H
MOV AH, 4CH 
INT 21H
MAIN ENDP


ret




