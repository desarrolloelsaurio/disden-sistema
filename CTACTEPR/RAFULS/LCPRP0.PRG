* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LCPRP0.PRG                                               �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE PAIP   "|"                               && PAIP
FUNCTION LCPRP0
	? PAIP
	=IIF(VARIABLE[1],QOUT(SAYPER(CCP.CODCLI,"PRPCOD",TEXTO[1,2])+PAIP),"")
	=IIF(VARIABLE[2],QOUT(DTOC(CCP.FECHAOP)+PAIP),"")
	=IIF(VARIABLE[3],QOUT(DTOC(CCP.FECHAVE)+PAIP),"")
	=IIF(VARIABLE[4],QOUT(left(CCP.DETALLE,TEXTO[4,2])+PAIP),"")
	=IIF(VARIABLE[5],QOUT(CCP.COMPR+PAIP),"")
	=IIF(VARIABLE[6],QOUT(LEFT(CCP.NUMERORE,TEXTO[6,2])+PAIP),"")
	IF VARIABLE[7]
		IF ESDEBE(CCP.COMPRRE)
			SALDO=SALDO+CCP.MONTO
			M.DEBE=M.DEBE+CCP.MONTO
			?? STR(CCP.MONTO,XACDIGI,2)
			IF !PORPAN
				?? PAIP
				?? SPACE(XACDIGI)
				?? PAIP
				?? STR(M.SALDO,XACDIGI,2)
			ENDIF
		ELSE
			SALDO=SALDO-CCP.MONTO
			M.HABER=M.HABER+CCP.MONTO
			IF PORPAN
				?? STR(0-CCP.MONTO,XACDIGI,2)
			ELSE
				?? SPACE(XACDIGI)
				?? PAIP
				?? STR(CCP.MONTO,XACDIGI,2)
				?? PAIP
				?? STR(M.SALDO,XACDIGI,2)
			ENDIF
		ENDIF
		?? PAIP
	ENDIF
	=IIF(VARIABLE[8],QOUT(iif(ccp.autoriz,"SI","NO")+PAIP),"")
	=IIF(VARIABLE[9],QOUT(left(SAYGRL(CCP.CODINM,"INM","CODINM","INM.DOMICILIO"),TEXTO[9,2])+PAIP),"")
	STORE M.CASOS+1 TO M.CASOS
RETURN .T.
