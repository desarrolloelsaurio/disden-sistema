FUNCTION LKAR1CI0
	#DEFINE NUL    0                              && NUL
	#DEFINE PAIP   "|"                            && PAIP
	? fechaop
	?? paip
	IF EMPTY(TELCODPRO)                      && SON AVIOS
		?? AVICODPRO
		?? PAIP
		?? LEFT(SAYGRL(AVICODPRO,"AVIS","AVICODPRO","AVIS.AVIO"),25)
		TXT=SAYMIX(AVIS.UNIDAD,"MDDCOD")
	ELSE
		?? TELCODPRO
		?? PAIP
		?? LEFT(SAYGRL(TELCODPRO,"TELS","TELCODPRO","TELS.TELA"),25)
		TXT=SAYMIX(TELS.UNIDAD,"MDDCOD")
	ENDIF
	?? PAIP
	?? str(entrada,xacdigi,2)
	?? paip
	?? str(salida,xacdigi,2)
	?? paip
	?? LEFT(TXT,4)
	?? PAIP
RETURN .T.
