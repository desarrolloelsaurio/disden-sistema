* 浜様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LCO1R1.PRG             �
* � COMENTARIO    : CUERPO - LCO1PR/LCO1IR �
* 麺様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER               �
* � FECHA      : 08-16-93                  �
* � HORA       : 06:37:22pm                �
* � COPYRIGHT  : 1993 by GREGORIO REINER   �
* 藩様様様様様様様様様様様様様様様様様様様夕
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
