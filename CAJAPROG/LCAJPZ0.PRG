FUNCTION LCAJPZ0
	=WORKING()
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	hay=.f.
	STORE nul TO casos
	if variable[9]
		STOR NUL TO ttl[9],TTL[10],TTL[11]
		store .t. to hay
	endif
	if !hay
		rele ttl,ctrl
	endif
	SELE caj
	TMP=GENTMP()
	if paracual="P"
		IF ".T."=FISC
			INDE ON GASTO+DTOS(FECHAOP) TO (TMP) COMP
		ELSE
			INDE ON GASTO+DTOS(FECHAOP) TO (TMP) FOR EVAL(FISC) COMP
		ENDIF
	else
		IF ".T."=FISC
			INDE ON DTOS(FECHAOP) TO (TMP) COMP
		ELSE
			INDE ON DTOS(FECHAOP) TO (TMP) FOR EVAL(FISC) COMP
		ENDIF
	endif
	set order to tag proCOD in PRO
	set relation to caj.CODCLI INTO PRO
	set order to tag CODCLI IN PER
	set relation to caj.CODCLI INTO PER ADDI
	=UNWORK()
	acla=HAZ_ACLA()
	linea=REPL("=",LEN(acla))
	tt=TTQUE
RETURN .T.
