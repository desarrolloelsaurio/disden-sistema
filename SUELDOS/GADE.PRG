********************************************************************************
*-- Programa: GADE.PRG
*-- Fecha   : 11/13/90 01:31am
*-- Version : G. REINER
*-- Notas   : DERIVA AL PROGRAMA DE GENERALIZACION DE ADELANTOS
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
   DO gade1
CASE BAR()=2
   STORE 0 TO respuesta
   IF elicat(' - Generaliza Adelantos de Sueldo')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CAT=XCOS'
      DO gade1
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicon(' - Generaliza Adelantos de Sueldo')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CON=XCOS'
      DO gade1
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF eliccos(' - Generaliza Adelantos de Sueldo')<>0
      xcos=respuesta
      fisc=fisc+' .AND. CCOS=XCOS'
      DO gade1
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliesp(' - Generaliza Adelantos de Sueldo')<>0
      xcos=respuesta
      fisc=fisc+' .AND. ESP=XCOS'
      DO gade1
   ENDIF
ENDCASE
RETURN
