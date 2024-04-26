********************************************************************************
*-- Programa: LSTOIT.PRG
*-- Fecha   : 11-06-92 01:59am
*-- Version : G. REINER
*-- Notas   : LISTADO DE STOCK POR IMPRESORA
********************************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR 1 TO CASOS,PAG,RUB1,SRUB1
	STOR "" TO ACLA,m.LINEA,TT,HAY
	DIME ttl[CANT_MAX],ctrl[CANT_MAX],GTL[CANT_MAX],RTL[CANT_MAX]
	STORE .F. TO CTRL
	STORE NUL TO ttl,GTL,RTL
	=LSTOP0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_(3)
	=LP_P2()
	=_LIN(.T.)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,fin_sum("SUBTOTAL",@TTL))
			=LI_CHRUB()
			=LI_NPAGE()
		ELSE
			IF LI_CHRUB()
				=LI_NPAGE()
			ENDIF
		ENDI
		=LstoP1()
	ENDSCAN
	=FIN_LIN(3,NUL,fin_sum(SRUB1,@TTL),.T.)
	=FIN_LIN(3,NUL,fin_sum(RUB1,@RTL),.T.)
	=FIN_LIN(4,CASOS,fin_sum("TOTAL",@GTL))
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
