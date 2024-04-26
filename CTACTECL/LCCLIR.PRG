* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCCLIR.PRG                                  บ
* บ COMENTARIO    : LISTA SALDOS CTA CTE CLIENTES POR IMPRESORA บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                    บ
* บ FECHA      : 08-26-93                                       บ
* บ HORA       : 02:23:55pm                                     บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                        บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
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
