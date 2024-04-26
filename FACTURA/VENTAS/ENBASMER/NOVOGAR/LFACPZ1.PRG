FUNCTION LFACPZ1
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
		M=ABS(DESCUENTO)
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
		M=ABS(MONTOBRU)
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
		M=ABS(MONTOIVA)
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
		M=ABS(MONTOOT2)
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
		M=ABS(MONTOOT3)
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
		M=ABS(MONTONET)
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
RETURN .T.
