function haz_box
parameter H_REN,H_COL,H_REN1,H_COL1
H_LARGO=H_REN1-H_REN
H_ANCHO=H_COL1-H_COL
H_UNO='�'+repl('�',H_ANCHO-2)+'�'
H_DOS='�'+space(H_ANCHO-2)+'�'
H_TRES='�'+repl('�',H_ANCHO-2)+'�'
H_CUAT=space(H_ANCHO)
H_LARG=H_REN1-1
INI=H_REN+1
@ H_REN,H_COL SAY H_UNO
for H_A=INI to H_LARG
FOR B=H_COL TO H_ANCHO-1
@ H_A,H_COL SAY REPL("�",B+1)
NEXT
@ H_A,H_COL SAY H_DOS
endfor
@ H_A,H_COL SAY H_TRES
return .t.