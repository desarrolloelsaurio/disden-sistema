* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LCCLIR.PRG                                  �
* � COMENTARIO    : LISTA SALDOS CTA CTE CLIENTES POR IMPRESORA �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                                    �
* � FECHA      : 08-26-93                                       �
* � HORA       : 02:23:55pm                                     �
* � COPYRIGHT  : 1993 by GREGORIO REINER                        �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
	STORE "" TO ACLA,LNS,TT,PICU,GDEBE,GHABER,CASOS
	=LCCLR0()
	STOR NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LNS(3)
	SELE PER
	SCAN
		IF _PLINENO>63
			=LCCLR2("SUBTOTAL")
			=FIN_LNS(3,NUL)
			=CABPRI1()
			=TIT_LNS(4)
		ENDI
		=LCCLR1()
	ENDSCAN
	=LCCLR2("TOTAL")
	=FIN_LNS(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD(FISC)
	=IIF(SSTM1="ADMIN",IIF(SSTM2="EXPENSAS",REOPCSS(),REOPINQ(.T.)),REOPCLI())
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
