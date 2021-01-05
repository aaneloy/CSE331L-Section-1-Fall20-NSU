
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
        
str_odd db ' ODD! ','\$\'
str_even db 'EVEN! ','\$\'   
                 
MOV AL,4

        
        

TEST AL,100B
CMP AL,0
JMP L1

mov ah, 09h
lea dx, str_odd
int 21h


L1:  
mov ah, 09h
lea dx, str_even
int 21h

END
ret




