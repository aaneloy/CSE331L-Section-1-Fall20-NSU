
.MODEL SMALL
.STACK 64
.DATA


  STRING DB ?
  
  SYM DB '$'
  
  INPUT_M DB 0AH,0DH, 'ENTER THE INPUT STRING/INTEGER: ',0DH,0AH,'$' 
  s_size = $ - INPUT_M DB 0Dh,0Ah,'$'
  
  OUTPUT_M DB 0AH,0DH, 'THE OUTPUT IS: ',0DH,0AH,'$'
  
  msg1 db "  this is palindrome!$"
  msg2 db "  this is not a palindrome!$"
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
       
       


  
; call reverse function  
CALL REVERSE  
  
; load address of the string  
LEA DX,STRING  
  
 
MOV AH, 09H  
INT 21H  
  

MOV AH, 4CH 
INT 21H  
  
MAIN ENDP  
REVERSE PROC 
     
    MOV SI, OFFSET STRING  
  
     
    MOV CX, 0H  
  
    LOOP1: 
     
    MOV AX, [SI]  
    CMP AL, '$'
    JE LABEL1  
  
   
    PUSH [SI]  
  
    
    INC SI  
    INC CX  
  
    JMP LOOP1  
  
    LABEL1: 
    
    MOV SI, OFFSET STRING  
  
        LOOP2:  
                      ;if count not equal to zero  
        CMP CX,0  
        JE EXIT  
  
                        ; pop the top of stack  
        POP DX  
  
        ; make dh, 0  
        XOR DH, DH  
  
        ; put the character of the;  
        ;reversed string  
        MOV [SI], DX  
  
        ; increment si and;  
        ;decrement count  
        INC SI  
        DEC CX  
  
        JMP LOOP2  
  
                  
    EXIT: 
    ; add $ to the end of string  
    MOV [SI],'$'
    
     
       
       
PALINDROME:

  MOV CX, s_size
  CMP CX, 1
  JE is_palindrome  ; single char is always palindrome!

  shr cx, 1     ; divide by 2!

next_char:
    mov al, [di]
    mov bl, [si]
    cmp al, bl
    jne not_palindrome
    inc di
    dec si
loop next_char


is_palindrome:  
   ;  the string is "palindrome!"
   mov ah, 9
   mov dx, offset msg1
   int 21h
jmp stop

not_palindrome:
   ;  the string is "not palindrome!"
   mov ah, 9
   mov dx, offset msg2
   int 21h
stop:
      
REVERSE ENDP  
 
ret




 
          
        
        
OUTPUT: 
       

        LEA DX, OUTPUT_M
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
        

END MAIN
  