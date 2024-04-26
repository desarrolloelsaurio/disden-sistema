********************************************************************************
*-- Programa: acFORM.PRG
*-- Fecha   : 11/04/90 07:27pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA TIPO FORMULARIO RECIBO DE SUELDO
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') color i
DEFINE WINDOW win FROM 9,27 TO 13,66 TITL ' Tipo de Formulario ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,1 SAY 'TIPO DE FORMULARIO' COLOR SCHE 3
vez=1
DO WHILE vez=1
   vez=2
   @ 1,22 GET ACFORM PICTURE '99' range 1,5;
      MESS 'Ingrese el Tipo de Formulario del Recibo de Sueldos'
   READ
ENDDO
RELE WIND win
RELE vez
@ 24,0 say space(80)
RETURN
