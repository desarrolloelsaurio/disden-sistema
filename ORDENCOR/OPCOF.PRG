*******************************************************
*-- Programa: OPCOF.PRG
*-- Fecha   : 06/26/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO ORDENES DE CORTE
*             y EXTENDED A FUTURO
******************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE KORTE  "Corte"							 && KORTE
IF USED("COF")
	SELE COF
ELSE
	=MEN_LIN(ABA+"Ordenes de "+korte+" a Futuro")
	=PRXAREA(.T.)
	=GETDBF('ORDCOF','NUMERO','COF')
ENDIF
IF COFPOP
	=DEFPOGRL(COFPOPR,COFPOPC,"COFPOP","STR(COF.NUMERO)",10,'Elija la Orden de '+korte)
ENDIF
IF !USED("COF1")
	=MEN_LIN(ABA+"Ordenes de "+korte+" a Futuro")
	=PRXAREA(.T.)
	=GETDBF('ORDCOF1',"NUMERO","COF1",7)
ENDIF
RETURN MEN_LIN(BOTOM)
