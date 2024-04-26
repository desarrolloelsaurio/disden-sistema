* ษออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCO1R1.PRG             บ
* บ COMENTARIO    : CUERPO - LCO1PR/LCO1IR บ
* ฬออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER               บ
* บ FECHA      : 08-16-93                  บ
* บ HORA       : 06:37:22pm                บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER   บ
* ศออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LCO1R1
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
	? PAIP
	?? STR(NUMERO)
	?? PAIP
	?? COR.FECHAINI
	?? PAIP
	?? MER.ARTICULO
	?? PAIP
	?? MER.MERCA
	?? PAIP
	?? STR(CANTINI, XACDIGI)
	?? PAIP
	STORE CASOS+1 TO CASOS
	STORE CANTINI+TOTAL TO TOTAL
RETURN .T.
