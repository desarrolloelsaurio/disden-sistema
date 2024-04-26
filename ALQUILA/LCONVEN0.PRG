* ษอออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCONVEN0.PRG                      บ
* บ COMENTARIO    : CUERPO DE LISTADO DE VENCIMIENTOS บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LCONVEN0
	#DEFINE PAIP   "|"                            && PAIP
	#DEFINE NUL     0                             && NUL
	? IIF(P_PAN,"",PAIP)
	?? CODINM
	?? PAIP
	?? LEFT(DOMICILIO,LA_LARG1)
	?? PAIP
	?? SAYPER(PROCOD,"PRPCOD",LA_LARGO)
	?? PAIP
	?? SAYPER(CODCLI,"INQCOD",LA_LARGO)
	?? PAIP
	?? FECHAVENC
	?? IIF(P_PAN,"",PAIP)
	STORE CASOS+1 TO CASOS
RETURN .T.
