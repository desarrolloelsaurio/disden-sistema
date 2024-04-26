* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    ARCHIVO: LSBOPZ1.PRG                                                  ³
* ³       AUTOR: G. REINER                                                   ³
* ³ Date created: 12-14-92                                                   ³
* ³ Time created: 11:13:54am                                                 ³
* ³    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
?paip
if variable[1]
	if caj.caja='00'
		=qout(PADR('FONDO FIJO',TEXTO[1,2])+paip)
	ELSE
		=qout(iif(xseek(caj.CAJA,'mix','bancod'),padr(alltrim(MIX.texto1)+'_'+alltrim(MIX.texto2),TEXTO[1,2]),'')+paip)
	ENDIF
ENDIF
=iif(variable[2],iif(caj.proveedor,qout('PRO'+PAIP+padr(pro.proveedor,TEXTO[2,2])+paip),qout('PER'+PAIP+padr(PER.cliente,TEXTO[2,2])+paip)),'')
=iif(variable[3],qout(iif(xseek(caj.gasto,'mix','gascod'),padr(MIX.texto1,TEXTO[3,2])+paip,padr(caj.gasto,TEXTO[3,2])+paip)),.T.)
=iif(variable[4],qout(DTOC(caj.FECHAop)+paip),'')
=IIF(VARIABLE[5],QOUT(padr(caj.compr,texto[5,2])+PAIP),'')
=IIF(VARIABLE[6],QOUT(padr(caj.numere,texto[6,2])+PAIP),'')
=IIF(VARIABLE[7],QOUT(padr(caj.compre+' '+IIF(TYPE("CAJ.NUMERE")="C",ALLTRIM(CAJ.NUMERE),alltrim(str(caj.numere))),texto[7,2])+PAIP),'')
IF VARIABLE[8]
	ttl[11]=ttl[11]+monto
	STORE .T. TO CTRL[11]
	IF filope = 1
		if monto>0
			HB=HB+monto
			=qout(space(xacdigi)+paip)
			=qout(str(monto,xacdigi,2)+paip)
			ttl[9]=ttl[9]+abs(monto)
			STORE .T. TO CTRL[9]
		else
			DB=DB+abs(monto)
			=qout(str(abs(monto),xacdigi,2)+paip)
			=qout(space(xacdigi)+paip)
			ttl[8]=ttl[8]+abs(monto)
			STORE .T. TO CTRL[8]
		endif
		=qout(str(HB-DB,xacdigi,2)+paip)
	ELSE
		=qout(str(abs(monto),xacdigi,2)+paip)
	ENDIF
ENDIF
=iif(variable[9],qout(padr(iif(padr(caj.moneda,1)=padr(xauss,1),xauss,xadols),texto[9,2])+PAIP),.T.)
IF VARIABLE[10]
	?? str(abs(equivale),xacdigi,2)+paip
	ttl[10]=ttl[10]+equivale
	CTRL[10]=.T.
endif
=IIF(VARIABLE[11],QOUT(padr(caj.nroche,texto[11,2])+PAIP),'')
=IIF(VARIABLE[12],QOUT(padr(dtoc(caj.fechade),texto[12,2])+PAIP),'')
=IIF(VARIABLE[13],QOUT(padr(caj.usuario,texto[13,2])+PAIP),'')
casos=casos+1
RETURN .T.
