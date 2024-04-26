
*-- Programa: GLRET.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : INGRESO GLOBAL DE RETCIONALES
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
   DO glret1
CASE BAR()=2
   STORE 0 TO respuesta
   IF elicat(' - Ingreso Global Retenciones')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CAT=XCOS'
      DO glret1
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicon(' - Ingreso Global Retenciones')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CON=XCOS'
      DO glret1
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF eliccos(' - Ingreso Global Retenciones')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CCOS=XCOS'
      DO glret1
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliesp(' - Ingreso Global Retenciones')<>0
      xcos=respuesta
      fisc=fisc+' .AND. ESP=XCOS'
      DO glret1
   ENDIF
ENDCASE
RETURN
