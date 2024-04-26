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
	=WIN0()
	pag=1
	=CABPAN()
	=tit_lns(1)
	PICU='99,999,999.99'
	STORE NUL TO GDEBE,GHABER
	do while !EOF()
		IF ROW()=21
			IF TLSBOPR1("SUBTOTAL")=27
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=CABPAN()
			=tit_lns(2)
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
	if last()#27
		=TLSBOPR1("TOTAL")
	endif
	=relewin("WIN")
	=OPCAJ(JANNRO,.F.,.T.)
ELSE
	=iaudi()
ENDIF
RETURN men_lin(botom)

function TLSBOPR1
	parameter cosa
	private cosa
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
return inkey(nul)
