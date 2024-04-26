*********************************
*-- Programa: BCIU.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : EL 'BATA'
*-- Notas   : BORRA CIUDAD
*********************************
stor RECNO() TO ff
registro=STR(ff)
ulpr=hora_ulp(program())
if cheqseg()
	=moveCENT(0,0,7,60,"win"," Borra Ciudades ")
	SELE mix
	SET ORDER TO TAG CIUTEX
	=lock() .or. lok("mix")
		stor 25 TO COL
		SCAT MEMVAR
		=mciu(.T.)
		IF confirma("Borrar la Ciudad",.T.,12,nul)
			DELE RECO ff
			=IAUD(M.TEXTO1)
		ENDIF
	UNLO IN mix
	=relewin('win')
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
