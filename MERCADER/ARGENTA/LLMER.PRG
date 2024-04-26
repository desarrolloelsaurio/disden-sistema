********************************************************************************
*-- Programa: LLMER.PRG
*-- Fecha   : 12/14/91
*-- Version : V.LEEGSTRA
*-- Notas   : RECUPERA MERCADERIAS BORRADAS LOGICAMENTE
********************************************************************************
STORE RECNO() TO ff
STORE STR(ff) TO registro
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	DEFINE WINDOW win FROM mmerr,mmerc TO mmerr+mmerla,mmerc+mmeran TITL " Recupera Mercader¡a " SHAD COLOR SCHE 8
	SELE mer
	do lok with "mer"
	STORE 13 TO COL
	SCAT MEMVAR
	DO mmer WITH .T.
	IF confirma("Recuperar la Mercader¡a ",.T.,12,0)
		RECA RECO ff
		=IAUD(MER.PALPOPUP)
	ENDIF
	=RELEWIN("win")
	UNLO IN mer
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
