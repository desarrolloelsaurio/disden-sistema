******************************
*-- Programa: HISTCOR.PRG
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : MENU HISTORICO
******************************
VAR_DIJO=ALLTRIM(PROMPT())
ULPR=PROGRAM()
=CABPAN1()
DO CASE
case VAR_DIJO='Restaura Archivo'
   DO XCORHIS
ENDCASE
UNLO ALL
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
