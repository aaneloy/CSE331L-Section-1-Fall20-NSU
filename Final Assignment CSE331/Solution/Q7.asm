
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.DATA 
NUM1 DB ?
NUM2 DB ?
RESULT DB ?
MSG1 DB 10,13,"ENTER FIRST NUMBER TO MULTIPLY : $"
MSG2 DB 10,13,"ENTER SECOND NUMBER TO MULTIPLY : $"
MSG3 DB 10,13,"RESULT OF MULTIPLICATION IS : $"       
 MSG4 DB DB 0DH,0AH,'VALUE  : $'

ENDS
.CODE 

START:
 MOV AX,@DATA
 MOV DS,AX
 LEA DX,MSG1
 MOV AH,9
 INT 21H
 MOV AH,1
 INT 21H
 
 SUB AL,30H
 MOV NUM1,AL
 LEA DX,MSG2
 MOV AH,9
 INT 21H
 MOV AH,1
 INT 21H
 
 SUB AL,30H
 MOV NUM2,AL
 MUL NUM1
 MOV RESULT,AL
 AAM
 
 ADD AH,30H
 ADD AL,30H
 MOV BX,AX

 LEA DX,MSG3
 MOV AH,9
 INT 21H
 
 MOV AH,2
 MOV DL,BH
 INT 21H
 
 MOV AH,2
 MOV DL,BL
 INT 21H
 
 MOV AH,4CH
 INT 21H
ENDS 

GREATER:
       CMP AH,16
       JLE LESS
       JGE MORE
       
       
  MORE: MOV MSG4,1
  LESS: MOV MSG4,0

END START

ret




