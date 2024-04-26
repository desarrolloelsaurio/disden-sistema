****************************************
*-- PROGRAMA: OPCHP.PRG
*-- FECHA   : 06/12/91 01:50PM
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO DE CHEQUES PROPIOS
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("CHP")
	SELE CHP
	SET ORDER TO TAG FECHAEM
ELSE
	=MEN_LIN(ABA+'Cheques Propios')
	=PRXAREA(.T.)
	USE (PATHcaj+'\CHEQPROP') ORDER TAG FECHAEM ALIAS CHP
ENDIF
RETURN MEN_LIN(BOTOM)
