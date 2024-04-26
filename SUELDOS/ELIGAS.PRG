*:*********************************************************************
*:
*: Procedure file: ELIGAS.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:  Procs & Fncts: ELIGAS()
*:
*:      Documented 04/05/91 at 20:45               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: ELIGAS.PRG
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : ELIGE TIPO DE ADELANTO
********************************************************************************
*!*********************************************************************
*!
*!       Function: ELIGAS()
*!
*!      Called by: GLADE1.PRG                    
*!
*!          Calls: INFIC.PRG
*!
*!*********************************************************************
FUNCTION eligas
PARAMETER uno
ACTI SCRE
SELE gas
STORE 0 TO respuesta
IF gaspop
   @ 24,0 SAY PADC('Tipo de Adelanto'+uno,80,' ')
   ACTI POPUP gaspop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
      respuesta=RECNO()
   ENDIF
ELSE
   DO infic WITH RECCOUNT('GAS'),'INGRESE N§ DE TIPO DE ADELANTO'+uno
ENDIF
@ 24,0 SAY SPACE(80)
RETURN(respuesta)
*: EOF: ELIGAS.PRG
