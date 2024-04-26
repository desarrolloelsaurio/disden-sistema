********************************************************************************
*-- Programa: OPRUB.PRG
*-- Fecha   : 01-21-93 04:53pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO RUBROS
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

IF ESOPEN(RUVROS,16,"RUB")
	USE (pathpro+'\RUBROS') order tag rubro ALIAS rub
ENDIF
IF rubpop
	DEFI POPU rubpop ;
	FROM MAX(2,rubpopr),rubpopc ;
	TO 22,MIN(79,RUBPOPC+32);
	PROMPT FIELD rub.rubro ;
	MESS 'Elija el '+RUVRO ;
	SHAD ;
	COLOR SCHE 3 ;
	in screen
	ON SELE POPU rubpop DO resp1
ELSE
	RELE POPU rubpop
ENDIF
=men_lin(botom)
RETURN
