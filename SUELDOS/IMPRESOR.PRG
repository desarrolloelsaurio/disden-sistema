********************************************************************************
*-- Programa: IMPRESOR.PRG
*-- Fecha   : 4/10/89
*-- Version : G. REINER
*-- Notas   : AVISA ENCENDER LA IMPRESORA
********************************************************************************
FOR ball=1000 TO 2000 STEP 500
   SET BELL TO ball,1
   ?? CHR(7)
NEXT
FOR ball=2000 TO 1000 STEP -500
   SET BELL TO ball,1
   ?? CHR(7)
NEXT
@ 24,0 SAY PADC("ENCIENDA LA IMPRESORA Y UBIQUE EL PAPEL - LUEGO [ENTER] / [ESC] PARA MENU",80,'*') COLOR SCHE 19
?? CHR(7)
DO WHILE INKEY()=0
ENDDO
@ 24,0 SAY SPACE(80)
RELE ball
RETURN
*: EOF: IMPRESOR.PRG
