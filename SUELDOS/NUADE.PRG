*:*********************************************************************
*:
*:        Program: NUADE.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: VARI.PRG                      
*:
*:      Documented 04/23/91 at 19:54               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: NUADE.PRG
*-- Fecha   : 01/11/91 08:19pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA NUMERO DEL RECIBO DE ADELANTO
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 10,27 TO 14,66 TITL ' N£mero de Recibo Inicial ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,1 SAY 'NUMERO RECIBO INICIAL' COLOR SCHE 3
vez=1
DO WHILE vez=1
   vez=2
   @ 1,26 GET nuade PICTURE '99999999';
      MESS 'Ingrese el N£mero del Recibo de Adelanto'
   READ
ENDDO
RELE WIND win
RELE vez
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: NUADE.PRG
