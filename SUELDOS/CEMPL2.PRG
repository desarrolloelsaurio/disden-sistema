*:*********************************************************************
*:
*:        Program: CEMPL2.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: CEMPL.PRG                     
*:
*:          Calls: CEMPL3.PRG
*:               : ELICAT()       (function  in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:59               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: cempl2.prg
*-- Fecha   : 01/29/91 07:07pm
*-- Version : g. reiner
*-- Notas   : deriva a las operaciones de correcciones masivas de un concepto
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   fisc='.T.'
   DO cempl3
CASE BAR()=2
   STORE 0 TO respuesta
   IF elicat(' - Correcci¢n ')<>0
      xcos=respuesta
      fisc='CAT=XCOS'
      DO cempl3
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicon(' - Correcci¢n ')<>0
      xcos=respuesta
      fisc='CON=XCOS'
      DO cempl3
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF eliccos(' - Correcci¢n ')<>0
      xcos=respuesta
      fisc='CCOS=XCOS'
      DO cempl3
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliesp(' - Correcci¢n ')<>0
      xcos=respuesta
      fisc='esp=XCOS'
      DO cempl3
   ENDIF
ENDCASE
RELE xcos
RETURN

*: EOF: CEMPL2.PRG
