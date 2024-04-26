****************************************
*-- PROGRAMA: OPGAR.PRG
*-- FECHA   : 06/12/91 01:50PM
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO GARANTIAS
****************************************
#DEFINE BOTOM "  "+repl("°",78)                  && BOTOM
#DEFINE ABA   "Abriendo Base de "                && ABA
IF USED("PER")
	SELE PER
	SET ORDER TO TAG GARANTIA
ELSE
	=MEN_LIN(ABA+'Garant¡as')
	SELE 21
	USE (PATHPRO+'\PERSONAS') ORDER TAG GARANTIA ALIAS PER
ENDIF
RETURN IIF(GARPOP,DEFPOPER(GARPOPR,GARPOPC),.T.) .AND. MEN_LIN(BOTOM)
