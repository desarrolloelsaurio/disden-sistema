******************************************************************************
*-- Programa: LRECIC.PRG
*-- Fecha   : 10-14-92 11:47am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA - TIPO B
*-- MODIFICACION goyo ADAPTACION FACTURAS - RECIBOS (TIPO B)
*-- MODIFICACION GOYO / NOVOGAR
*-- PAGOS CON CHEQUES
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE fac
	picu="999,999,999.99"
	W=PAIP
	IF TYPE("ESARROYO")#"U" .AND. ESARROYO
		=impresor("LPT2")
	ELSE
		=IMPRESOR("LPT1")
	ENDIF
	STOR NUL TO CASOS
	STOR 90 TO T1
	C1=2
	C2=18
	C7=48
	C3=60
	C4=C3+10
	C5=55
	C6=60
	STORE "" TO NLQ1,NLQ2
	IF TYPE("ESARROYO")#"U" .AND. ESARROYO .AND. LEFT(ULPR,5)="LRECI"
		STORE .F. TO LPT1
		STORE .T. TO LPT2
	ELSE
		RELE LPT1,LPT2,LPT3
	ENDIF
	=cabpri3(2,36)
	PRINTJOB
	***************************************************
	? nlq2
	? 'RECIBO N§:'+NADAREC AT 40
	? IIF(SUCU='0002',"ARROYO SECO","ROSARIO") AT 40
	?? ', '
	?? DATECOMP(DATE())
	=XSEEK(FAC.CODCLI,"PER","CODCLI")
	?
	?? NLQ2
	? "RECIBIMOS DEL SR. " at 40
	IF FAC.CODCLI='CN CONTADO' .OR. LEFT(PER.CLIENTE,7)='TARJETA'
		if FILE(PATHVEN+'\A'+right(FAC.FACTURA,7)+'.TMP')
			REST FROM (PATHVEN+'\A'+right(FAC.FACTURA,7)+'.TMP') ADDI
			? M.CLITXTNA at 40
			? M.CLITXTAD at 40
			? M.CLITXTLO at 40
			?? nlq2
			IF PER.CLIENTE='TARJETA'
				? alltrim(PER.CLIENTE) at 40
				?? '-'
				?? 'N§ '
				?? M.CLITXTNT
			ELSE
				?
			ENDIF
		endif
		? 'CONSUMIDOR FINAL' at 40
	ELSE
		? PER.cliente at 40
		?? nlq2
		? Alltrim(PER.domicilio) at 40
		=XSEEK(PER.localidad,'mix','CIUCOD')
		STORE mix.texto1 TO nada
		? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")" at 40
		=XSEEK(right(MIX.TEXTO2,2),'MIX','PRVCOD')
		?? ' - '
		?? alltrim(mix.texto1)
		?? nlq2
		?
		? ALLTRIM(SAYMIX(PER.CONDIVA,"IVACOD")) at 40
		? PER.NROIVA AT 40
	ENDIF
	? OFFNLQ
	? "LA SUMA DE "+ALLTRIM(UPPER(xauss))+' '
	TT=say_num(m.SUMPAG)
	IF LEN(TT)>80
		TT1=left(tt,80)
		tt2=rat(tt1,' ')
		tt3=left(tt1,tt2-1)
		? padr(TT3,80,'-')
		TT3=SUBSTR(TT,TT2+2)
		? padr(TT3,80,'-')
	ELSE
		? PADR(TT,80,'-')
	ENDIF
	TT='EN PAGO DE LA FACTURA '+fac.factura+' del '+dtoc(fac.fechaem)+' c/venc. el d¡a '+dtoc(fac.fechave)
	? padr(tt,80,'-')
	if fac.fechave#date()
		?
		? 'Retraso:'
		?? alltrim(str(date()-fac.fechave))
		?? ' d¡as'
	endif
	?
	? "DISCRIMINACION DEL PAGO"
	if !empty(cheques)
		SELE CCH
		SET ORDER TO TAG CODCLI
		SEEK FAC.CODCLI
		STORE NUL TO TT
		ACLA=PAIP+"FECHA CH"+PAIP+PADC("NUMERO",15)+PAIP+PADC("BANCO",20)+PAIP+PADC("MONTO",14)+PAIP
		LINEA=REPL("=",LEN(ACLA))
		? LINEA
		? ACLA
		? LINEA
		SCAN WHILE CCL.CODCLI=PER.CODCLI
			IF CCL.NUMERE=NADAREC
				? PAIP
				?? FECHADE
				?? PAIP
				?? NROCHE
				?? PAIP
				?? BANCO
				?? PAIP
				?? MONTO PICT PICU
				?? PAIP
				TT=TT+MONTO
			ENDIF
		ENDS
		? LINEA
		? PAIP+"T. CHEQ."+PAIP+SPACE(15)+PAIP+SPACE(20)+PAIP
		?? TT PICT PICU
		?? PAIP
		? LINEA
	endif
	IF !EMPTY(M.EFECAUS)
		? XAUSS
		?? ':' AT 46
		?? M.EFECAUS PICT PICU
	ENDIF
	IF !EMPTY(M.EFECDOL)
		? XADOLS
		?? ':' AT 46
		?? M.EFECDOL PICT PICU
	ENDIF
	? "TOTAL"
	?? ':' AT 46
	?? M.SUMPAG PICT PICU
	_WRAP=.F.
	_lmargin=NUL
	?
	EJECT PAGE
	ENDP
	=FINIMP()
	=iaud(FAC.FACTURA)
	RELE LPT1,LPT2,LPT3
else
	=iaudi()
endi
=MEN_LIN(BOTOM)
RETURN
