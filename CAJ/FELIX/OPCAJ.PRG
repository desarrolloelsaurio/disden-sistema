****************************************
*-- PROGRAMA: OPCAJ.PRG
*-- FECHA   : 06/12/91 01:50PM
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO CAJA DIARIA
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("CAJ")
	SELE CAJ
	SET ORDER TO TAG FECHAOP
ELSE
	=MEN_LIN(ABA+'Caja')
	=PRXAREA(.T.)
	USE (PATHPRO+'\CAJA') ORDER TAG FECHAOP ALIAS CAJ
ENDIF
RETURN MEN_LIN(BOTOM)
