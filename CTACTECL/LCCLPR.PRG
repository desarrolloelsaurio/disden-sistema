* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCCLPR.PRG                                     บ
* บ COMENTARIO    : LISTADO DE SALDOS DE CUENTA CORRIENTE CLIENTES บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                       บ
* บ FECHA      : 08-26-93                                          บ
* บ HORA       : 02:15:13pm                                        บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                           บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
