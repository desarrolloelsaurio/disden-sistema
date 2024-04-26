*******************************************************
*-- Programa: OPCOR.PRG
*-- Fecha   : 06/26/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO ORDENES DE CORTE y EXTENDED
******************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE KORTE  "Corte"							 && KORTE
IF USED("COR")
	SELE COR
ELSE
	=MEN_LIN(ABA+"Ordenes de "+korte)
	SELE 6
	=GETDBF('ORDCOR','NUMERO','COR')
ENDIF
IF CORPOP
	=DEFPOGRL(CORPOPR,CORPOPC,"CORPOP","STR(COR.NUMERO)",10,'Elija la Orden de '+korte)
ENDIF
IF !USED("CO1")
	=MEN_LIN(ABA+"Ordenes de "+korte)
	SELE 7
	=GETDBF('ORDCOR1',"NUMERO","CO1",7)
	SELE 35
	=GETDBF('ORDCOR2',"NUMERO","CO2",35)
ENDIF
RETURN MEN_LIN(BOTOM)
