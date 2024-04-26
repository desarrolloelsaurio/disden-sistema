********************************************************************************
*-- Programa: IADE.PRG
*-- Fecha   : 12/13/90 00:52am
*-- Version : G. REINER
*-- Notas   : INGRESA ADELANTOS DE SUELDO PARA LA LIQUIDACION
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE emp
SET ORDER TO ordlis
DO CASE
CASE BAR()=1
   fisc='LASTKEY()<>27'
   DO iade1
CASE BAR()=2
   STORE 0 TO respuesta
   IF eliemp(' - Ingreso Adicionales')<>0
      GOTO respuesta
      DO iade1s
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicat(' - Ingreso Adicionales')<>0
      xcos=respuesta
      fisc='CAT=XCOS'
      DO iade1
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF elicon(' - Ingreso Adicionales')<>0
      xcos=respuesta
      fisc='CON=XCOS'
      DO iade1
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliccos(' - Ingreso Adicionales')<>0
      xcos=respuesta
      fisc='CCOS=XCOS'
      DO iade1
   ENDIF
CASE BAR()=6
   STORE 0 TO respuesta
   IF eliesp(' - Ingreso Adicionales')<>0
      xcos=respuesta
      fisc='ESP=XCOS'
      DO iade1
   ENDIF
ENDCASE
RETURN
*: EOF: IADE.PRG
