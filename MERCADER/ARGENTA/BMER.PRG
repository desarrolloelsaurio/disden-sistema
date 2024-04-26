******************************************************************************
*-- Programa: BMER.PRG
*-- Fecha   : 12/14/91
*-- Version : V.LEEGSTRA
*-- Notas   : BORRA MERCADERIA
********************************************************************************
STORE RECNO() TO ff
STORE STR(ff) TO registro
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	=movewin(mmerr,mmerc,mmerr+mmerla,mmerc+mmeran,'win'," Borra Mercader¡a ")
	SELE mer
	=LOCK() .OR. lok("mer")
	COL=13
	SCATTER MEMVAR
	DO mmer WITH .T.
	IF confirma("Borrar la Mercader¡a ",.T.,12,0)
		DELE RECO ff
		=iaud(mer.palpopup)
	ENDIF
	UNLO IN mer
	=RELEWIN('win')
ELSE
	=iaud()
ENDIF
=men_lin(botom)
RETURN
