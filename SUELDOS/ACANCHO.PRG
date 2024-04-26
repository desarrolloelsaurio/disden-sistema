********************************************************************************
*-- Programa: acancho.PRG
*-- Fecha   : 11/04/90 07:27pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA ancho de la impresora
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') color i
DEFINE WINDOW win FROM 4,27 TO 8,66 TITL ' Ancho de la Impresora ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,1 SAY 'ANCHO DE LA IMPRESORA' COLOR SCHE 3
vez=1
DO WHILE vez=1
   vez=2
   @ 1,26 GET acancho PICTURE '999';
      MESS 'Ingrese el Ancho en Caracteres de la Impresora'
   READ
	if acancho<>80 .and. acancho<>132
		vez=1
	endif
ENDDO
RELE WIND win
RELE vez
@ 24,0 say space(80)
RETURN
