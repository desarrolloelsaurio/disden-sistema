*:*********************************************************************
*-- Programa: mliq2.PRG
*-- Fecha   : 25/04/92
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA CABEZA LIQ.
*:*********************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	=win0()
	pag=1
	=cabpan()
	store RIGHT('9999999,999,999.99',xacdigi) to picu
	sele tix
	INDE ON unicod to (GENTMP()) for tix.concod=cns.concod uniq COMP
	count to m.cuant
	DIME SSUM[M.CUANT],INDICE[M.CUANT]
	STORE NUL TO PUNTERO
	scan
		PUNTERO=PUNTERO+1
		INDICE[PUNTERO]=unicod
	endS
	use
	STORE NUL TO SSUM,PUNTERO,m.ttot
	sele liq
	scan
		PUNTERO=iif(PUNTERO<m.cuant,PUNTERO+1,1)
		ssum[PUNTERO]=ssum[PUNTERO]+monto
	ends
	store paip+PADC("UNIDAD",10)+paip+PADC("TIPO",20)+paip+PADC("PROPIETARIO",30)+paip+PADC("MONTO",xacdigi)+PAIP to acla
	lns=REPL("=",len(ACLA))
    tt="Liquidaci¢n Consorcio:"+alltrim(cns.consorcio)
	=tit_lns(1)
	sele CNX
	SET RELA TO tipO INTO MIX
	SET ORDER TO TAG TIPCOD IN MIX
	SET RELA TO CODCLI INTO PER addi
	SET ORDER TO TAG CSSCOD IN PER
	scan for CNX.concod=cns.concod
		IF ROW()>21
			if !fin_lns(1,nul)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=tit_lns(2)
		ENDIF
		m.cual=ascan(indice,tipo)
		m.importe=ssum[m.cual]*porcentaje/100
		store m.ttot+m.importe to m.ttot
		?PAIP
		??denom
		??paip
		??mix.texto1
		??paip
		??PER.cliente
		??paip
		??tran(m.importe,picu)
		??paip
	ENDS
	? LNS
	? PAIP
	?? PADR('TOTALES',LEN(LNS)-3-XACDIGI)
	?? PAIP
	?? TRAN(M.TTOT,PICU)
	?? PAIP
	=FIN_LNS(2,NUL)
	=RELEWIN('WIN')
	=REOPCNX()
	SET ORDER TO TAG CONSORCI IN PER
ELSE
	=IAUDI()
ENDI
RETURN
