***********************************
*-- Programa: OPMIX.PRG
*-- Fecha   : 08-07-92 05:56pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MIXTO
***********************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=MEN_LIN('Abriendo archivo')
=GETDBF('MIXTA',.F.,"MIX",1)
RETURN MEN_LIN(BOTOM)
