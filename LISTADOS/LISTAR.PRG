********************************************************************************
*-- Programa: LPLAI.PRG
*-- Fecha   : 01/06/91 00:56am
*-- Version : G. REINER
*-- Notas   : GENERA IMPRESION CON SIDEWAYS
********************************************************************************
close data
SAVE SCRE TO NADA
a='"'+left(path,2)+left(sincosas(janname),8)+'.TXT'+'"'
RUN FOXSWAP /0 SIDEWAYS &a
REST SCRE FROM NADA
RETURN OPENCLOS()
