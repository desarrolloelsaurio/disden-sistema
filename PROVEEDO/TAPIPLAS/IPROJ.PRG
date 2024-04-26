********************************************************************************
*-- Programa: IPROJ.PRG
*-- Fecha   : 03-31-92 11:06am
*-- Version : R. 'EL BATA'
*-- Notas   : INGRESA LEGAJO DE PROVEEDORES
*-- Modificaci¢n GOYO 06-10-92 05:48pm (movewin)
********************************************************************************
ulpr=hora_ulp(program())
IF cheqseg()
	stor 25 TO COL
	SELE pro
	=movewin(3,1,8,1+mproan,'win',' Datos del Proveedor ')
	SCAT TO AGX
	DIME AGX[2]
	=MPRO(.T.,COL,.T.)
	=MLEGA(;
	'[TAB] para Grabar - [ESC] para Salir',;
	' Legajo de '+ALLTRIM(pro->proveedor)+" ",.T.)
	=iaud(alltrim(pro.procod)+'-'+pro.proveedor)
	=RELEWIN('win')
ELSE
	=iaudi()
ENDIF
RETURN
