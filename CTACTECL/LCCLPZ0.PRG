FUNCTION LCCLPZ0
	?paip
	IF SSTM1="DIS-DEN"
	=iif(variable[1],qout(LEFT(PER.CLIENTE,TEXTO[1,2])+paip),'')
	ELSE
	=iif(variable[1],qout(LEFT(PER.cliente,TEXTO[1,2])+paip),'')
	ENDIF
	=iif(variable[2],qout(DTOC(ccl.FECHAop)+paip),'')
	=IIF(VARIABLE[3],QOUT(DTOC(ccl.FECHAVE)+PAIP),'')
	=IIF(VARIABLE[4],QouT(left(ccl.detalle,texto[4,2])+PAIP),'')
	=IIF(VARIABLE[5],QOUT(left(Ccl.comprre,texto[5,2])+PAIP),'')
	=IIF(VARIABLE[6],QOUT(IIF(TYPE("CCL.NUMERORE")='C',RIGHT(ccl.numerore,texto[6,2]),str(ccl.numerore,texto[6,2]))+PAIP),'')
	=IIF(VARIABLE[7],QOUT(RIGHT(ccl.compr,texto[7,2])+PAIP),'')
	IF VARIABLE[8]
         IF CCL.COMPRRE='NC' .OR. CCL.COMPRRE='RE'
			lak=abs(monto)
			?? SPACE(XACDIGI)
			?? PAIP
			?? str(lak,xacdigi,2)
			?? paip
			?? SPACE(XACDIGI)
			?? PAIP
			ttl[9]=ttl[9]+lak
			TTL[11]=TTL[11]-lak
			STORE .T. TO CTRL[8]
			HB=HB+MONTO
         ELSE
			?? str(monto,xacdigi,2)
			?? paip
			?? SPACE(XACDIGI)
			?? PAIP
			?? STR(monto-CUOTA,XACDIGI,2)
			?? paip
			ttl[8]=ttl[8]+monto
			TTL[11]=TTL[11]+MONTO
			DB=DB+MONTO
			STORE .T. TO CTRL[8]
			TTL[12]=TTL[12]+monto-CUOTA
			CUT=CUT+monto-CUOTA
		ENDIF
		?? STR(DB-HB,XACDIGI,2)
		?? PAIP
	endif
	if variable[9]
		?? left(iif(left(ccl.moneda,1)=left(xauss,1),xauss,xadols),texto[9,2])+PAIP
	endif
	IF VARIABLE[10]
		?? str(equivale,xacdigi,2)
		?? paip
		IF EMPTY(CCL.COMPRRE) .OR. CCL.COMPRRE='ND' .OR. CCL.COMPRRE='FA'
			ttl[10]=ttl[10]+equivale
		ELSE
			ttl[10]=ttl[10]-abs(equivale)
		ENDIF
		CTRL[10]=.T.
	endif
	if variable[11]
		?? iif(ccl.pagada,'SI','NO')+PAIP
	endif
	=IIF(VARIABLE[12],QOUT(left(ccl.usuario,texto[7,2])+PAIP),'')
	casos=casos+1
RETURN .T.
