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
	if variable[8]
		STOR NUL TO ttl[8],TTL[9],TTL[11],TTL[12]
		store .t. to hay
	endif
	if variable[10]
		STOR NUL TO ttl[10]
		store .t. to hay
	endif
	if !hay
		rele ttl,ctrl
	endif
	SELE CCP
	set order to tag PROCOD
	set order to tag PROCOD in PRO
	set relation to CCP.PROCOD INTO PRO
	TMP=GENTMP()
	IF ".T."=FISC
		INDE ON PRO.PROVEEDOR+DTOS(FECHAOP) TO (TMP) comp
	ELSE
		INDE ON PRO.PROVEEDOR+DTOS(FECHAOP) TO (TMP) FOR EVAL(FISC) comp
	ENDIF
	acla=paip
	for a=1 to CANT_MAX
		IF A=8
			IF VARIABLE[8]
				ACLA=ACLA+padc('DEBE',texto[a,2])+paip+padc('HABER',texto[a,2])+PAIP+PADC('PENDIENTE',TEXTO[A,2])+paip+padc('SALDO',texto[a,2])+paip
			ENDIF
		ELSE
			store acla+iif(variable[a],padc(texto[a,1],texto[a,2])+paip,'') to acla
		ENDIF
	NEXT
	linea=REPL("=",LEN(acla))
	tt='Listado de Cta. Cte. Proveedores'+TTQUE
	=UNWORK()
RETURN .T.
