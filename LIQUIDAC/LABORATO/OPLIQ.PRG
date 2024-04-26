* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPLIQ.PRG                                                บ
* บ COMENTARIO    : ABRE BASE DE LIQUIDACION DE OBRA SOCIAL                  บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 04-23-94                                                    บ
* บ HORA       : 08:39:21pm                                                  บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION OPLIQ
	PARAMETER OPREOP,OPEXCL
	#DEFINE BOTOM  "  "+repl("ฐ",78)               && BOTOM
	#DEFINE ABA    "Abriendo Base de "             && ABA

	IF OPREOP
		=REOPXXX("LIQ")
		=REOPXXX("LIX")
	ENDIF
	=MEN_LIN(ABA+"Liquidaciขn")
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
