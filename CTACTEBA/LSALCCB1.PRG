FUNCTION LSALCCB1
	#DEFINE PAIP   "|"                            && PAIP
	#DEFINE NUL    0                              && NUL
	#DEFINE PICU "9999,999.99"
	? PAIP
	?? MIX.TEXTO2
	?? PAIP
	?? MIX.TEXTO1
	?? PAIP
	STORE NUL TO ELDEB,ELHAB,ELDEB1,ELHAB1
	ELSALD=SALDOCCB(MIX.NU1,@ELDEB,@ELHAB,@ELDEB,@ELHAB,L_LFEC)
	?? M.ELDEB PICT PICU
	?? PAIP
	?? ABS(M.ELHAB) PICT PICU
	?? PAIP
	?? M.ELSALD PICT PICU
	?? PAIP
	M.DEBE=M.DEBE+M.ELDEB
	M.HABER=M.HABER+ABS(M.ELHAB)
RETURN .T.
