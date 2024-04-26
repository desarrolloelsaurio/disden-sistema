******************************************************************************
*-- Programa: LRECIT.PRG
*-- Fecha   : 10-14-92 11:47am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA - TIPO B
*-- MODIFICACION goyo ADAPTACION FACTURAS - RECIBOS (TIPO B)
*-- MODIFICACION goyo RECIBOS POR TARJETA DE CREDITO
*-- MODIFICACION GOYO / NOVOGAR
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE fac
	picu="99,999,999,999.99"
	picu1="999,999.99"
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
	?
	?
	?
	?? NLQ2
	? 'RECIBO N§:'+NADAREC AT 40
	? IIF(SUCU='0005','ROSARIO','ARROYO SECO') AT 40
	?? ', '
	?? DATECOMP(DATE())
	?
	?
	?
	?
	SELE PER
	SET ORDER TO TAG CODCLI
	SEEK fac.codcli
	?
	?? NLQ2
	? "RECIBIMOS DEL SR. "
  IF FAC.CODCLI='CN CONTADO' .OR. LEFT(PER.CLIENTE,7)='TARJETA'
  if FILE(PATHVEN+'\A'+right(FAC.FACTURA,7)+'.TMP')
    REST FROM (PATHVEN+'\A'+right(FAC.FACTURA,7)+'.TMP') ADDI
	?? M.CLITXTNA at 20
	? M.CLITXTAD at 20
	? M.CLITXTLO at 20
	?? nlq2
	IF PER.CLIENTE='TARJETA'
	  ? PER.CLIENTE at 20
	  ?? '-'
	  ?? 'N§ '
	  ?? M.CLITXTNT
	ELSE
      ?
	ENDIF
	else
	?
	?
      ?
	endif
	? 'CONSUMIDOR FINAL' at 20
ELSE
	?? alltrim(PER.cliente) at 20
	?? " ("
	?? alltrim(PER.codcli)
	?? ")"
	?? nlq2
	?
	?? NLQ2
	?? PER.domicilio at 20
	=XSEEK(PER.localidad,'mix','CIUCOD')
	STORE mix.texto1 TO nada
	? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")" at 20
	=XSEEK(right(MIX.TEXTO2,2),'MIX','PRVCOD')
	?? ' - '
	?? alltrim(mix.texto1)
	?? nlq2
	?
	? SAYMIX(PER.CONDIVA,"IVACOD") at 20
	?? PER.NROIVA AT 61
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
?
?
? "DISCRIMINACION DEL PAGO"
?
IF !EMPTY(M.EFECAUS)
? XAUSS
?? ': ' AT 20
?? M.EFECAUS PICT PICU
ENDIF
IF !EMPTY(M.EFECDOL)
? XADOLS
?? ': ' AT 20
?? M.EFECDOL PICT PICU
ENDIF
=XSEEK(LATAR,'MIX','TARCOD')
? MIX.TEXTO1
?? ': ' AT 20
?? M.TARJETA PICT PICU
? 'Nro TARJETA '
?? M.CLITXTNT
?? 'FORMULARIO ' AT 40
?? ELNUMERO
? "TOTAL"
?? ': ' AT 20
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
RETURN MEN_LIN(BOTOM)
