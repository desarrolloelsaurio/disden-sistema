*:*********************************************************************
*:
*:        Program: GHOR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: HOR.PRG                       
*:
*:          Calls: GHOR1.PRG
*:               : ELICAT()       (function  in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:00               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: GHOR.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : DERIVA AL PROGRAMA DE GENERALIZACION DE HORAS TRABAJADAS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE emp
SET ORDER TO ordlis
IF jannro<>0
   fisc='JAN=JANNRO'
ELSE
   fisc='.T.'
ENDIF
DO CASE
CASE BAR()=1
   DO ghor1
CASE BAR()=2
   STORE 0 TO respuesta
   IF elicat(' - Generaliza Horas Trabajadas')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CAT=XCOS'
      DO ghor1
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicon(' - Generaliza Horas Trabajadas')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CON=XCOS'
      DO ghor1
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF eliccos(' - Generaliza Horas Trabajadas')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CCOS=XCOS'
      DO ghor1
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliesp(' - Generaliza Horas Trabajadas')<>0
      xcos=respuesta
      fisc=fisc+' .AND. ESP=XCOS'
      DO ghor1
   ENDIF
ENDCASE
RETURN

*: EOF: GHOR.PRG
