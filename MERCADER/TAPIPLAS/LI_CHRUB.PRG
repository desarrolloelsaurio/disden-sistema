FUNCTION LI_CHRUB
	PARAMETER LOSTOT
	SALIDA=.T.
	IF LEFT(RUB.PALISTAR,20)#RUB1
		IF LOSTOT
			=FIN_LIN(3,NUL)
		ELSE
			=FIN_LIN(3,NUL,fin_sum(SRUB1,@TTL),.T.)
			=FIN_LIN(3,NUL,fin_sum(RUB1,@RTL))
		ENDIF
		stor LEFT(RUB.PALISTAR,20) TO RUB1
		STOR RUB.RUBRO TO SRUB1
		STORE NUL TO TTL,RTL
	ELSE
		IF RUB.RUBRO#SRUB1
			=FIN_LIN(3,NUL,fin_sum(SRUB1,@TTL))
			STORE NUL TO TTL
			STOR RUB.RUBRO TO SRUB1
		ELSE
			SALIDA=.F.
		ENDIF
	ENDIF
RETURN SALIDA
