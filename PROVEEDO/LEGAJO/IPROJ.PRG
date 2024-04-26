********************************************************************************
*-- Programa: IPROJ.PRG
*-- Fecha   : 03-31-92 11:06am
*-- Version : R. 'EL BATA'
*-- Notas   : INGRESA LEGAJO DE PROVEEDORES
*-- Modificaci¢n GOYO 06-10-92 05:48pm (movewin)
********************************************************************************
ulpr=hora_ulp(program())
IF cheqseg()
	stor 20 TO COL
	SELE pro
	=men_lin('[TAB] para Grabar - [ESC] para Salir')
	=movewin(3,1,8,1+mproan,'win',' Datos del Proveedor ')
	@ 1,2 SAY "Cod.Proveedor" COLOR SCHE 3
	@ 1,COL GET pro.procod PICTURE '@X10'
	@ 2,2 SAY "Proveedor    " COLOR SCHE 3
	@ 2,COL GET pro.proveedor PICTURE '@X30'
	CLEAR GETS
	ON KEY LABEL TAB KEYBOARD CHR(23)
	=movewin(8,5,20,75,'win1',' Legajo de '+ALLTRIM(pro.proveedor)+" ")
	MODI MEMO legajo WINDOW win1
	CLOSE MEMO legajo
	ON KEY LABEL TAB
	=iaud(alltrim(pro.procod)+'-'+pro.proveedor)
	=RELEWIN('win')
	=relewin('win1')
ELSE
	=iaudi()
ENDIF
RETURN
*: EOF: IPROJ.PRG
