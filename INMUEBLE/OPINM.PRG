*****************************************
*-- Programa: OPINM.PRG
*-- Fecha   : 04-15-92 02:37pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO INMUEBLES
*-- Modificaci¢n GOYO 05-30-92 11:44am (saco else en elias#inm)
*-- MODIF GOYO 04-28-93 02:39pm
******************************************
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

IF USED("INM")
	SELE INM
	SET ORDER TO TAG CODINM
ELSE
	=MEN_LIN(ABA+'Inmuebles')
	SELE 14
	USE (PATHALQ+'\INMUEBLE') ORDER TAG CODINM ALIAS INM
ENDIF
IF INMPOP
	=DEFPOGRL(INMPOPR,INMPOPC,"INMPOP","INM.DOMICILIO",40)
ELSE
	RELE POPU INMPOP
ENDIF
RETURN MEN_LIN(BOTOM)
