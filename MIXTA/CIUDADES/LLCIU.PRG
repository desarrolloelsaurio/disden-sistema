********************************************************************************
*-- Programa: LLciu.PRG
*-- Fecha   : 06/10/91 02:47pm
*-- Version : R. 'EL BATA'
*-- Notas   : RECUPERA PROVINCIAS BORRADAS LOGICAMENTE
********************************************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
stor RECNO() TO ff
registro=STR(ff)
ulpr=hora_ulp(program())
if cheqseg()
	=moveCENT(NUL,NUL,7,60,"win"," Recupera Ciudades ")
	SELE mix
	=LOCK() .OR. LOK()
	stor 25 TO COL
	SCAT MEMVAR
	=mciu(.T.)
	IF confirma("Recuperar la CIUDAD",.T.,12,nul)
		RECA RECO ff
		=IAUD(M.TEXTO1)
	ENDIF
	=RELEWIN('win')
	UNLO IN mix
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
