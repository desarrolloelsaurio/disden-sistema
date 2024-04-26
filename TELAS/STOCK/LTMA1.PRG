FUNCTION LTMA1
	#DEFINE PAIP   "|"                            && PAIP
	? PAIP
	?? TELCODPRO
	?? PAIP
	?? TELA
	?? PAIP
	?? SAYPER(PROCOD,"PROCOD",15)
	?? PAIP
RETURN .T.
