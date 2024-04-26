* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : XLIQ.PRG                                                 บ
* บ COMENTARIO    : REINDEXA BASE DE PERSONAS                                บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PROCEDURE XLIQ
	IF CHEQSEG()
		=men_lin("Reindexando Archivo de Liquidaciขn")
		=DOTALK()
		SELE LIQ
		=FLOCK("LIX") .OR. FLOK("LIX")		
		=FLOCK("LIQ") .OR. FLOK("LIQ")
		=OPLIQ(.F.,.T.)
		PACK
		INDEX ON TPR+STR(NUMERO) TAG NUMERO
		INDEX ON TPR+STR(NUMERO)+PRACTICA+PRXCOD TAG PRACTICA
		INDEX ON PACIENTE TAG PACIENTE
		SELE LIX
		INDEX ON TPR+STR(NUMERO)+PRACTICA+PRXCOD TAG NUMER1
		SELE LIQ
		TX="CREA INDICE "
		=IAUD(TX)
		=OPLIQ(.T.)
		=UNTALK()
	ELSE
		=IAUDI()
	ENDIF
RETURN
