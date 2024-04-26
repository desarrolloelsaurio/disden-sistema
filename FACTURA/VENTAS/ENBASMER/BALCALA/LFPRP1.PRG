* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: LFPRP1.PRG                                                 ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 12-25-92                                                   ³
* ³ Time created: 04:12:26pm                                                 ³
* ³    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LFPRP1
	?paip
	=iif(variable[1],qout(SUCU+'-'+ZERO(FAX.FACTURA,8)+paip),'')
	=iif(variable[2],qout(dtoc(FAC.FECHAEM)+paip),'')
	=IIF(VARIABLE[3],QouT(FAC.TIPO+PAIP),'')
	=IIF(VARIABLE[4],QOUT(left(PER.CLIENTE,texto[4,2])+PAIP),'')
	=IIF(VARIABLE[5],QOUT(left(VIA.VIAJANTE,texto[5,2])+PAIP),'')
	IF VARIABLE[6]
		?? str(FAX.MONTO,xacdigi,2)
		?? paip
		ttl[6]=ttl[6]+FAX.MONTO
		CTRL[6]=.T.
	endif
	IF VARIABLE[7]
		?? STR(FAX.MONTO1,XACDIGI,2)
		?? PAIP
		TTL[7]=TTL[7]+FAX.MONTO1
		CTRL[7]=.T.
	ENDIF
	IF VARIABLE[8] .AND. VARIABLE[7] .AND. VARIABLE[8]
		?? STR(FAX.MONTO-FAX.MONTO1,XACDIGI,2)
		?? PAIP
		TTL[8]=TTL[8]+FAX.MONTO-FAX.MONTO1
		CTRL[8]=.T.
	ENDIF
	casos=casos+1
RETURN .T.
