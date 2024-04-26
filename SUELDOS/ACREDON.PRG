********************************************************************************
*-- Programa: ACREDON.PRG
*-- Fecha   : 11/20/90 09:17pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA DATOS DE REDONDEO
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') color i
DEFINE WINDOW win FROM 6,27 TO 11,66 TITL ' Datos del Redondeo ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,1 SAY 'MONTO DEL REDONDEO' COLOR SCHE 3
@ 2,1 SAY 'TIPO DE REDONDEO ' COLOR SCHE 3
vez=1
DO WHILE vez=1
   vez=2
   @ 1,26 GET m->REDONDEo PICTURE '9999999.99';
      MESS 'Ingrese el Monto del Redondeo'
   @ 2,26 GET TIPORED PICTURE '@M Arriba,Medio ';
      MESS 'Ingrese el Tipo del Redondeo - Cambie Opciones con la Barra'
   READ
ENDDO
RELE WIND win
RELE vez
@ 24,0 say space(80)
RETURN
