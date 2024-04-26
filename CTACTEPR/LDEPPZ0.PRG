* ÚÄ Funci¢n  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: LDEPPZ0                                                    ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-16-92                                                   ³
* ³ Time created: 02:29:34pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LDEPPZ0
	=WORKING()
	if variable[6]
		STORE NUL TO PTL[6],ttl[6]
		store .t. to hay,CTRL[6]
	ELSE
		rele ttl,ctrl
	endif
	SELE ccp
	set order to tag FECHAOP
	set order to tag PROCOD in PRO
	set relation to ccp.PROCOD INTO PRO
	TMP=GENTMP()
	IF TYPE("ORDPRO")#'L' .OR. ORDPRO
		IF ".T."=FISC
			INDE ON PRO.PROCOD TO (TMP) comp
		ELSE
			INDE ON PRO.PROCOD TO (TMP) FOR eval(FISC) comp
		ENDIF
	else
		IF ".T."=FISC
			INDE ON PRO.PROVEEDOR TO (TMP) comp
		ELSE
			INDE ON PRO.PROVEEDOR TO (TMP) FOR eval(FISC) comp
		ENDIF
	endif
	ACLA=HAZ_ACLA()
	LINEA=REPL("=",LEN(ACLA))
	GO TOP
	ELPRO=PRO.PROVEEDOR
	=UNWORK()
RETURN .T.
