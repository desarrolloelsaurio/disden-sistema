function lcajpz1
	?paip
	*      if variable[1]
	*         if caj.caja='00'
	*            =qout(PADR('FONDO FIJO',TEXTO[1,2])+paip)
	*         ELSE
	*            =qout(iif(xseek(caj.CAJA,'mix','bancod'),padr(alltrim(MIX.texto1)+'_'+alltrim(MIX.texto2),TEXTO[1,2]),'')+paip)
	*         ENDIF
	*      ENDIF
	=iif(variable[2],qout(padr(pro.proveedor,TEXTO[2,2])+paip),'')
	=iif(variable[3],qout(iif(xseek(caj.gasto,'mix','gascod'),padr(MIX.texto1,TEXTO[3,2])+paip,padr(caj.gasto,TEXTO[3,2])+paip)),.T.)
	=iif(variable[4],qout(padr(PER.cliente,TEXTO[4,2])+paip),'')
	=iif(variable[5],qout(DTOC(caj.FECHAop)+paip),'')
	=IIF(VARIABLE[6],QOUT(padr(caj.compre,texto[6,2])+PAIP),'')
	=IIF(VARIABLE[7],QOUT(RIGHT(IIF(TYPE("caj.numere")="C",caj.numere,ALLTRIM(STR(caj.numere))),texto[7,2])+PAIP),'')
	IF VARIABLE[8]
		IF TYPE("CAJ.compr")="N"
			?? padr(alltrim(str(caj.compr)),texto[8,2])
		ELSE
			?? PADR(RIGHT(alltrim(CAJ.compr),TEXTO[8,2]),TEXTO[8,2])
		ENDIF
		?? PAIP
	ENDIF
	IF VARIABLE[9]
		IF PARACUAL="C"
			=qout(str(monto,xacdigi,2)+paip)
			ttl[9]=ttl[9]+monto
			STORE .T. TO CTRL[9]
		ELSE
			=qout(str(abs(monto),xacdigi,2)+paip)
			ttl[9]=ttl[9]+abs(monto)
			STORE .T. TO CTRL[9]
		ENDIF
	endif
	=iif(variable[10],qout(padr(iif(padr(caj.moneda,1)=padr(xauss,1),xauss,xadols),texto[10,2])+PAIP),.T.)
	IF VARIABLE[11]
		IF PARACUAL="C"
			?? str(equivale,xacdigi,2)+paip
			ttl[11]=ttl[11]+equivale
			CTRL[11]=.T.
		ELSE
			?? str(abs(equivale),xacdigi,2)+paip
			ttl[11]=ttl[11]+abs(equivale)
			CTRL[11]=.T.
		ENDIF
	endif
	=IIF(VARIABLE[12],QOUT(padr(caj.nroche,texto[12,2])+PAIP),'')
	=IIF(VARIABLE[13],QOUT(padr(dtoc(caj.fechade),texto[13,2])+PAIP),'')
	=IIF(VARIABLE[14],QOUT(padr(caj.usuario,texto[14,2])+PAIP),'')
	casos=casos+1
return .t.
