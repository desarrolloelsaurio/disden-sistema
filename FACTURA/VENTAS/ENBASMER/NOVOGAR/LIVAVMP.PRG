* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LIVAVMP.PRG                                              �
* � COMENTARIO    : LIBRO DE IVA POR MERCADERIAS                             �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-20-93                                                    �
* � HORA       : 00:45:57am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE NUL  0                                   && NUL
#DEFINE BOTOM "  "+repl("�",78)                  && BOTOM
STORE HORA_ULP(PROGRAM()) TO ULPR
=CHEQSEG()
STORE nul TO casos,LINEA,ACLA
STORE nul TO IVA09,IVA18,NGRA,CTD,TTL
STORE nul TO TIVA09,TIVA18,TNGRA,TCTD,TTTL
#UNDEFINE BOTOM
=LIVAVM0()
=WIN0()
PAG=1
=CABPAN()
=TIT_LIN(1)
GO TOP
STORE ARTICULO TO ELART
SCAN
	IF ARTICULO#ELART
		=LIVAVM1()
	ENDIF
	IF ROW()>21
		=LIVAVM2("SUBTOTAL")
		IF !FIN_LIN(1,NUL)
			EXIT
		ENDIF
		CLEA
		STOR PAG+1 TO PAG
		=CABPAN()
		=TIT_LIN(2)
	ENDIF
	=LIVAVM3()
ENDSCAN
=LIVAVM1()
=LIVAVM2("TOTAL")
=FIN_LIN(2,CASOS)
=RELEWIN("win")
=IAUD(FISC)
=REOPFAC()
RETURN MEN_LIN(BOTOM)
