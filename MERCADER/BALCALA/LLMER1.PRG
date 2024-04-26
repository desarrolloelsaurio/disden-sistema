********************************************************************************
*-- Programa: LLMER1.PRG
*-- Fecha   : 06/07/91
*-- Version : V.LEEGSTRA
*-- Notas   : RECUPERA MERCADERIA BORRADA LOGICAMENTE
********************************************************************************
STORE RECNO() TO ff
STORE STR(ff) TO registro
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=movewin(mmerr,mmerc,mmerr+mmerla,mmerc+mmeran,'win'," Recupera el Art¡culo ")
	SELE mer
	=lok("mer")
	STORE 20 TO COL
	SCAT MEMVAR
	DO mmer WITH .T.
	IF confirma("Recuperar el Art¡culo",.T.,18,NUL)
		RECA RECO ff
	ENDIF
	UNLO IN mer
	=RELEWIN('win')
	=iaud(mer.articulo)
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN
