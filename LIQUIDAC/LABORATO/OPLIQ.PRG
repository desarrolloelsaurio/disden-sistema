* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : OPLIQ.PRG                                                �
* � COMENTARIO    : ABRE BASE DE LIQUIDACION DE OBRA SOCIAL                  �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 04-23-94                                                    �
* � HORA       : 08:39:21pm                                                  �
* � COPYRIGHT  : 1994 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION OPLIQ
	PARAMETER OPREOP,OPEXCL
	#DEFINE BOTOM  "  "+repl("�",78)               && BOTOM
	#DEFINE ABA    "Abriendo Base de "             && ABA

	IF OPREOP
		=REOPXXX("LIQ")
		=REOPXXX("LIX")
	ENDIF
	=MEN_LIN(ABA+"Liquidaci�n")
	IF OPEXCL
	    =CLOSDBF("LIX")
		=PRXAREA(.T.)
		USE (PATHPRO+"\LIQUIDA1") ALIAS LIX ORDER TAG NUMER1 EXCL
		SELE 11
		USE (PATHPRO+"\LIQUIDA") ALIAS LIQ EXCL
	ELSE
		IF USED("LIQ")
			SELE LIQ
		ELSE
		    =PRXAREA(.T.)
  		    USE (PATHPRO+"\LIQUIDA1") ALIAS LIX ORDER TAG NUMER1
			SELE 11
			USE (PATHPRO+"\LIQUIDA") ALIAS LIQ
		ENDIF
	ENDIF
RETURN MEN_LIN(BOTOM)
