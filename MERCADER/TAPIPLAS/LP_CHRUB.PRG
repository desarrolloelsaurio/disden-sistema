* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �  Application: Billing Information System                                 �
* �    File Name: LP_CHRUB.PRG                                               �
* �       Author: Bill French                                                �
* � Date created: 11-20-92                                                   �
* � Time created: 12:06:53pm                                                 �
* �    Make File: DEMO.RMK                                                   �
* �    Exec File: DEMO.EXE                                                   �
* �    Copyright: 1992 by Global Technologies Corporation                    �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
