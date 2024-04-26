********************************************************************************
*-- Programa: lfaciz.prg
*-- Fecha   : 04-27-92 01:43pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	=WORKING()
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	hay=.f.
	for a=8 to CANT_MAX
		if variable[a]
			ttl[a]=nul
			store .t. to hay
		endif
	endf
	if !hay
		rele ttl,ctrl
	endif
	SELE faC
	set order to tag factura
	set order to tag CODCLI IN PER
	set relation to faC.CODCLI INTO PER
	set order to tag CODVIA in VIA
	set relation to faC.CODVIA INTO VIA ADDI
	set order to tag PAGCOD in MIX
	set relation to faC.CONDPAGO INTO MIX ADDI
	stor nul TO casos
	IF FILASG # 2
		SELE FAC
		INDE ON FACTURA TO (GENTMP()) FOR EVAL(FISC) COMP
	ELSE
		SELE FAC
		SET ORDER TO TAG FACTURA
		SELE FAX
		SET RELATION TO FAX.FACTURA INTO FAC
		SELE FAX
		INDE ON FACTURA TO (GENTMP()) FOR EVAL(FISC) UNIQ COMP
	ENDIF
	acla=HAZ_ACLA()
	linea=REPL("=",LEN(acla))
	tt='Listado de '+PROP(TIT_INVOS)+TTQUE
	=UNWORK()
	=MEN_LIN(IMPRIMIENDO)
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN for &FISC
		IF _PLINENO>63
			if hay
				=FIN_LIN(3,NUL,FIN_SUM('SUBTOTAL',@TTL))
			else
				=FIN_LIN(3,NUL)
			endif
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		?paip
		=iif(variable[1],qout(SUCU+'-'+ZERO(FAC.FACTURA,8)+paip),'')
		=iif(variable[2],qout(DTOC(FAC.FECHAEM)+paip),'')
		=IIF(VARIABLE[3],QOUT(DTOC(FAC.FECHAVE)+PAIP),'')
		=IIF(VARIABLE[4],QouT(FAC.TIPO+PAIP),'')
		=IIF(VARIABLE[5],QOUT(left(PER.CLIENTE,texto[5,2])+PAIP),'')
		=IIF(VARIABLE[6],QOUT(left(VIA.VIAJANTE,texto[6,2])+PAIP),'')
		=IIF(VARIABLE[7],QOUT(left(MIX.TEXTO1,texto[7,2])+PAIP),'')
		IF VARIABLE[8]
			M=ABS(FAC.MONTO)
			IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
				?? str(0-M,xacdigi,2)
				ttl[8]=ttl[8]-M
			ELSE
				?? str(M,xacdigi,2)
				ttl[8]=ttl[8]+M
			ENDIF
			?? paip
			CTRL[8]=.T.
		endif
		IF VARIABLE[9]
			M=ABS(FAC.DESCUENTO)
			IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
				?? str(0-M,xacdigi,2)
				ttl[9]=ttl[9]-M
			ELSE
				?? str(M,xacdigi,2)
				ttl[9]=ttl[9]+M
			ENDIF
			?? paip
			CTRL[9]=.T.
		endif
		IF VARIABLE[10]
			M=ABS(FAC.MONTOBRU)
			IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
				?? str(0-M,xacdigi,2)
				ttl[10]=ttl[10]-M
			ELSE
				?? str(M,xacdigi,2)
				ttl[10]=ttl[10]+M
			ENDIF
			?? paip
			CTRL[10]=.T.
		endif
		if variable[11]
			M=ABS(FAC.MONTOIVA)
			IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
				?? str(0-M,xacdigi,2)
				ttl[11]=ttl[11]-M
			ELSE
				?? str(M,xacdigi,2)
				ttl[11]=ttl[11]+M
			ENDIF
			?? paip
			CTRL[11]=.T.
		endif
		if variable[12]
			M=ABS(FAC.MONTOOT2)
			IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
				?? str(0-M,xacdigi,2)
				ttl[12]=ttl[12]-M
			ELSE
				?? str(M,xacdigi,2)
				ttl[12]=ttl[12]+M
			ENDIF
			?? paip
			CTRL[12]=.T.
		endif
		if variable[13]
			M=ABS(FAC.MONTOOT3)
			IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
				?? str(0-M,xacdigi,2)
				ttl[13]=ttl[13]-M
			ELSE
				?? str(M,xacdigi,2)
				ttl[13]=ttl[13]+M
			ENDIF
			?? paip
			CTRL[13]=.T.
		endif
		if variable[14]
			M=ABS(FAC.MONTONET)
			IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
				?? str(0-M,xacdigi,2)
				ttl[14]=ttl[14]-M
			ELSE
				?? str(M,xacdigi,2)
				ttl[14]=ttl[14]+M
			ENDIF
			?? paip
			CTRL[14]=.T.
		endif
		casos=casos+1
	ENDSCAN
	if hay
		=FIN_LIN(4,NUL,FIN_SUM('TOTAL',@TTL))
	else
		=FIN_LIN(4,NUL)
	endif
	?
	ENDP
	=finimp()
	=iaud((FISC))
	=REOPFAC()
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
