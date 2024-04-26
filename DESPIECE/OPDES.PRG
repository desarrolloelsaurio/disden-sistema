********************************************
*-- Programa: OPDES.PRG
*-- Fecha   : 06/17/91 06:32pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DESPIECE DE AVIOS
********************************************
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
IF USED("DES")
	SELE DES
ELSE
	=MEN_LIN(ABA+'Despiece')
	SELE 20
	=GETDBF('DESPIECE','ARTICULO','DES')
ENDIF
RETURN MEN_LIN(BOTOM)
