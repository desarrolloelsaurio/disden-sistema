* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �    ARCHIVO: LRECX1.PRG                                                   �
* �       AUTOR: G. REINER                                                   �
* � Date created: 02-08-93                                                   �
* � Time created: 02:20:52pm                                                 �
* �    Copyright: 1993 by SISTEMAS INFORMATICOS S.R.L.                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
* CUERPO DE IMPRESION LISTADO DE REMITOS DE COMPRA
FUNCTION LRECX1
	? PAIP
	?? REC.FECHA
	?? PAIP
	?? REC.REMITO
	?? PAIP
	?? STR(RE1.CANTIDAD,XACDIGI)
	?? PAIP
	?? REC.FACTURA
	?? PAIP
	?? REC.FECHAFAC
	?? PAIP
	?? STR(RE1.MONTO,XACDIGI,2)
	?? PAIP
	TP=RE1.MONTO*RE1.CANTIDAD
	?? STR(TP,XACDIGI,2)
	?? PAIP
	STORE CASOS+1 TO CASOS
	STORE RE1.CANTIDAD+CP TO CP
	STORE TP+TTL TO TTL
RETURN .T.
