***********************************
*-- Programa: OPVIA.PRG
*-- Fecha   : 08-07-92 05:56pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE VIAJES
***********************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=men_lin('Abriendo archivo de Viajes')
IF !USED("VIA")
   =GETDBF('VIAJES',"NUMERO","VIA",PRXAREA(.T.))
ELSE
SELE VIA
ENDIF
RETURN MEN_LIN(BOTOM)
