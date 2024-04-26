********************************************************************************
*-- Programa: LPLAI.PRG
*-- Fecha   : 01/06/91 00:56am
*-- Version : G. REINER
*-- Notas   : GENERA IMPRESION CON SIDEWAYS
********************************************************************************
PARAMETER cual
DO WHILE .NOT. PRINTSTATUS()
   DO impresor
   IF LASTKEY()=27
      RETURN TO MASTER
   ENDIF
ENDDO
CLOSE DATA
SAVE SCRE TO NADA
RUN FOXSWAP /0 SIDEWAYS &a
REST SCRE FROM NADA
RETURN
