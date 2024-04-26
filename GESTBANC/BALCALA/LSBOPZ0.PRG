* ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    ARCHIVO: LSBOPZ0.PRG                                                  ³
* ³       AUTOR: G. REINER                                                   ³
* ³ Date created: 12-14-92                                                   ³
* ³ Time created: 11:04:07am                                                 ³
* ³    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LSBOPZ0
	=WORKING()
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	hay=.f.
	if variable[8] .or. variable[10]
		STOR NUL TO ttl[8],ttl[9],TTL[10],TTL[11]
		store .t. to hay
	endif
	if !hay
		rele ttl,ctrl
	endif
	store nul to HB,DB
	SELE caj
	TMP=GENTMP()
	IF ".T."=FISC
		INDE ON DTOS(FECHAOP) TO (TMP) COMP
	ELSE
		INDE ON DTOS(FECHAOP) TO (TMP) FOR EVAL(FISC) COMP
	ENDIF
	set order to tag proCOD in PRO
	set relation to caj.CODCLI INTO PRO
	set order to tag CODCLI IN PER
	set relation to caj.CODCLI INTO PER ADDI
	acla=paip
	for a=1 to CANT_MAX
		IF A=2 .AND. VARIABLE[2]
			ACLA=ACLA+'C/P'+paip
		ENDIF
		IF A=8
			IF VARIABLE[8]
				if FILOPE=1
					ACLA=ACLA+padc('DEBE',texto[a,8])+paip+padc('HABER',texto[a,8])+paip+padc('SALDO',texto[a,8])+paip
				else
					ACLA=ACLA+padc('MONTO',texto[a,2])+paip
				endif
			ENDIF
		ELSE
			store acla+iif(variable[a],padc(texto[a,1],texto[a,2])+paip,'') to acla
		ENDIF
	NEXT
	LNS=REPL("=",LEN(acla))
	tt="Listado Operaciones Bancarias"+iif(empty(ttque),"",TTQUE)
	GO TOP
	STORE NUL TO CASOS
	=UNWORK()
RETURN .T.
