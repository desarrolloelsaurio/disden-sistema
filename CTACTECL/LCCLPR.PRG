* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LCCLPR.PRG                                     �
* � COMENTARIO    : LISTADO DE SALDOS DE CUENTA CORRIENTE CLIENTES �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                       �
* � FECHA      : 08-26-93                                          �
* � HORA       : 02:15:13pm                                        �
* � COPYRIGHT  : 1993 by GREGORIO REINER                           �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STORE "" TO ACLA,LNS,TT,PICU,GDEBE,GHABER,CASOS,PICU
	=LCCLR0()
	=WIN0()
	PAG=1
	=CABPAN()
	=TIT_LNS(1)
	SELE PER
	SCAN
		IF ROW()=21
			IF LCCLR2("SUBTOTAL",.T.)=27
				EXIT
			ENDIF
			CLEA
			STOR PAG+1 TO PAG
			=CABPAN()
			=TIT_LNS(2)
		ENDIF
		=LCCLR1()
	ENDSCAN
	IF LAST()#27
		=LCCLR2("TOTAL")
		=FIN_LNS(2,CASOS)
	ENDIF
   =RELEWIN("WIN")
   =IAUD(FISC)
   =IIF(SSTM1="ADMIN",IIF(SSTM2="EXPENSAS",REOPCSS(),REOPINQ(.T.)),REOPCLI())
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
