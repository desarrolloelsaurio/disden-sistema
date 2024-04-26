* ษออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : REOPFUT.PRG                        บ
* บ COMENTARIO    : REABRE BASE DE ALQUILERES O FUTURO บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION REOPFUT
	PARAMETER HAY_AMBOS
	IF HAY_AMBOS
		=REOPXXX("FUT")
    RETURN OPALQFUT(.T.)
ELSE
	 =REOPXXX("ALQ")
	 RETURN OPALQ()
ENDIF
