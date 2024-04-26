********************************************************************************
*-- Programa: LCCPPZ.PRG
*-- Fecha   : 05-04-92 03:48pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS POR PANTALLA
********************************************************************************
stor hora_ulp(PROGRAM()) TO ulpr
IF CHEQSEG()
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	STORE .F. TO hay,ACLA,LINEA,TT
	=LCCPPZ0()
	=WIN0()
	pag=1
	=cabpan()
	STORE nul TO casos
	=tit_lin(1)
	SCAN for &FISC
		IF ROW()>21
			IF !tlCCPpz(1,NUL,'SUBTOTAL')
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=tit_lin(2)
		ENDIF
		=LCCPPZ1()
	ENDSCAN
	=Iif(last()=27,"",tlCCPpz(2,casos,'TOTAL'))
	=RELEWIN('win')
	=REopCCP()
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION TLCCPPZ
	PARAMETER COSA,COSA1,COSA2
	PRIVATE COSA,COSA1,COSA2
	if !hay
	return fin_lin(cosa,COSA1)
else
	VEZ=1
	? LINEA
	? PAIP
	FOR A=1 TO CANT_MAX
		IF VARIABLE[A]
			IF VEZ=1
				VEZ=2
				?? PADR(COSA2,TEXTO[A,2])
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
		ENDF
		=INKEY(NUL,'HM')
	endif
return last()#27
