
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h



.MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  'Enter a string : $'
   PROMPT_2  DB  0DH,0AH,'\ No. of Vowels = $\'
  

   STRING        DB  50 DUP (?)   
   C_VOWELS      DB  '\ AEIOU\'
   S_VOWELS      DB  ' \aeiou\'
   C_CONSONANTS  DB  '\ BCDFGHJKLMNPQRSTVWXYZ\'
   S_CONSONANTS  DB  '\ bcdfghjklmnpqrstvwxyz\'

 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX
     MOV ES, AX

     LEA DX, PROMPT_1             
     MOV AH, 9
     INT 21H

     LEA DI, STRING               

     CALL READ_STR                

     XOR DX, DX                   
     LEA SI, STRING               

     OR BX, BX                    
     JE @EXIT                     

     @COUNT:                      
       LODSB                      ; set AL=DS:SI

       LEA DI, C_VOWELS           
       MOV CX, 5                  

       REPNE SCASB                ; check AL is capital vowel or not
       JE @INCREMENT_VOWELS       
                               

       LEA DI, S_VOWELS           
       MOV CX, 5                  

       REPNE SCASB                
       JE @INCREMENT_VOWELS       
                                    
                                  

       JMP @NEXT                  

       @INCREMENT_VOWELS:         
         INC DL                   
         JMP @NEXT                
                        

       @NEXT:                     
         DEC BX                   
         JNE @COUNT               ; jump to label @COUNT while BX!=0

       @EXIT:                     

     MOV CX, DX                   ; set CX=DX

     LEA DX, PROMPT_2             ; load and display the string PROMPT_2
     MOV AH, 9                     
     INT 21H                       

     XOR AX, AX                   
     MOV AL, CL                   

     CALL OUTDEC                  

                    

     MOV AH, 4CH                  
     
     INT 21H
   MAIN ENDP






  READ_STR PROC
    

    PUSH AX                       
    PUSH DI                       

    CLD                           ; clear direction flag
    XOR BX, BX                    

    @INPUT_LOOP:                  
      MOV AH, 1                    
      INT 21H                     

      CMP AL, 0DH                 
      JE @END_INPUT              

      CMP AL, 08H                 
      JNE @NOT_BACKSPACE          

      CMP BX, 0                  
      JE @INPUT_ERROR             

      MOV AH, 2                   
      MOV DL, 20H                
      INT 21H                     

      MOV DL, 08H                 
      INT 21H                     

      DEC BX                      
      DEC DI                     
      JMP @INPUT_LOOP             

      @INPUT_ERROR:               
      MOV AH, 2                   
      MOV DL, 07H                 
      INT 21H                     

      MOV DL, 20H                 
      INT 21H                     
      JMP @INPUT_LOOP                   

      @NOT_BACKSPACE:            
      STOSB                       
      INC BX                      
      JMP @INPUT_LOOP             

    @END_INPUT:                   

    POP DI                        
    POP AX                        

    RET
  READ_STR ENDP





 OUTDEC PROC
   

   PUSH BX                        
   PUSH CX                       
   PUSH DX                        

   CMP AX, 0                      
   JGE @START                     

   PUSH AX                        

   MOV AH, 2                      
   MOV DL, 00                    
   INT 21H                        

   POP AX                         

   NEG AX                         

   @START:                        

   XOR CX, CX                    
   MOV BX, 10                    

   @OUTPUT:                       
     XOR DX, DX                   
     DIV BX                       
     PUSH DX                      
     INC CX                     
     OR AX, AX                    
   JNE @OUTPUT                    

   MOV AH, 2                      

   @DISPLAY:                      
     POP DX                       
     OR DL, 30H                   
     INT 21H                      
   LOOP @DISPLAY                  

   POP DX                         
   POP CX                         
   POP BX                         

   RET                            
 OUTDEC ENDP





 END MAIN




