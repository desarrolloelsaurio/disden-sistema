********************************************************************************
*-- Programa: IAUD.PRG
*-- Fecha   : 09/24/91 03:12pm
*-- Version : G. REINER
*-- Notas   : ASIENTA INFORME DE AUDITORIA
*-- Modificaci¢n GOYO 08-12-92 10:03am (si m.apodo es empty - saco if flock)
********************************************************************************
FUNCTION IAUD
	PARAMETER I_TEX,I_MENLIN
	PRIVATE SISTEMA,HORA,PROGRAMA,DETALLE,I_APODO
	IF USED("AUD")
		M.I_APODO=ALIAS()
		SELE AUD
		M.SISTEMA=ALLTRIM(SSTM)
		M.HORA=TIME()
		M.PROGRAMA=ULPR
		M.DETALLE=I_TEX
		=AGRABAR("AUD",.F.,.F.,I_MENLIN)
		IF !EMPTY(M.I_APODO) .AND. ;
        		USED(M.I_APODO)
			SELE (M.I_APODO)
		ENDIF
	ENDIF
RETURN .T.
