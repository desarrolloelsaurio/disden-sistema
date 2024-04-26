********************************************************************************
*-- Programa: OPCNX.PRG
*-- Fecha   : 01-18-92 08:44am
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO CONSORCIOS
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
SELE 19
=men_lin(ABA+'Consorcistas')
IF ALIAS()#'CNX'
   USE (PATHCNS+'\CONSODAT') ORDER TAG CONCOD ALIAS CNX
ENDIF
RETURN MEN_LIN(BOTOM)
