* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LIVAVM1.PRG                                              �
* � COMENTARIO    : IMPRIME DATOS EN CAMBIO DE PRODUCTO                      �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION LIVAVM1
#DEFINE NUL    0                               && NUL
#DEFINE PAIP   "|"                             && PAIP
	? PAIP
	?? ELART
	?? PAIP
	?? SAYGRL(ELART,"MER","ARTICULO","MER.MERCA",.T.)
	?? PAIP
	?? STR(CTD,XACDIGI-3)
	?? PAIP
	?? STR(NGRA,XACDIGI,2)
	?? PAIP
	?? STR(IVA18,XACDIGI,2)
	?? PAIP
	?? STR(IVA09,XACDIGI,2)
	?? PAIP
	?? STR(TTL,XACDIGI,2)
	?? PAIP
	TCTD=TCTD+CTD
	TNGRA=TNGRA+NGRA
	TIVA18=TIVA18+IVA18
	TIVA09=TIVA09+IVA09
	TTTL=TTTL+TTL
	STORE ARTICULO TO ELART
	STORE nul TO IVA09,IVA18,NGRA,CTD,TTL
RETURN .T.
