.model tiny
.stack 100h
.data
tb1 db "nhap so thu 1:$"
tb2 db 13,10 ,"nhap so thu 2:$"
tb3 db 13,10,"tong 2 so:$"
so1 dw 0
so2 dw 0
tong dw 0
.code
main proc
mov ax,@data
mov ds,ax
;in thong bao nhap so thu nhat
lea dx,tb1
mov ah,9
int 21h
nhap1:
mov ah,1
int 21h
cmp al,13 ;so sanh ky tu vua nhap voi 13
je nhap2 ;neu bang nhap so thu 2
sub al,30h ;doi ky tu sang so
mov ah,0 ;xoa bit cao
mov cx,ax ;cat so vua nhap v�o cx
mov ax,so1 ;dua bien s� 1 v� ki�u byte de chuan bi nhann v�i 10
mov bx,10 ;gan bx =10
mul bx ; nh�n ax voi 10
add ax,cx ;c�ng ket qua vua nhan voi so vua nhap ket qua c�t v�o ax
mov so1,ax ; cat k�t qua vao bi�n s�1
jmp nhap1
nhap2:
lea dx,tb2 ;hi�n th�ng b�o nh�p s� thu 2
mov ah,9
int 21h
nhap: mov ah,1 ;nhap s� thu 2
int 21h
cmp al,13 ;so s�nh k� tu vua nh�p voi 13
je tinhtong ;n�u bang th� t�nh t�ng
sub al,30h ;chuy�n k� tu sang dang s�
mov ah,0 ;xo� b�t cao
mov cx,ax ;c�t k�t qua vua nhap v�o cx
mov ax,so2 ;dua bi�n s� 2 v� ki�u byte
mov bx,10 ;gan bx=10
mul bx ;nh�n k�t qua vua nhap voi 10
add ax,cx ;c�ng k�t qua vua nh�n v�i s� vua nh�p
mov so2,ax ;c�t k�t qua v�o bi�n s� 2
jmp nhap
tinhtong:
mov dx,tong
mov ax,so1 ;dua bi�n s� 1 ra thanh ghi ax
mov bx,so2 ;dua bi�n s� 2 ra thanh ghi bx
add ax,bx ;c�ng ax voi bx k�t qua cat vao ax
mov tong,ax ;dua k�t qua tu ax v�o bi�n t�ng
inso: mov ah,9 ;hi�n th�ng b�o in t�ng
lea dx,tb3
int 21h
mov ax,tong ;dua k�t qua trongv bien t�ng ra thanh ghi ax
mov dx,0 ;xoa bit cao dx
mov bx,10 ;g�n bx=10
mov cx,0 ;khoi tao bi�n d�m
chia: div bx ;l�y k�t qua chia cho 10
push dx ;du o dx d�y vao ngan x�p
inc cx ;tang bi�n d�m
cmp ax,0 ;so sanh thuong voi 0
je hienkq ;neu bang th� hi�n k�t qua
xor dx,dx ;xoa bit cao trong dx
jmp chia
hienkq: pop dx ;l�y du trong ngan x�p ra khoi dx
add dl,30h ;chuy�n s� th�nh dang k� tu
mov ah,2 ;in t�ng
int 21h
loop hienkq
ra: mov ah,4ch
int 21h
Main endp
End main