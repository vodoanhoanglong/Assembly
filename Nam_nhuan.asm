org 100h  

include 'emu8086.inc'    

mov cx, 04h

 
inp:    mov ah, 01h
        int 21h          

        sub al, 30h    
        mov bl, al
        mov ax, dx
        mov dx, 10h
        mul dx     
        
        mov bh, 00h
        add ax, bx
        mov dx, ax
    loop inp      
          
            
mov ax, dx
mov dx, 0000h
mov bx, 64h
mul bx
mov bx, 100h
div bx 
mov cx, ax
mov dx, 0000h
            
mov bx, 400h
div bx
jz yes              

mov ax, cx
mov bx, 04h
mov dx, 0000h
div bx
jnz no

mov ax, cx   
mov dx, 0000h
mov bx, 100h
div bx
jnz no
jz yes

no: 
    print 'Not a  Leap Year'
    jmp exit

yes:
    print 'Leap Year'

exit:

ret
