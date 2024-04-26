#DEFINE PAIP   "|"                               && PAIP
FUNCTION LRUB0
	? paip
	?? STR(RECNO(),5)
	?? paip
	?? rubro
	?? paip
	?? ZERO(CODRUB,6)
	=IMPUSE()
RETURN .T.
