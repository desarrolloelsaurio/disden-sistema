* ÚÄ Funci¢n  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: LCCPPZ.PRG                                                 ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-22-92                                                   ³
* ³ Time created: 02:10:26pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LCCPPZ1
	?paip
	=iif(variable[1],qout(LEFT(PRO.PROVEEDOR,TEXTO[1,2])+paip),'')
	=iif(variable[2],qout(DTOC(CCP.FECHAop)+paip),'')
	=IIF(VARIABLE[3],QOUT(DTOC(CCP.FECHAVE)+PAIP),'')
	=IIF(VARIABLE[4],QouT(left(CCP.detalle,texto[4,2])+PAIP),'')
	=IIF(VARIABLE[5],QOUT(left(CCP.comprre,texto[5,2])+PAIP),'')
	IF VARIABLE[6]
		IF TYPE("CCP.NUMERORE")="N"
			?? STR(CCP.numerore,texto[6,2])+PAIP
		ELSE
			?? LEFT(CCP.numerore,texto[6,2])+PAIP
		ENDIF
	ENDIF
	=IIF(VARIABLE[7],QOUT(left(CCP.compr,texto[7,2])+PAIP),'')
	IF VARIABLE[8]
		IF !ESDEBE(CCP.COMPRRE)
			?? str(monto,xacdigi,2)
			?? paip
			?? SPACE(XACDIGI)
			?? PAIP
			ttl[8]=ttl[8]+monto
			TTL[11]=TTL[11]+MONTO
			STORE .T. TO CTRL[8]
			IF !PAGADA
				STORE TTL[12]+MONTO-CUOTA TO TTL[12]
			ENDIF
			?? STR(MONTO-CUOTA,XACDIGI,2)
		ELSE
			?? SPACE(XACDIGI)
			?? PAIP
			lak=abs(monto)
			?? str(lak,xacdigi,2)
			?? paip
			?? SPACE(XACDIGI)
			ttl[9]=ttl[9]+lak
			TTL[11]=TTL[11]-lak
			STORE .T. TO CTRL[8]
		ENDIF
		?? PAIP
		?? STR(TTL[11],XACDIGI,2)
		?? PAIP
	endif
	if variable[9]
		?? left(iif(left(CCP.moneda,1)=left(xauss,1),xauss,xadols),texto[9,2])+PAIP
	endif
	IF VARIABLE[10]
		?? str(equivale,xacdigi,2)
		?? paip
		IF !ESDEBE(CCP.COMPRRE)
			ttl[10]=ttl[10]+equivale
		ELSE
			ttl[10]=ttl[10]-abs(equivale)
		ENDIF
		CTRL[10]=.T.
	endif
	if variable[11]
		?? iif(CCP.pagada,'SI','NO')+PAIP
	endif
	=IIF(VARIABLE[12],QOUT(left(CCP.usuario,texto[7,2])+PAIP),'')
	casos=casos+1
RETURN .T. 
