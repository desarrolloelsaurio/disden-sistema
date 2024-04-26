***********************************
*-- Programa: OPMIX.PRG
*-- Fecha   : 08-07-92 05:56pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE BUQUES
***********************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=men_lin('Abriendo archivo de Buques')
=GETDBF('BUQUES',.F.,"BUQ",PRXAREA(.T.))
RETURN MEN_LIN(BOTOM)
