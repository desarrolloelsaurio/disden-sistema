FUNCTION FACRPAG2
	PARAMETER F_TEX
	#DEFINE NUL  0                                 && NUL
	#DEFINE PAIP   "|"                             && PAIP
	? M.LINEA
	? PAIP
	?? PADC(F_TEX,21)
	?? PAIP
	?? STR(TCTD,XACDIGI-3)
	?? PAIP
	?? STR(TNGRA,XACDIGI,2)
	?? PAIP
	?? STR(TIVA18,XACDIGI,2)
	?? PAIP
	?? STR(TIVA09,XACDIGI,2)
	?? PAIP
	?? STR(TTOT,XACDIGI,2)
	?? PAIP
RETURN .T.
