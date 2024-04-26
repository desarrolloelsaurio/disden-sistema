*********************************************************************************
*-- Programa: consul.prg
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU de consultas
********************************************************************************
C_DIJO=ALLTRIM(PROMPT())
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE C_DIJO='Popup Completo'
stor .t. to merpop,merpop1
=OPMER()
=mpre(.T.)
CASE C_DIJO='Popup Parcial'
stor .t. to merpop
stor .f. to mErpop1
=mpre(.T.)
CASE C_DIJO='Por Teclado'
stor .f. to merpop
=mpre(.T.)
ENDCASE
ulpr=program()
RETURN men_lin(botom)
