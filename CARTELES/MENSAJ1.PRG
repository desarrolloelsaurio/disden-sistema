*********************************************************************************
*-- Programa: mensaj1.prg
*-- Fecha   : 10-22-91 09:32pm
*-- Version : G. REINER
*-- Notas   : MANDA UN MENSAJE DURANTE UN MINUTO Y DESAPARECE
********************************************************************************
FUNCTION MENSAJ1
	PARAMETER CS
	PRIVATE CS,VENTANT
	#DEFINE NUL    0                              && NUL
	M.VENTANT=WONTOP()
	=MOVEWIN(10,NUL,14,78,'FIC',' ** MENSAJE ** ')
	@ 1,nul SAY PADC(ALLTRIM(CS),77,"*") COLO SCHE 19
	=INKEY(0,"HM")
	=RELEWIN("FIC")
	IF !EMPTY(M.VENTANT)
		ACTI WIND (VENTANT)
	ENDIF
RETURN
