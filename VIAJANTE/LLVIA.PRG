********************************************************************************
*-- Programa: LLvia.PRG
*-- Fecha   : 06/10/91 02:47pm
*-- Version : R. 'EL BATA'
*-- Notas   : RECUPERA PROVINCIAS BORRADAS LOGICAMENTE
********************************************************************************
stor RECNO() TO ff
registro=STR(ff)
ulpr=hora_ulp(program())
if cheqseg()
	DEFINE WINDOW win FROM mviar,mviac TO mviar+mviala,mviac+mviaan TITL " Recupera "+biaja+" " SHAD COLOR SCHE 8
	SELE via
	do lok with "via"
	stor 25 TO COL
	SCAT MEMVAR
	=mvia(.T.)
	IF confirma("Recuperar "+biaja,.T.,12,nul)
		RECA RECO ff
	ENDIF
	RELE WIND win
	UNLO IN via
	=iaud(via.codvia)
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
