********************************************************************************
*-- Programa: mproJ.PRG
*-- Fecha   : 03-31-92 11:08am
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA LEGAJO DE PROVEEDORES
*-- Modificaci¢n GOYO 06-10-92 05:47pm (movewin/relewin)
********************************************************************************
stor HORA_ULP(PROGRAM()) TO ulpr
IF CHEQSEG()
	stor 25 TO COL
	SELE pro
	=MOVEWIN(3,1,8,1+mproan,'WIN',' Datos del Proveedor ')
	SCAT TO AGX
	DIME AGX[2]
	=MPRO(.T.,COL,.T.)
	=MLEGA(;
	'[TAB] para Pr¢ximo Proveedor - [ESC] para Salir',;
	' Legajo de '+ALLTRIM(pro->proveedor)+" ")
	=iaud(alltrim(pro.procod)+'-'+pro.proveedor)
	=RELEWIN('win')
	=iaud(pro.procod+'-'+PRO.PROVEEDOR)
ELSE
	=IAUDI()
ENDIF
RETURN
