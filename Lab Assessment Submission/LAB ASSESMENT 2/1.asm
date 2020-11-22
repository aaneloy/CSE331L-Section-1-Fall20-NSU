
org 100h    
ARR0 DB 5 DUP(?)
MOV BX,OFFSET ARR0
MOV [BX],2
MOV [BX+1],1
MOV [BX+2],4
MOV [BX+3], 5
MOV [BX+4] ,6             
                     
 

ret




