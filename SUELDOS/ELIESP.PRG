*:*********************************************************************
*:
*: Procedure file: ELIESP.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:  Procs & Fncts: ELIESP()
*:
*:      Documented 04/05/91 at 19:59               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: ELIESP.PRG
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : ELIGE ESPECIALIDAD
********************************************************************************
*!*********************************************************************
*!
*!       Function: ELIESP()
*!
*!      Called by: IADE.PRG                      
*!
*!          Calls: INFIC.PRG
*!
*!*********************************************************************
FUNCTION eliesp
PARAMETER uno
ACTI SCRE
SELE esp
STORE 0 TO respuesta
IF esppop
   respuesta=0
   @ 24,0 SAY PADC('Especialidad '+uno,80,' ')
   ACTI POPUP esppop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
      respuesta=RECNO()
   ENDIF
ELSE
   DO infic WITH RECCOUNT('ESP'),'INGRESE N§ DE ESPECIALIDAD'+cosa
ENDIF
@ 24,0 SAY SPACE(80)
RETURN(respuesta)
*: EOF: ELIESP.PRG
