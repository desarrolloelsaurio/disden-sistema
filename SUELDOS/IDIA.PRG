********************************************************************************
*-- Programa: Idia.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : INGRESA HORAS TRABAJADAS en un d¡a
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE emp
SET ORDER TO ordlis
DO CASE
CASE BAR()=1
   fisc='LASTKEY()<>27'
   DO idia1
CASE BAR()=2
   STORE 0 TO respuesta
   IF eliemp(' - Ingreso Horas Trabajadas')<>0
      GOTO respuesta
      DO idia1s
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicat(' - Ingreso Horas Trabajadas')<>0
      xcos=respuesta
      fisc='CAT=XCOS'
      DO idia1
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF elicon(' - Ingreso Horas Trabajadas')<>0
      xcos=respuesta
      fisc='CON=XCOS'
      DO idia1
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliccos(' - Ingreso Horas Trabajadas')<>0
      xcos=respuesta
      fisc='CCOS=XCOS'
      DO idia1
   ENDIF
CASE BAR()=6
   STORE 0 TO respuesta
   IF eliesp(' - Ingreso Horas Trabajadas')<>0
      xcos=respuesta
      fisc='ESP=XCOS'
      DO idia1
   ENDIF
ENDCASE
RETURN

*: EOF: IDIA.PRG
