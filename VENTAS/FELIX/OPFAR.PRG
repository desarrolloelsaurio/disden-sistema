***********************************
*-- Programa: OPFAR.PRG
*-- Fecha   : 08-07-92 05:56pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE FARJES
***********************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=men_lin('Abriendo archivo de Facturas')
IF !USED("FAR")
   =GETDBF('FACTURAC',"NUMERO","FAR",PRXAREA(.T.))
ELSE
SELE FAR
ENDIF
RETURN MEN_LIN(BOTOM)
