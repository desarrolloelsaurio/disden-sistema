function FIRULET1
parameter r,c,r1,c1,tp
private r,c,r1,c1,tp,LARGO,ANCHO,ANCHO1,LARGO1
ANCHO=C1-C+1
LARGO=R1-R+1
ANCHO=ANCHO+3-ANCHO%3
ANCHO1=ANCHO/3
LARGO=LARGO+3-LARGO%3
LARGO1=LARGO/3
RANT=R
@ R,C SAY '�'+REPL("�",ANCHO1-2)+'�'+SPACE(ANCHO1)+'�'+REPL("�",ANCHO1-2)+'�'
R=R+1
FOR B=2 TO LARGO1-1
@ R,C SAY '�'+SPACE(ANCHO1-2)+'�'+SPACE(ANCHO1)+'�'+SPACE(ANCHO1-2)+'�'
R=R+1
ENDFOR
@ R,C SAY '�'+REPL("�",ANCHO1-4)+'� �'+REPL("�",ANCHO1)+'� �'+REPL("�",ANCHO1-4)+'�'
R=R+1
FOR B=1 TO LARGO1
@ R,C SAY SPACE(ANCHO1-3)+'�'+SPACE(ANCHO1+4)+'�'
R=R+1
ENDFOR
@ R,C SAY '�'+REPL("�",ANCHO1-4)+'� �'+REPL("�",ANCHO1)+'� �'+REPL("�",ANCHO1-4)+'�'
R=R+1
FOR B=2 TO LARGO1-1
@ R,C SAY '�'+SPACE(ANCHO1-2)+'�'+SPACE(ANCHO1)+'�'+SPACE(ANCHO1-2)+'�'
R=R+1
ENDFOR
@ R,C SAY '�'+REPL("�",ANCHO1-2)+'�'+SPACE(ANCHO1)+'�'+REPL("�",ANCHO1-2)+'�'
R=R+1
@ RANT+1,C+1,RANT+LARGO1-2,C+ANCHO1-2 BOX BOXSTR(1)
@ RANT+1,C+ancho1+1,RANT+LARGO1-2,C+2*ANCHO1-2 BOX BOXSTR(1)
@ RANT+1,C+2*ancho1+1,RANT+LARGO1-2,C+3*ANCHO1-2 BOX BOXSTR(1)
***
@ RANT+1+2*largo1,C+1,RANT+3*LARGO1-2,C+ANCHO1-2 BOX BOXSTR(1)
@ RANT+1+2*largo1,C+ancho1+1,RANT+3*LARGO1-2,C+2*ANCHO1-2 BOX BOXSTR(1)
@ RANT+1+2*largo1,C+2*ancho1+1,RANT+3*LARGO1-2,C+3*ANCHO1-2 BOX BOXSTR(1)
RETURN(.T.)
