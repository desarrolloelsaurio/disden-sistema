* LIN: .T. -> LINEA .F. LNS
* TX : TEXTO A IMPRIMIR
* EJ : .T. HAY EJECT PAGE
FUNCTION IMP_CANT
	PARAMETER LIN,TX,EJ
	? IIF(LIN,LINEA,LNS)
	_WRAP=.F.
	?
	? TX+':'
	?? STR(CASOS,10)
	IF EJ
		EJECT PAGE
		?
	ELSE
		=INKEY(0,"HM")
	ENDIF
return .t.
