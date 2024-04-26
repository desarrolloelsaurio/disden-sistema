*:*********************************************************************
*:
*:        Program: GLADI.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: QADI.PRG                      
*:
*:          Calls: GLADI1.PRG
*:               : ELICAT()       (function  in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:01               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: GLADI.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : INGRESO GLOBAL DE ADICIONALES
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
   DO gladi1
CASE BAR()=2
   STORE 0 TO respuesta
   IF elicat(' - Ingreso Global Adicionales')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CAT=XCOS'
      DO gladi1
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicon(' - Ingreso Global Adicionales')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CON=XCOS'
      DO gladi1
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF eliccos(' - Ingreso Global Adicionales')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CCOS=XCOS'
      DO gladi1
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliesp(' - Ingreso Global Adicionales')<>0
      xcos=respuesta
      fisc=fisc+' .AND. ESP=XCOS'
      DO gladi1
   ENDIF
ENDCASE
RETURN

*: EOF: GLADI.PRG
