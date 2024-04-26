function TLRIMPR1
	parameter cosa,ESPERA
	private cosa
	? LNS
	? PAIP
	IF FILREM=3
		?? PADR(COSA,13)
		?? PAIP
		?? SPACE(8)
	ELSE
		IF FILFEC=3
			?? PADR(COSA,8)
		else
			IF FILvia=3
				?? PADR(COSA,30)
			endif
		ENDIF
	ENDIF
	?? PAIP
	?? STR(TCAN,XACDIGI)
	?? PAIP
	IF FILFEC=3 .OR. FILVIA=3
		?? STR(TREM,XACDIGI)
		?? PAIP
	ENDIF
	?? STR(TTOT,XACDIGI,2)
	?? PAIP
return IIF(ESPERA,1,inkey(nul))
