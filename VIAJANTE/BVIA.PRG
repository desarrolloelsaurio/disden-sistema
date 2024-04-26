********************************************************************************
*-- Programa: Bvia.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : EL 'BATA'
*-- Notas   : BORRA VIAJANTES
********************************************************************************
stor RECNO() TO ff
registro=STR(ff)
ulpr=hora_ulp(program())
if cheqseg()
	DEFINE WINDOW win FROM mviar,mviac TO mviar+mviala,mviac+mviaan TITL " Borra "+biajas SHAD COLOR SCHE 8
	SELE via
	=LOCK("VIA") .OR. LOK("VIA")
	stor 25 TO COL
	SCAT MEMVAR
	=mvia(.T.)
	IF confirma("Borrar "+biajas,.T.,12,nul)
		DELE RECO ff
	ENDIF
	UNLO IN via
	=iaud('BORRO '+biajas+' '+via->codvia)
ELSE
	=iaudi()
ENDIF
=RELEWIN('WIN')
RETURN MEN_LIN(BOTOM)
