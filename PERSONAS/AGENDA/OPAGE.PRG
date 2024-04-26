****************************************
*-- PROGRAMA: OPAGE.PRG
*-- FECHA   : 06/12/91 01:50PM
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO AGEICOS
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("PER")
	SELE PER
	SET ORDER TO TAG AGENDA
ELSE
	=MEN_LIN(ABA+'Agenda')
	SELE 21
	USE (PATHPRO+'\PERSONAS') ORDER TAG AGENDA ALIAS PER
ENDIF
RETURN IIF(AGEPOP,DEFPOPER(AGEPOPR,AGEPOPC),.T.) .AND. MEN_LIN(BOTOM)
