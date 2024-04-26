****************************************
*-- PROGRAMA: OPINTER.PRG
*-- FECHA   : 06/12/91 01:50PM
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO MEDICOS INTERNOS
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("PER")
	SELE PER
	SET ORDER TO TAG INTERNO
ELSE
	=MEN_LIN(ABA+'M‚dicos Internos')
	SELE 21
	USE (PATHPRO+'\PERSONAS') ORDER TAG INTERNO ALIAS PER
ENDIF

RETURN IIF(INTERPOP,DEFPOPER(INTERPOPR,INTERPOPC),.T.) .AND. ;
MEN_LIN(BOTOM)
