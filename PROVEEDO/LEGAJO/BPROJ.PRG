********************************************************************************
*-- Programa: BPROJ.PRG
*-- Fecha   : 06/28/91
*-- Version : g. reiner
*-- Notas   : BORRA LEGAJO DE PROVEEDORES
*-- Modificaci¢n GOYO 06-10-92 05:48pm (movewin/auditor)
*******************************************************************************
ulpr=HORA_ULP(PROGRAM())
IF CHEQSEG()
stor 20 TO COL
SELE PRO
ACTI SCRE
=men_lin('[ESC] para Salir')
=MOVEWIN(3,1,8,1+mPROan,'WIN',' Datos del Proveedor ')
@ 1,2 SAY "Cod.Proveedor" COLOR SCHE 3
@ 1,COL GET PRO.PROCOD PICTURE '@!'
@ 2,2 SAY "Proveedor  " COLOR SCHE 3
@ 2,COL GET PRO.PROVEEDOR PICTURE '@!'
CLEAR GETS
=movewin(8,5,20,75,'win1',' Borra Legajo de '+ALLTRIM(PRO.PROVEEDOR)+" ")
MODI MEMO legajo WINDOW win1 NOWAIT
ACTI SCRE
IF confirma('Borrar Legajo ? ',.T.,iPROr+7,nul)
REPL PRO.legajo WITH ""
ENDIF
CLOSE MEMO PRO.legajo
=iaud(alltrim(PRO.PROCOD)+'-'+pro.proveedor)
=RELEWIN("win1")
=RELEWIN("win")
ELSE
=iaudi()
ENDIF
RETURN men_lin(botom)
