#DEFINE PAIP   "|"                               && PAIP
FUNCTION CEXI0
	? PAIP
	DO CASE
		CASE !EMPTY(TELCODPRO)
			=XSEEK(TELCODPRO,'TELS','TELCODPRO')
            ??LEFT(TELS.TELA,IIF(PORPAN,20,30))
            uo=telS.unidad
            st=telS.stock
		CASE !EMPTY(AVICODPRO)
			=xseek(aviCODPRO,'AVIS','avicodPRO')
			??LEFT(aviS.avio,IIF(PORPAN,20,30))
			uo=aviS.unidad
			st=aviS.stock
	ENDCASE
	?? paip
	?? CANTIDAD PICT "99999999.99"
	?? PAIP
	?? SAYMIX(uo,"MDDCOD",10)
	?? PAIP
	?? ST PICT "99999999.99"
	?? PAIP
	M.NECE=CEILING(CANTIDAD-st)
	?? IIF(M.NECE>0,PADC('------',11),STR(M.NECE,11))
	?? PAIP
	IF M.NECE>0
		STORE M.NECE+TOTAL[1] TO TOTAL[1]
	ENDIF
	STORE casos+1 TO casos
RETURN
