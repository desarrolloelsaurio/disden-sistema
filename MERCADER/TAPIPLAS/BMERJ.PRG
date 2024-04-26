********************************************************************************
*-- Programa: BMERJ.PRG
*-- Fecha   : 11-06-92 05:36am
*-- Version : G. REINER
*-- Notas   : BORRA LEGAJO DE MERCADERIAS
*-- Modificaci¢n GOYO 06-10-92 05:44pm (movewin/audit)
********************************************************************************
REGISTRO=STR(RECNO("MER"))
ulpr=hora_ulp(program())
if cheqseg()
	SELE MER
	=LOCK() .OR. LOK()
	=movewin(3,1,8,1+mMERan,'win',' Datos del Producto ')
	=mmer(.t.,20,.t.)
	=MLEGA('Borra Legajo de Mercader¡a',;
	' Legajo de '+ALLTRIM(MER.merca)+" ")
	IF confirma('Borrar Legajo ? ',.T.,imerr+7,nul)
		REPL MER.legajo WITH ""
	ENDIF
	CLOSE MEMO MER.legajo
	=iaud(alltrim(str(MER.articulo))+'-'+MER.merca)
	=RELEWIN("LEGAJO")
	=RELEWIN("win")
	UNLO IN MER
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN
