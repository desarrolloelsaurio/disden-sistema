*:*********************************************************************
*:
*: Procedure file: ELICCOS.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:  Procs & Fncts: ELICCOS()
*:
*:      Documented 04/05/91 at 19:59               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: ELICCOS.prg
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : ELIGE EL CENTRO DE COSTOS PARA TRABAJAR
********************************************************************************
*!*********************************************************************
*!
*!       Function: ELICCOS()
*!
*!      Called by: IADE.PRG                      
*!
*!          Calls: INFIC.PRG
*!
*!*********************************************************************
FUNCTION eliccos
PARAMETER uno
ACTI SCRE
SELE ccos
STORE 0 TO respuesta
IF cospop
   @ 24,0 SAY PADC('Centro de Costos '+uno,80,' ')
   ACTI POPUP cospop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
      respuesta=RECNO()
   ENDIF
ELSE
   DO infic WITH RECCOUNT('CCOS'),'INGRESE N§ DE CENTRO DE COSTOS '+uno
ENDIF
@ 24,0 SAY SPACE(80)
RETURN(respuesta)
*: EOF: ELICCOS.PRG
