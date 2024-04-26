*******************************************************************************
*-- Programa: BMER1.PRG
*-- Fecha   : 06/11/91
*-- Version : V.LEEGSTRA
*-- Notas   : BORRA MERCADERIA
********************************************************************************
STORE RECNO() TO ff
STORE STR(ff) TO registro
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	=movewin(mmerr,mmerc,mmerr+mmerla,mmerc+mmeran,win," Borra el Art¡culo ")
	SELE mer
	=LOCK() .OR. lok("mer")
	STORE 20 TO COL
	SCAT MEMVAR
	DO mmer WITH .T.
	IF confirma("Borrar el Art¡culo",.T.,18,0)
		DELE RECO ff
		=iaud(mer.articulo)
	ENDIF
	UNLO IN mer
	=RELEWIN(win)
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN
