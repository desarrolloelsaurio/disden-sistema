******************************************
*-- Programa: OPMER.PRG
*-- Fecha   : 12/13/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MERCADERIAS
******************************************
IF ESOPEN("Mercader¡as",14,"MER")
	USE (path+'\MERCA') ORDER TAG MERCA  ALIAS mer
ELSE
	SET ORDER TO TAG MERCA
ENDIF
IF ESOPEN("",15,"MEX")
	USE (path+'\MERCA1') ORDER TAG MERCA  ALIAS mex
ELSE
	SET ORDER TO TAG MERCA
ENDIF
IF merpop
	DEFI POPU merpop ;
	FROM MAX(2,merpopr),merpopc ;
	TO 22,MIN(79,MERPOPC+40) ;
	PROM FIELD mer.palpopup ;
	MESS ' Elija la Mercader¡a ' ;
	SHAD ;
	COLOR SCHE 3 ;
	IN SCREEN
	ON SELE POPU merpop DO resp1
ELSE
	RELE POPU merpop
ENDIF
RETURN MEN_LIN(BOTOM)
