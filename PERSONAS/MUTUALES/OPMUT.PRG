********************************************************************************
*-- Programa: OPMUT.PRG
*-- Fecha   : 10-07-92 03:07pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE MUTUALES
********************************************************************************
IF ESOPEN("Obras Sociales",6,'MUX')
	USE (PATHPRO+'\MUTUALDAT') ORDER TAG CODPLAN ALIAS MUX
ENDIF
IF MUXPOP
	DEFI POPU MUXPOP FROM MUTpopr,MUTpopc PROMPT FIELD MUT.MUTUALABR+'-'+MUT.PLAN SHAD COLOR SCHE 3 IN SCREEN
	ON SELE POPU MUXPOP DO resp1
ENDIF
IF ESOPEN("Obras Sociales",5,'MUT')
	USE (PATHPRO+'\MUTUALES') ORDER TAG MUTUAL ALIAS MUT
ENDIF
IF MUTpop
	DEFI POPU MUTPOP FROM MUTpopr,MUTpopc PROMPT FIELD MUT.MUTUALABR SHAD COLOR SCHE 3 IN SCREEN
	ON SELE POPU MUTPOP DO resp1
ENDIF
RETURN men_lin(botom)
