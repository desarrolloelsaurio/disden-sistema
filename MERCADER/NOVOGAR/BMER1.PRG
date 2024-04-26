*******************************************************************************
*-- Programa: BMER1.PRG
*-- Fecha   : 03-27-92 02:16am
*-- Version : G. REINER
*-- Notas   : BORRA MERCADERIA
*-- Modif. 10-20-92 08:18pm agrego col2 y corrijo flok
********************************************************************************
STORE RECNO() TO ff
STORE STR(ff) TO registro
ulpr=hora_ulp(program())
IF cheqseg()
	SELE mer
	=Lock() .OR. LOK()
	STOR 23 TO COL
	stor 16 to col1
	=win0()
	scat memv
	DO mmer with .t.
	IF confirma("Borrar el Art¡culo",.T.,18,0)
		DELE RECO ff
	ENDIF
	UNLO IN mer
	=RELEWIN('win')
	=iaud(mer.articulo+'-'+alltrim(mer.merca))
ELSE
	=iaudi()
ENDIF
RETURN men_lin(botom)
