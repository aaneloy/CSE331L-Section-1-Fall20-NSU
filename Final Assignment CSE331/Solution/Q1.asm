
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
 .MODEL SMALL
 .STACK 100H
 
 .DATA
 PROMT_1 DB 'ENTER THE LOWER CLASS ALPHABET : $'
 PROMT_2 DB 0DH,0AH, 'THE UPPER  CLASS ALPHABET IS : $'
    
    
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,PROMT_1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL
    
    LEA DX,PROMT_2
    MOV AH,9
    INT 21H
    
    SUB BL,20H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
 MAIN ENDP
END MAIN
ret




