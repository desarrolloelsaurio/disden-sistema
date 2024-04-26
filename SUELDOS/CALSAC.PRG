********************************************************************************
*-- Programa: CALSAC.PRG
*-- Fecha   : 01/25/91 06:12pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA FORMA DE CALCULO DEL AGUINALDO
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 5,14 TO 9,66 TITL ' Forma de C lculo del S.A.C. ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,1 SAY 'FORMA DE CALCULO' COLOR SCHE 3
vez=1
DO WHILE vez=1
   vez=2
   @ 1,26 GET calsac PICTURE '@M Promedio    ,Mejor Sueldo';
      MESS 'Forma del C lculo del S.A.C.'
   READ
ENDDO
RELE WIND win
RELE vez
@ 24,0 SAY SPACE(80)
RETURN
