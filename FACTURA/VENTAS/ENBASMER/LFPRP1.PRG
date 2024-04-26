* зд Program ддддддддддддддддддддддддд©
* Ё    File Name: LFPRP1.PRG          Ё
* Ё       Author: G. REINER           Ё
* Ё Date created: 12-25-92            Ё
* Ё Time created: 04:12:26pm          Ё
* Ё    Copyright: 1992 by GOYO REINER Ё
* юддддддддддддддддддддддддддддддддддды
FUNCTION LFPRP1
	?PAIP
	=iif(variable[1],qout(IIF(TYPE("FAX.FACTURA")="C",FAX.FACTURA,SUCU+'-'+ZERO(FAX.FACTURA,8))+paip),'')
	=iif(variable[2],qout(dtoc(FAC.FECHAEM)+paip),'')
	=IIF(VARIABLE[3],QouT(FAC.TIPO+PAIP),'')
	=IIF(VARIABLE[4],QOUT(left(PER.CLIENTE,texto[4,2])+PAIP),'')
	=IIF(VARIABLE[5],QOUT(left(VIA.VIAJANTE,texto[5,2])+PAIP),'')
	=IIF(VARIABLE[6],QOUT(left(ALLTRIM(FAX.ARTICULO)+'/'+MER.MERCA,texto[6,2])+PAIP),'')
	IF VARIABLE[7]
		?? str(FAX.MONTO,xacdigi,2)
		?? paip
		ttl[7]=ttl[7]+FAX.MONTO
		CTRL[7]=.T.
	endif
	IF VARIABLE[8]
		?? STR(FAX.MONTO1,XACDIGI,2)
		?? PAIP
		TTL[8]=TTL[8]+FAX.MONTO1
		CTRL[8]=.T.
	ENDIF
	IF VARIABLE[9] .AND. VARIABLE[8] .AND. VARIABLE[7]
		?? STR(FAX.MONTO-FAX.MONTO1,XACDIGI,2)
		?? PAIP
		TTL[9]=TTL[9]+FAX.MONTO-FAX.MONTO1
		CTRL[9]=.T.
	ENDIF
	CASOS=CASOS+1
RETURN .T.
