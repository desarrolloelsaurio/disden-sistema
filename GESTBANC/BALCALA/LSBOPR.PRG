*******************************************************************************
*-- Programa: LSBOPR.PRG
*-- Fecha   : 05-13-92 04:41pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE RESUMEN DE CUENTA CORRIENTE
********************************************************************************
ulpr=HORA_ulp(program())
IF cheqseg()
	=working()
	NADA=GENTMP()
	SELE CAJ
	IF ".T."=FISC
		INDE ON Caja TO (NADA) COMP
	ELSE
		INDE ON Caja TO (NADA) FOR eval(FISC) COMP
	ENDIF
	ACLA=PAIP+PADC("CUENTA",30)+PAIP+PADC("DEBE",13)+PAIP+PADC("HABER",13)+PAIP+PADC("SALDO",13)+PAIP
	LNS=REPL("=",LEN(ACLA))
	TT='Listado de Saldos'+ttque
	=unwork()
	=WIN0()
	pag=1
	=CABPAN()
	=tit_lns(1)
	do opban
	STORE NUL TO GDEBE,GHABER
	PICU='99,999,999.99'
	scan
		m.cod_ban = STR(MIX.NU1,2)
		if XSEEK(m.cod_ban,'CAJ','CAJA')
			IF ROW()=21
				IF TLSBOPR1("SUBTOTAL")=27
					EXIT
				ENDIF
				CLEA
				STOR pag+1 TO pag
				=CABPAN()
				=tit_lns(2)
			ENDIF
			STORE NUL TO DEBE,HABER
			abc=Q_SALBAN(m.cod_ban,'DEBE','HABER',fisc)
			if !empty(debe+haber)
				? PAIP
				?? PADR(ALLTRIM(MIX.TEXTO1)+' N§'+ALLTRIM(MIX.TEXTO2),30)
				?? PAIP
				?? DEBE PICT PICU
				GDEBE=GDEBE+DEBE
				?? PAIP
				?? HABER PICT PICU
				GHABER=GHABER+HABER
				?? PAIP
				?? HABER-DEBE PICT PICU
				?? PAIP
			endif
		endif
	ENDs
	if last()#27
		=TLSBOPR1("TOTAL")
	endif
	=relewin("WIN")
	=OPCAJ(JANNRO,.F.,.T.)
	=iaud(fisc)
ELSE
	=iaudi()
ENDIF
RETURN men_lin(botom)

function TLSBOPR1
	parameter cosa
	private cosa
	? LNS
	? PAIP
	?? PADR(COSA,30)
	?? PAIP
	?? GDEBE PICT PICU
	?? PAIP
	?? GHABER PICT PICU
	?? PAIP
	?? GHABER-GDEBE PICT PICU
	?? PAIP
return(inkey(nul))
