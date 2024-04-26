*******************************************************************************
*-- Programa: rliq.prg
*-- Fecha   : 01/31/91 00:27am
*-- Version : g. reiner
*-- Notas   : deriva a operaciones de reliquidaci¢n
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   DO actliq
   DO acredon
   STORE 0 TO respuesta
   IF eliemp(" a Recalcular")<>0
      GOTO respuesta
      DO rliq1
   ENDIF
CASE BAR()=2
   DO actliq
   DO acredon
   STORE 0 TO respuesta
   DO opccos
   IF eliccos(" a Recalcular")<>0
      GOTO respuesta
      DO rliq2
   ENDIF
ENDCASE
RETURN
