*:*********************************************************************
*:
*: Procedure file: ELICAT.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:  Procs & Fncts: ELICAT()
*:
*:      Documented 04/05/91 at 19:58               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: ELICAT.PRG
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : ELIGE CATEGORIA
********************************************************************************
*!*********************************************************************
*!
*!       Function: ELICAT()
*!
*!      Called by: IADE.PRG                      
*!
*!          Calls: INFIC.PRG
*!
*!*********************************************************************
FUNCTION elicat
PARAMETER uno
SELE cat
ACTI SCRE
STORE 0 TO respuesta
IF catpop
   @ 24,0 SAY PADC('Categor¡a '+uno,80,' ')
   respuesta=0
   ACTI POPUP catpop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
      respuesta=RECNO()
   ENDIF
ELSE
   DO infic WITH RECCOUNT('CAT'),'INGRESE N§ DE CATEGORIA '+uno
ENDIF
@ 24,0 SAY SPACE(80)
RETURN(respuesta)
*: EOF: ELICAT.PRG
