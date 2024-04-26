* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCNS1.PRG             บ
* บ COMENTARIO    : LISTADO DE CONSORCIOS บ
* ศอออออออออออออออออออออออออออออออออออออออผ
FUNCTION LCNS1
	PARAMETER L_PAN
	#DEFINE PAIP   "|"                             && PAIP
	? PAIP
	?? CNS.CONSORCIO
	?? PAIP
	?? CNS.CONCOD
	?? PAIP
	?? CNS.DIRECCION
	?? PAIP
	?? SAYMIX(cns.LOCALIDAD,'CIUCOD',9)
	IF L_PAN
		STORE CASOS+1 TO CASOS
	ELSE
		=IMPUSE()
	ENDIF
RETURN .T.
