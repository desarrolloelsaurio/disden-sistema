****************************************
*-- PROGRAMA: OPBUQ.PRG
*-- FECHA   : 06/12/91 01:50PM
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO BUQUES
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("PER")
	SELE PER
	SET ORDER TO TAG BUQUE
ELSE
	=MEN_LIN(ABA+'Buques')
	SELE 21
	USE (PATHPRO+'\PERSONAS') ORDER TAG BUQUE ALIAS PER
ENDIF

RETURN IIF(BUQPOP,DEFPOPER(BUQPOPR,BUQPOPC),.T.) .AND. ;
MEN_LIN(BOTOM)
