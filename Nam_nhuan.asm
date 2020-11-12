.model small 
.stack 100h
.data

leap dw 'Leap year$'
nleap dw 'Not Leap year$'
a dw ?
b dw ?
c dw ?
.code
string macro str
    
    push ax
    push dx
    
    mov dx,offset str
    mov ah,9         
    int 21h
    
    pop dx
    pop ax
endm

main proc
    mov ax,@data
    mov ds,ax
    
    call indec; ax value
    push ax
    
    mov bx,400
    div bx  ; ax=ax/400
    mov a,dx
    mov dx,0
    
    pop ax
    push ax
    
    mov bx,4
    div bx  ;ax=ax/4
    mov b,dx
    mov dx,0
    
    pop ax
    
    push ax
    
    mov bx,100
    div bx; ax=ax/100
    mov c,dx
    mov dx,0
    
    pop ax
    call endl
    
    cmp a,0
    jne @else1
    
    string leap
    jmp @endelse
    
    @else1:
    
    cmp b,0
    jne @else2
    cmp c,0
    je  @else2
    
    string leap
    
    jmp @endelse
    
    @else2:
    
    string nleap
    
    @endelse:
    
    

    mov ax,4ch
    int 21h
    main endp
include io.lib
end main
