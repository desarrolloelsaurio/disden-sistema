********************************************************************************
*-- Programa: medgrl.PRG
*-- Fecha   : 09/12/91 12:34pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP medgrl
********************************************************************************
PARAMETER R,C,t,DEAUNO
respuesta='medgrl#'+str(R)+'#'+str(C)+'#'+t+'#3#\<Todos los M‚dicos#Por \<Sanatorio#Por \<Ciudad#Por \<Especialidad'
IF DEAUNO
	RESPUESTA=RESPUESTA+'#\<Un M‚dico'
ENDIF
=DEFPOP()
UNLO ALL
RETURN
