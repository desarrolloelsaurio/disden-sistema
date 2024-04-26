********************************************************************************
*-- Programa: LFACPZ.PRG
*-- Fecha   : 4-16-92
*-- Version : R. 'EL BATA'/G. REINER
*-- Notas   : IMPRESION DE FACTURAS POR PANTALLA
********************************************************************************
STORE PROGRAM() TO ULPR
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
		tmp=GENTMP()
		IF FILASG # 2
			SELE FAC
			INDE ON FACTURA to (tmp) for EVAL(FISC) COMP
		ELSE
			SELE FAC
			SET ORDER TO TAG FACTURA
			SELE FAX
			SET RELATION TO FAX.FACTURA INTO FAC
			SELE FAX
			INDE ON FACTURA to (tmp) for EVAL(FISC) UNIQ COMP
		ENDIF
		=UNWORK()
		=WIN0()
		pag=1
		=cabpan()
		STORE nul TO casos
		acla=HAZ_ACLA()
		linea=REPL("=",LEN(acla))
		tt='Listado de '+PROP(TIT_INVOS)+TTQUE
		=tit_lin(1)
		SCAN
			IF ROW()>21
				if hay
					IF !FIN_LIN(1,NUL,FIN_SUM('SUBTOTAL',@TTL))
						EXIT
					ENDIF
				else
					IF !FIN_LIN(1,NUL)
						EXIT
					ENDIF
				endif
				CLEA
				STOR pag+1 TO pag
				=cabpan()
				=tit_lin(2)
			ENDIF
			?paip
			=iif(variable[1],qout(SUCU+'-'+ZERO(FAC.FACTURA,8)+paip),'')
			=iif(variable[2],qout(DTOC(FAC.FECHAEM)+paip),'')
			=IIF(VARIABLE[3],QOUT(DTOC(FAC.FECHAVE)+PAIP),'')
			=IIF(VARIABLE[4],QouT(FAC.TIPO+PAIP),'')
			=IIF(VARIABLE[5],QOUT(left(PER.CLIENTE,texto[5,2])+PAIP),'')
			=IIF(VARIABLE[6],QOUT(left(VIA.VIAJANTE,texto[6,2])+PAIP),'')
			=IIF(VARIABLE[7],QOUT(left(MIX.TEXTO1,texto[7,2])+PAIP),'')
			IF VARIABLE[8]
				M=ABS(MONTO)
				IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
					?? str(0-m,xacdigi,2)
					ttl[8]=ttl[8]-m
				ELSE
					?? str(m,xacdigi,2)
					ttl[8]=ttl[8]+m
				ENDIF
				?? paip
				CTRL[8]=.T.
			endif
			IF VARIABLE[9]
				D=ABS(FAC.DESCUENTO)
				IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
					?? str(0-d,xacdigi,2)
					ttl[9]=ttl[9]-d
				ELSE
					?? str(d,xacdigi,2)
					ttl[9]=ttl[9]+d
				ENDIF
				?? paip
				CTRL[9]=.T.
			endif
			IF VARIABLE[10]
				M=ABS(FAC.MONTOBRU)
				IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
					?? str(0-m,xacdigi,2)
					ttl[10]=ttl[10]-m
				ELSE
					?? str(m,xacdigi,2)
					ttl[10]=ttl[10]+m
				ENDIF
				?? paip
				CTRL[10]=.T.
			endif
			if variable[11]
				M=ABS(FAC.MONTOIVA)
				IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
					?? str(0-M,xacdigi,2)
					ttl[11]=ttl[11]-m
				ELSE
					?? str(M,xacdigi,2)
					ttl[11]=ttl[11]+m
				ENDIF
				?? paip
				CTRL[11]=.T.
			endif
			if variable[12]
				M=ABS(FAC.MONTOOT2)
				IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
					?? str(0-M,xacdigi,2)
					ttl[12]=ttl[12]-m
				ELSE
					?? str(M,xacdigi,2)
					ttl[12]=ttl[12]+m
				ENDIF
				?? paip
				CTRL[12]=.T.
			endif
			if variable[13]
				M=ABS(FAC.MONTOOT3)
				IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
					?? str(0-M,xacdigi,2)
					ttl[13]=ttl[13]-m
				ELSE
					?? str(M,xacdigi,2)
					ttl[13]=ttl[13]+m
				ENDIF
				?? paip
				CTRL[13]=.T.
			endif
			if variable[14]
				M=ABS(FAC.MONTONET)
				IF FIL_INVO=='.T.' .AND. FAC.TIPO='NC'
					?? str(0-m,xacdigi,2)
					ttl[14]=ttl[14]-m
				ELSE
					?? str(m,xacdigi,2)
					ttl[14]=ttl[14]+m
				ENDIF
				?? paip
				CTRL[14]=.T.
			endif
			casos=casos+1
		ENDSCAN
		IF LAST()#27
			if hay
				=FIN_LIN(2,CASOS,FIN_SUM('TOTAL',@TTL))
			else
				=FIN_LIN(2,CASOS)
			endif
		ENDIF
		=iaud((fisc))
		=RELEWIN('win')
		=REOPFAC()
	ELSE
		=iaudi()
	ENDIF
	=men_lin(BOTOM)
RETURN
