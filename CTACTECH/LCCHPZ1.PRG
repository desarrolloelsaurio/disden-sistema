function lcchpz1
#DEFINE PAIP     "|"                             && PAIP
	?paip
	=IIF(VARIABLE[1],QOUT(left(PER.CLIENTE,texto[1,2])+PAIP),"")
	=iif(variable[2],qout(DTOC(CCH.FECHAOP)+paip),"")
	=iif(variable[3],QOUT(CCH.TIPO+paip),"")
	=IIF(VARIABLE[4],QOUT(RIGHT(ALLTRIM(CCH.COMPRE)+' '+IIF(TYPE("CCH.NUMERE")="C",NUMERE,ALLTRIM(STR(NUMERE))),15)+PAIP),"")
	=iif(variable[5],qout(CCH.COMPR+paip),"")
	=IIF(VARIABLE[6],QOUT(DTOC(CCH.FECHADE)+PAIP),"")
	=IIF(VARIABLE[7],QouT(LEFT(CCH.BANCO,TEXTO[7,2])+PAIP),"")
	=IIF(VARIABLE[8],QOUT(CCH.NROCHE+PAIP),"")
	IF VARIABLE[9]
		?? str(monto,xacdigi,2)
		?? paip
		ttl[9]=ttl[9]+monto
		CTRL[9]=.T.
	endif
	=IIF(VARIABLE[10],QOUT(STR(CCH.DIASAC,3)+PAIP),"")
	=iif(variable[11],qout(CCH.MONEDA+paip),"")
	IF VARIABLE[12]
		?? str(CCH.EQUIVALE,xacdigi,2)
		?? paip
		ttl[12]=ttl[12]+CCH.EQUIVALE
		CTRL[12]=.T.
	endif
	=IIF(VARIABLE[13],QOUT(DTOC(CCH.FECHAAC)+PAIP),"")
	=IIF(VARIABLE[14],QOUT(XXTOCHAR(ENTREGADO)+PAIP),"")
	=IIF(VARIABLE[15],qout(gasto+PAIP),"")
	casos=casos+1
return .t.
