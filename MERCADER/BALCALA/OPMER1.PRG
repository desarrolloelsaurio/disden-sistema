********************************************************************************
*-- Programa: OPBAN.PRG
*-- Fecha   : 06/12/91 01:50pm
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO BANCOS
********************************************************************************
=men_lin(PADC('Abriendo archivo de Bancos',80,"�"))
SELE 1
IF ALIAS()#'MIX'
	USE (PATHVEN+'\MIXTA') INDEX (PATHVEN+'\MIXTA') ALIAS mix
ENDIF
SET FILTER TO filtro='B'
IF banpop
	DEFI POPU banpop FROM banpopr,banpopc PROMPT FIELD mix->texto1 MESS 'Elija el Banco' SHAD colo sche 3 IN SCREEN
	ON SELE POPU banpop DO resp1
ELSE
	RELE POPU banpop
ENDIF
=MEN_LIN(BOTOM)
RETURN
P 386369991                        FF                      F             522     13698                5274     13674 45676 ..\..\\LISTADOS\IMPRIME.PRG                                                                                                      P 407005507                  3@�~�,{ ***************** INICIO comercin_lin(botom)
RETURN
