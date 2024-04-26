********************************************************************************
*-- Programa: Gdia.PRG
*-- Fecha   : 02/27/91 03:35pm
*-- Version : G. REINER
*-- Notas   : DERIVA AL PROGRAMA DE GENERALIZACION DE HORAS TRABAJADAS en el dia
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
   DO gdia1
CASE BAR()=2
   STORE 0 TO respuesta
   IF elicat(' - Generaliza Horas Trabajadas')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CAT=XCOS'
      DO gdia1
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicon(' - Generaliza Horas Trabajadas')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CON=XCOS'
      DO gdia1
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF eliccos(' - Generaliza Horas Trabajadas')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CCOS=XCOS'
      DO gdia1
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliesp(' - Generaliza Horas Trabajadas')<>0
      xcos=respuesta
      fisc=fisc+' .AND. ESP=XCOS'
      DO gdia1
   ENDIF
ENDCASE
RETURN

*: EOF: GDIA.PRG
