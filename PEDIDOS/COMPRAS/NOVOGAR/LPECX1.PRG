* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �    ARCHIVO: LPECX1.PRG                                                   �
* �       AUTOR: G. REINER                                                   �
* � Date created: 02-08-93                                                   �
* � Time created: 02:20:52pm                                                 �
* �    Copyright: 1993 by SISTEMAS INFORMATICOS S.R.L.                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
* CUERPO DE IMPRESION LISTADO DE NOTAS DE PEDIDO DE COMPRA
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP

FUNCTION LPECX1
	? PAIP
	?? PEC.FECHA
	?? PAIP
	?? PEC.PEDIDO
	?? PAIP
	?? STR(PE1.CANTIDAD,XACDIGI)
	?? PAIP
	?? STR(PE1.ENTREGADO,XACDIGI)
	?? PAIP
	?? STR(PE1.CANTIDAD-PE1.ENTREGADO,XACDIGI)
	?? PAIP
	?? IIF(EMPTY(PEC.FECHAENT),PEC.FECHAPROM,PEC.FECHAENT)
	?? PAIP
	?? STR(PE1.MONTO,XACDIGI,2)
	?? PAIP
	TP=PE1.MONTO*PE1.CANTIDAD
	?? STR(TP,XACDIGI,2)
	?? PAIP
	STORE CASOS+1 TO CASOS
	STORE PE1.CANTIDAD+CP TO CP
	STORE PE1.ENTREGADO+CE TO CE
	STORE TP+TTL TO TTL
RETURN .T.
