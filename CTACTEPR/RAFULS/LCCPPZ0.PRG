* ÚÄ Funci¢n  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: LCCPP0                                                     ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-22-92                                                   ³
* ³ Time created: 01:59:15pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LCCPPZ0
	=WORKING()
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	hay=.f.
	if variable[4]
		ttl[4]=nul
		store .t. to hay
	endif
	IF VARIABLE[8]
		STOR NUL TO TTL[8],TTL[9],TTL[11],TTL[12]
		STORE .T. TO HAY
	ENDIF
	IF VARIABLE[10]
		STOR NUL TO TTL[10]
		STORE .T. TO HAY
	ENDIF
	IF !HAY
		RELE TTL,CTRL
	ENDIF
	SELE CCP
	SET ORDER TO TAG PROCOD
	SET ORDER TO TAG PROCOD IN PER
	SET RELATION TO CCP.PROCOD INTO PER
	TMP=GENTMP()
	INDE ON PER.CLIENTE+DTOS(FECHAOP) TO (TMP) FOR EVAL(FISC) comp
	acla=paip
	FOR A=1 TO CANT_MAX
		IF A=8
			IF VARIABLE[8]
				ACLA=ACLA+PADC('DEBE',TEXTO[A,2])+PAIP+PADC('HABER',TEXTO[A,2])+PAIP+PADC('PENDIENTE',TEXTO[A,2])+PAIP+PADC('SALDO',TEXTO[A,2])+PAIP
			ENDIF
		ELSE
			STORE ACLA+IIF(VARIABLE[A],PADC(TEXTO[A,1],TEXTO[A,2])+PAIP,'') TO ACLA
		ENDIF
	NEXT
	LINEA=REPL("=",LEN(ACLA))
	tt='Listado de Cta. Cte. Proveedores'+TTQUE
	=UNWORK()
RETURN(.T.)
