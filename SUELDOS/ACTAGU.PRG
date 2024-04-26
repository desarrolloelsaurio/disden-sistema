********************************************************************************
*-- Programa: ACTAGU.PRG
*-- Fecha   : 01/25/91 06:36pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA FORMA PERIODO DEL AGUINALDO
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 15,14 TO 19,66 TITL ' Per¡odo del S.A.C. ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,1 SAY 'CUOTA DEL S.A.C.' COLOR SCHE 3
vez=1
DO WHILE vez=1
   vez=2
   @ 1,26 GET quialiq PICT '9' RANGE 1,2;
      MESS 'Cuota del S.A.C. a Calcular'
   READ
ENDDO
RELE WIND win
RELE vez
@ 24,0 say space(80)
RETURN
