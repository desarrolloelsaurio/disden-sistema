*:*********************************************************************
*:
*: Procedure file: ELITHOR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:  Procs & Fncts: ELITHOR()
*:
*:      Documented 04/05/91 at 00:22               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: ELITHOR.PRG
*-- Fecha   : 11/10/90 04:58pm
*-- Version : G. REINER
*-- Notas   : ELIGE TIPO DE HORA
********************************************************************************
*!*********************************************************************
*!
*!       Function: ELITHOR()
*!
*!      Called by: BHOR.PRG                      
*!               : IHOR1.PRG                     
*!               : IHOR1S.PRG                    
*!               : GHOR1.PRG                     
*!               : GLHOR1.PRG                    
*!               : CHOR2.PRG                     
*!               : CHOR1.PRG                     
*!
*!          Calls: INFIC.PRG
*!
*!*********************************************************************
FUNCTION elithor
PARAMETER uno
ACTI SCRE
SELE thor
STORE 0 TO respuesta
IF thorpop
   @ 24,0 SAY PADC('Tipo de Hora'+uno,80,' ')
   ACTI POPUP thorpop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
      respuesta=RECNO()
   ENDIF
ELSE
   DO infic WITH RECCOUNT('THOR'),'Ingrese N§ de Tipo de Hora'+uno
ENDIF
@ 24,0 SAY SPACE(80)
RETURN(respuesta)
*: EOF: ELITHOR.PRG
