********************************************************************************
*-- Programa: LLMER1.PRG
*-- Fecha   : 06/07/91
*-- Version : V.LEEGSTRA
*-- Notas   : RECUPERA MERCADERIA BORRADA LOGICAMENTE
********************************************************************************
stor RECNO() TO ff
stor STR(ff) TO registro
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=WIN0()
	SELE mer
	=LOCK() .OR. lok("mer")
	stor 23 to col
	stor 15 to col1
	SCAT MEMVAR
	DO mmer WITH .T.
	IF confirma("Recuperar el Art¡culo",.T.,18,nul)
		RECA RECO ff
		=iaud(alltrim(mer.articulo)+'-'+mer.merca)
	ENDIF
	UNLO IN mer
	=RELEWIN("win")
ELSE
	=iaudi()
ENDIF
RETURN men_lin(botom)
