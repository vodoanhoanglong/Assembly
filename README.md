# Assembly language
![Logo](https://i.pinimg.com/originals/25/a8/5d/25a85d9e5057430d82273a3c75e73014.png)
- Install Emu8086.
- Try the code below.
```Assembly
    global  _main
    extern  _printf

    section .text
_main:
    push    message
    call    _printf
    add     esp, 4
    ret
message:
    db  'Hello, World', 10, 0
```

| Contact | Information |
|---------|-------------|
| Email   | vodoanhoanglong10a9@gmai.com|
| Instagram  | `vdhglg`|
| Facebook  | https://www.facebook.com/hoanglong.vodoan/
