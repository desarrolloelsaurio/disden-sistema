* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �    ARCHIVO: LSBOPZ2.PRG                                                  �
* �       AUTOR: G. REINER                                                   �
* � Date created: 12-14-92                                                   �
* � Time created: 11:19:53am                                                 �
* �    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
function LSBOPZ2
	parameter cosa,COSA1,COSA2
	private cosa,COSA1,COSA2
	if !hay
	return fin_lnS(cosa,COSA1)
else
	VEZ=1
	? LNS
	? PAIP
	FOR A=1 TO CANT_MAX
		IF VARIABLE[A]
			IF VEZ=1
				VEZ=2
				?? PADR(COSA2,IIF(A=2,4+TEXTO[A,2],TEXTO[A,2]))
				?? PAIP
			ELSE
				IF A=8 .AND. FILOPE=1
					?? STR(TTL[8],XACDIGI,2)
					?? PAIP
					?? STR(TTL[9],XACDIGI,2)
					?? PAIP
					?? STR(TTL[11],XACDIGI,2)
					?? PAIP
				ELSE
					IF CTRL[A]
						?? STR(TTL[A],XACDIGI,2)+PAIP
					ELSE
						?? SPACE(TEXTO[A,2])+PAIP
					ENDIF
				ENDIF
			ENDIF
		ENDIF
		ENDF
		IF COSA<3
			=INKEY(NUL,'HM')
		ENDIF
	endif
return LAST()#27
