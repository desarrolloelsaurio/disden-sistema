* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �    ARCHIVO: LPECY1.PRG                                                   �
* �       AUTOR: G. REINER                                                   �
* � Date created: 02-05-93                                                   �
* � Time created: 01:57:44pm                                                 �
* �    Copyright: 1993 by SISTEMAS INFORMATICOS S.R.L.                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
