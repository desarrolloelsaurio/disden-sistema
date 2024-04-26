********************************************************************************
*-- Programa: MUTGRL.PRG
*-- Fecha   : 09/12/91 12:34pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP MUTGRL
********************************************************************************
PARAMETER R,C,t,DEAUNO
respuesta='MUTgrl#'+str(R)+'#'+str(C)+'#'+t+'#3#\<Todas las Mutuales#Por \<Localidad'
IF DEAUNO
	RESPUESTA=RESPUESTA+'#\<Una Mutual'
ENDIF
UNLO ALL
RETURN defpop()
