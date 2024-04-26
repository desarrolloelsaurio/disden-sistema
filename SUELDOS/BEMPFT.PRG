*:*********************************************************************
*:
*:        Program: BEMPFT.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPF.PRG                      
*:
*:      Documented 04/23/91 at 20:53               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: BEMPFT.PRG
*-- Fecha   : 11/07/90 06:28pm
*-- Version : G. REINER
*-- Notas   : BORRA TODOS LOS PARIENTES DE UN EMPLEADO
********************************************************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 7,0 TO 11,77 TITL " Usted Quiere Borrar los Familiares de "+ALLTRIM(emp->apynom)+' ' SHAD COLOR SCHE 8
sigue='NO'
SELE epar
ACTI WIND win
@ 1,1 SAY " Usted Quiere Borrar los Familiares de "+ALLTRIM(emp->apynom)+' ?'
@ 1,50 GET sigue PICTURE '@M NO,SI' MESS 'Cambie Opciones con la Barra Espaciadora'
READ
IF sigue='SI'
   @ 24,0 SAY PADC('Espere por Favor - Compactando el Archivo',80,' ')
   DELE ALL FOR empleado=ff
   PACK
ENDIF
RELE sigue,ff
RELE WIND win
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: BEMPFT.PRG
