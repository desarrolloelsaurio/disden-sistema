* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    ARCHIVO: LPECY1.PRG                                                   ³
* ³       AUTOR: G. REINER                                                   ³
* ³ Date created: 02-05-93                                                   ³
* ³ Time created: 01:57:44pm                                                 ³
* ³    Copyright: 1993 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP

FUNCTION LPECY1
	? PAIP
	?? LIS.ARTI
	?? PAIP
	?? LIS.MERCA
	IF FILART=1
		?? PAIP
		?? LEFT(LIS.MARCA,IIF(PORPAN,10,20))
	ENDIF
	?? PAIP
	?? STR(LIS.CANTIDAD,XACDIGI)
	?? PAIP
	?? STR(LIS.MONTO,XACDIGI,2)
	?? PAIP
	GCAN=GCAN+LIS.CANTIDAD
	GMON=GMON+LIS.MONTO
RETURN .T.
