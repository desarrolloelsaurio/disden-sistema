* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LKARP.PRG                                                �
* � COMENTARIO    : LISTADO DE KARDEX POR PANTALLA                           �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-16-93                                                    �
* � HORA       : 00:58:54am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
ULPR=PROGRAM()
IF CHEQSEG()
	SELE kar
	=WIN0()
	PAG=1
	=CABPAN()
	STORE 0 TO suma,resta
	acla="|Nro.OP|FECHA OP|"+padc("TALLER",15)+"|OPER.DE KARDEX|"+padc("DETALLE",17)+"|  CANTIDAD  |"
	lns=REPL("=",LEN(acla))
	sele kar
	=TIT_LNS(1)
	SCAN FOR &FISC
		IF ROW()=21
			IF !FIN_LNS(1,0,SPACE(51)+"Cantidad Total: "+STR(suma-resta ,10,2))
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=CABPAN()
			=TIT_LNS(2)
		ENDIF
		=LKARP0()
	ENDSCAN
	=FIN_LNS(2,0,SPACE(51)+"Cantidad Total: "+STR(suma-resta ,10,2))
	=RELEWIN("WIN")
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
