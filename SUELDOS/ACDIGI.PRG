********************************************************************************
*-- Programa: acDIGI.PRG
*-- Fecha   : 01/05/91 07:24pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA CANTIDAD DE DIGITOS EN PLANILLAS
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') color i
DEFINE WINDOW win FROM 10,14 TO 14,66 TITL ' Cantidad de Espacio para N£meros en Planillas ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,1 SAY 'CANTIDAD DE ESPACIOS' COLOR SCHE 3
vez=1
DO WHILE vez=1
   vez=2
   @ 1,26 GET acDIGI PICTURE '999';
      MESS 'Cantidad de Espacios para N£meros (Presentaci¢n: NNNNN.NN = 8) '
   READ
	if acDIGI>20 .OR. acDIGI<4
		vez=1
	endif
ENDDO
RELE WIND win
RELE vez
@ 24,0 say space(80)
RETURN
