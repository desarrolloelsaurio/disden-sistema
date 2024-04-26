FUNCTION LCCLPZ2
	parameter L_COX,L_COX1,L_COX2,PORPAX
	private L_COX,L_COX1,L_COX2
if !hay
	return fin_lin(L_COX,L_COX1)
else
	VEZ=1
	? LINEA
	? PAIP
	FOR A=1 TO CANT_MAX
		IF VARIABLE[A]
			IF VEZ=1
				VEZ=2
				?? PADR(L_COX2,TEXTO[A,2])
				?? PAIP
			ELSE
				IF CTRL[A]
					IF A=8
						?? STR(TTL[A],XACDIGI,2)
						?? PAIP
						?? STR(TTL[9],XACDIGI,2)
						?? PAIP
						?? STR(TTL[12],XACDIGI,2)
						?? PAIP
						?? STR(TTL[11],XACDIGI,2)
						?? PAIP
					ELSE
						?? STR(TTL[A],XACDIGI,2)
						?? PAIP
					ENDIF
				ELSE
					?? SPACE(TEXTO[A,2])
					?? PAIP
				ENDIF
			ENDIF
		ENDIF
	NEXT
endif
return IIF(PORPAX,INKEY(NUL,'HM')#27,.T.)
