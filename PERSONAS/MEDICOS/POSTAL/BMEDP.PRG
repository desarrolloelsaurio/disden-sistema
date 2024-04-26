********************************************************************************
*-- Programa: BMEDJ.PRG
*-- Fecha   : 06/28/91
*-- Version : g. reiner
*-- Notas   : BORRA LEGAJO DE MEDICOS
*-- Modificaci¢n GOYO 06-10-92 05:44pm (movewin/audit)
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	=HORA_ULP()
	stor 20 TO COL
	SELE MED
	=men_lin('[ESC] para Salir')
	SHIT=MMED1(5,5)
    =MLEGA(' Borra Domicilio Postal de '+SHIT+" ",' Legajo de '+SHIT+" ",.F.,.T.,'postal')
	IF confirma('Borrar Domicilio Postal',.T.,iMEDr+7,nul)
		REPL MED.postal WITH ""
	ENDIF
	CLOSE MEMO MED.postal
	=iaud(alltrim(MED.codMED)+'-'+SHIT)
	=RELEWIN("LEGAJO")
	=RELEWIN("win")
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN
