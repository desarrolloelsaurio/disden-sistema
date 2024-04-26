*******************************************************************************
*-- Programa: LSBOPX.PRG
*-- Fecha   : 07-30-92 08:30am
*-- Version : R. 'EL BATA'
*-- Notas   : LISTADO DE RESUMEN DE CUENTA CORRIENTE POR FECHA
********************************************************************************
ulpr=HORA_ulp(program())
IF CHEQSEG()
	=working()
	NADA=GENTMP()
	SELE CAJ
	IF ".T."=FISC
		INDE ON fechaop TO (NADA) COMP
	ELSE
		INDE ON fechaop TO (NADA) FOR eval(FISC) COMP
	ENDIF
	ACLA=PAIP+PADC("FECHA",8)+PAIP+PADC("DEBE",13)+PAIP+PADC("HABER",13)+PAIP+PADC("SALDO",13)+PAIP
	LNS=REPL("=",LEN(ACLA))
	TT=ttque
	=unwork()
	STORE NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=tit_lns(3)
	PICU='99,999,999.99'
	STORE NUL TO GDEBE,GHABER
	DO WHILE !EOF()
		IF _PLINENO>63
			=TLSBOIX("SUBTOTAL")
			EJECT PAGE
			=CABPRI1()
			=tit_lns(4)
		ENDIF
		store nul to DEBE,HABER
		m.fechaop = caj.fechaop
		scan while m.fechaop = caj.fechaop
			if caj.monto>nul
				HABER=HABER+caj.monto
			else
				DEBE =DEBE +abs(caj.monto)
			endif
		endscan
		GHABER=GHABER+HABER
		GDEBE=GDEBE+DEBE
		if !empty(debe+haber)
			? PAIP
			?? dtoc(m.fechaop)
			?? PAIP
			?? DEBE PICT PICU
			?? PAIP
			?? HABER PICT PICU
			?? PAIP
			?? GHABER-GDEBE PICT PICU
			?? PAIP
		endif
	ENDDO
	ENDP
	=TLSBOIX("TOTAL")
	=finimp()
	=OPCAJ(JANNRO,.F.,.T.)
	=IAUD((FISC))
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION TLSBOIX
	PARAMETER COSA
	PRIVATE COSA
	? LNS
	? PAIP
	?? PADR(COSA,8)
	?? PAIP
	?? GDEBE PICT PICU
	?? PAIP
	?? GHABER PICT PICU
	?? PAIP
	?? GHABER-GDEBE PICT PICU
	?? PAIP
RETURN .T.
