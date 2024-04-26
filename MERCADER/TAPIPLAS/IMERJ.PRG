********************************************************************************
*-- Programa: IMERJ.PRG
*-- Fecha   : 11-06-92 05:34am
*-- Version : G. REINER
*-- Notas   : INGRESA LEGAJO DE MERCADERIAS
*-- Modificaci¢n GOYO 06-10-92 05:55pm (men_lin/movewin/iaudi)
********************************************************************************
FF=RECNO("MER")
REGISTRO=STR(FF)
ulpr=hora_ulp(PROGRAM())
IF CHEQSEG()
	SELE MER
	=LOCK() .OR. LOK()
	=movewin(3,1,8,1+mMERan,'win',' Datos del Producto ')
	=mmer(.t.,20,.t.)
	=MLEGA('[TAB] para Grabar - [ESC] para Salir',;
	' Legajo de '+ALLTRIM(MER.merca)+" ",.T.)
	=iaud(alltrim(str(MER.articulo))+'-'+MER.merca)
	=RELEWIN('win')
	UNLO IN MER
ELSE
	=iaudi()
ENDIF
RETURN
