*****************************************
*-- Programa: OPRECB.PRG
*-- Fecha   : 04-15-92 02:37pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO RECIBOS BANCARIOS
*-- MODIF GOYO 04-28-93 02:39pm
******************************************
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

IF USED("RECB")
	SELE RECB
	SET ORDER TO TAG NUMERO
ELSE
	=MEN_LIN(ABA+'Recibos Bancarios')
	=prxarea(.t.)
	USE (PATHALQ+'\RECIBOB') ORDER TAG NUMERO ALIAS RECB
ENDIF
RETURN MEN_LIN(BOTOM)
