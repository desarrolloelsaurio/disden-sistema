***********************************
*-- Programa: OPMIX.PRG
*-- Fecha   : 08-07-92 05:56pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MIXTO
***********************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=men_lin('Abriendo archivo')
SELE 25
USE (CAMINO+"\MIXTA") ALIAS MIX
RETURN MEN_LIN(BOTOM)
