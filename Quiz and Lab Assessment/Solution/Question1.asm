
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 64
.DATA


  STRING DB ?
  
  SYM DB '$'
  
  INPUT_M DB 0ah,0dh,0AH,0DH, 'ENTER A STRING: ',0DH,0AH,'$'
  
  OUTPUT_M DB 0ah,0dh,0AH,0DH, 'THE OUTPUT IS: ',0DH,0AH,'$'
  
  MSG1 DB "YES PALINDROME!$"
  MSG2 DB " NOT PALINDROME!$"
  
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, OFFSET INPUT_M
    MOV AH, 9
    INT 21H
    
    LEA SI, STRING 
    
INPUT: MOV AH, 1
       INT 21H
       
       MOV [SI], AL
       INC SI
       
       CMP AL, 0DH
       JNZ INPUT
       
       MOV AL, SYM
       MOV [SI],'$'
       
OUTPUT: LEA DX, OUTPUT_M
        MOV AH, 9
        INT 21H
        
        MOV DL, 0AH
        MOV AH, 02H
        INT 21H
        
        
        MOV DX, OFFSET STRING
        MOV AH, 9
        INT 21H
        
        
        MOV AH, 4CH
        INT 21H   
        
        
PAL:   


        
       LEA AL INPUT_M
       MOV SI,DI
       ADD SI,INPUT_M_SIZE
       DEC SI
       
       MOV CX,INPUT_M_SIZE
       CMP CX,1
       JE IS_PAL   
       
       SHR CX,1
       
 NEXT:
   MOV AL,[DI]
   MOV BL,[SI]
   CMP AL,BL
   JNE NOT_PAL
   INC DI
   DEC SI
   LOOP NEXT
       
IS_PAL
;YES ITS A PALINDROME
  MOV AH,9
  MOV DX,OFFSET MSG1
  INT 21H
  JMP STOP
  
  
NOT_PAL:
    ;NOT PALINDROME
    MOV AH,9
    MOV DX,OFFSET MSG2
    INT 21H
STOP:
  END
          
       
ret




