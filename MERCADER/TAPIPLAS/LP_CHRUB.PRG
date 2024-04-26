* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Application: Billing Information System                                 ³
* ³    File Name: LP_CHRUB.PRG                                               ³
* ³       Author: Bill French                                                ³
* ³ Date created: 11-20-92                                                   ³
* ³ Time created: 12:06:53pm                                                 ³
* ³    Make File: DEMO.RMK                                                   ³
* ³    Exec File: DEMO.EXE                                                   ³
* ³    Copyright: 1992 by Global Technologies Corporation                    ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LP_CHRUB
	PARAMETER LOSTOT
	SALIDA=.T.
	IF LEFT(RUB.PALISTAR,20)#RUB1
		IF LOSTOT
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
		ELSE
			=FIN_LIN(1,NUL,fin_sum(SRUB1,@TTL),.T.)
			IF !FIN_LIN(1,NUL,fin_sum(RUB1,@RTL))
				EXIT
			ENDIF
		ENDIF
		stor LEFT(RUB.PALISTAR,20) TO RUB1
		STOR RUB.RUBRO TO SRUB1
		STORE NUL TO TTL,RTL
	ELSE
		IF RUB.RUBRO#SRUB1
			IF LOSTOT
				IF !FIN_LIN(1,NUL)
					EXIT
				ENDIF
			ELSE
				IF !FIN_LIN(1,NUL,fin_sum(SRUB1,@TTL))
					EXIT
				ENDIF
			ENDIF
			STORE NUL TO TTL
			STOR RUB.RUBRO TO SRUB1
		ELSE
			SALIDA=.F.
		ENDIF
	ENDIF
RETURN SALIDA
