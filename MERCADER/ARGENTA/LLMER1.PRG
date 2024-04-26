********************************************************************************
*-- Programa: LLMER1.PRG
*-- Fecha   : 06/07/91
*-- Version : V.LEEGSTRA
*-- Notas   : RECUPERA MERCADERIA BORRADA LOGICAMENTE
********************************************************************************
STORE RECNO() TO ff
STORE STR(ff) TO registro
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	=MOVEWIN(mmerr,mmerc,mmerr+mmerla,mmerc+mmeran,"WIN"," Recupera el Art¡culo ")
	SELE mer
	=LOCK() .OR. lok("mer")
	STORE 20 TO COL
	SCAT MEMVAR
	DO mmer WITH .T.
	IF confirma("Recuperar el Art¡culo",.T.,18,0)
		RECA RECO ff
		=IAUD(MER.PALPOPUP)
	ENDIF
	UNLO IN mer
	=RELEWIN("win")
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
