FUNCTION LCNXP11
#DEFINE PAIP   "|"                               && PAIP
	? PAIP
	?? CNX.DENOM
	?? PAIP
	?? CNX.TIPO
	?? ' |'
	?? CNX.PISO
	?? ' |'
	?? CNX.DTO
	?? ' |'
	?? SAYPER(CNX.CODCLI,"CSSCOD")
	?? PAIP
	?? STR(PORCENTAJE,6,4)
	?? PAIP
	TTL=TTL+PORCENTAJE
	CASOS=CASOS+1
RETURN .T.
