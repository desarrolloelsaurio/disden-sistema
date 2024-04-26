FUNCTION LCCHPZ0
=working()
=dotalk()
	IF variable[9]
		ttl[9]=nul
		HAY=.T.
	ENDIF
	IF variable[12]
		ttl[12]=nul
		HAY=.T.
	ENDIF
	if !hay
		rele ttl,ctrl
	endif
	SELE CCH
	set order to tag CODCLI IN PER
	set relation to CCH.CODCLI INTO PER
	tmp=GENTMP()
	IF ".T."=FISC
		INDE ON fechade to (tmp) COMP
	ELSE
		INDE ON fechade to (tmp) for EVAL(FISC) COMP
	ENDIF
	STORE nul TO casos
	acla=HAZ_ACLA()
	linea=REPL("=",LEN(acla))
	tt='Listado de Cheques '+TTQUE
=untalk()
=unwork()
RETURN
