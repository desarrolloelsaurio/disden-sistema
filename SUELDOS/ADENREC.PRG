********************************************************************************
*-- Programa: ADENREC.PRG
*-- Fecha   : 12/12/90 07:50pm
*-- Version : G. REINER
*-- Notas   : IMPRIME O NO ADELANTOS EN EL RECIBO
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 8,17 TO 12,60 TITL ' Imprime Adelantos en el Recibo de Sueldo ? ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,1 SAY 'IMPRIME ADELANTOS EN EL RECIBO ? ' COLOR SCHE 3
vez=1
dr=IIF(adenrec,'SI','NO')
ptf=sino(adenrec)
DO WHILE vez=1
   vez=2
   @ 1,36 GET dr PICTURE ptf MESS 'Cambie Opciones con la Barra'
   READ
ENDDO
adenrec=IIF(dr="SI",.T.,.F.)
RELE WIND win
RELE vez,dr
@ 24,0 SAY SPACE(80)
RETURN
