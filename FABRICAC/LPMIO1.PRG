FUNCTION LPMIO1
	#DEFINE PAIP   "|"                             && PAIP
	? PAIP
	=IIF(VARIABLE[1],QOUT(STR(NUMERO)+PAIP),"")
	=IIF(VARIABLE[2],QOUT(ARTICULO+PAIP),"")
	=IIF(VARIABLE[3],QOUT(MERCA+PAIP),"")
	=IIF(VARIABLE[4],QOUT(DTOC(FECHAINI)+PAIP),"")
	=IIF(VARIABLE[5],QOUT(DTOC(FECHAFIN)+PAIP),"")
	IF VARIABLE[6]
		TTL[6]=TTL[6]+DIAS
		?? STR(DIAS,4)
		?? PAIP
	ENDIF
	IF VARIABLE[7]
		TTL[7]=TTL[7]+CANTINI
		?? STR(CANTINI,XACDIGI,2)
		?? PAIP
	ENDIF
	IF VARIABLE[8]
		TTL[8]=TTL[8]+TERM1
		?? STR(TERM1,XACDIGI,2)
		?? PAIP
	ENDIF
	IF VARIABLE[9]
		TTL[9]=TTL[9]+TERM2
		?? STR(TERM2,XACDIGI,2)
		?? PAIP
	ENDIF
	IF VARIABLE[10]
		TTL[10]=TTL[10]+TERM2E
		?? STR(TERM2E,XACDIGI,2)
		?? PAIP
	ENDIF
	IF VARIABLE[11]
		TTL[11]=TTL[11]+TTER
		?? STR(TTER,XACDIGI,2)
		?? PAIP
	ENDIF
	IF VARIABLE[12]
		TTL[12]=TTL[12]+REPROCESO
		?? STR(REPROCESO,XACDIGI,2)
		?? PAIP
	ENDIF
	IF VARIABLE[13]
		TTL[13]=TTL[13]+PERDIDO
		?? STR(PERDIDO,XACDIGI,2)
		?? PAIP
	ENDIF
	STORE CASOS+1 TO CASOS
RETURN .T.
