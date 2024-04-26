FUNCTION LPRC1
#DEFINE PAIP   "|"                               && PAIP
	? PAIP
	?? prccod
	?? paip
	?? PROCFAB
	?? PAIP
	?? STR(MONTO,XACDIGI,2)
RETURN IMPUSE()
