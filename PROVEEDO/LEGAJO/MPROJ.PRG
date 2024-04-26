********************************************************************************
*-- Programa: mproJ.PRG
*-- Fecha   : 03-31-92 11:08am
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA LEGAJO DE PROVEEDORES
*-- Modificaci¢n GOYO 06-10-92 05:47pm (movewin/relewin)
********************************************************************************
stor HORA_ULP(PROGRAM()) TO ulpr
IF CHEQSEG()
stor 20 TO COL
SELE pro
=MEN_LIN('[TAB] para Pr¢ximo - [ESC] para Finalizar')
=MOVEWIN(3,1,8,1+mproan,'WIN',' Datos del Proveedor ')
@ 1,2 SAY "Cod.Proveedor" COLOR SCHE 3
@ 1,COL GET pro.procod PICTURE '@X10'
@ 2,2 SAY "Proveedor    " COLOR SCHE 3
@ 2,COL GET pro.proveedor PICTURE '@X30'
CLEAR GETS
ON KEY LABEL TAB KEYBOARD CHR(23)
=movewin(8,5,20,75,'win1',' Legajo de '+ALLTRIM(pro.proveedor)+" ")
MODI MEMO legajo NOEDIT WINDOW win1
CLOSE MEMO legajo
on key label tab
=iaud(pro.procod+'-'+PRO.PROVEEDOR)
=RELEWIN("win")
=relewin("win1")
ELSE
=IAUDI()
ENDIF
RETURN
