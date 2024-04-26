* ษออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : REOPXXX.PRG                    บ
* บ COMENTARIO    : BORRA TEMPORALES Y REABRE BASE บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION REOPXXX
	PARAMETER RE_ALIAS
	IF USED(RE_ALIAS)
		SELE (RE_ALIAS)
		F_AB=FULL(DBF(RE_ALIAS))
		IF !BORTEMP(F_AB)
			USE IN (RE_ALIAS)
		ENDIF
	ENDIF
RETURN .T.
