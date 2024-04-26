*******************************************************************************
*-- Programa: lrimpy0.prg
*-- Fecha   : 08/25/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE mercaderias en remitos (CABECERA)
*-- VERSION NAZA
********************************************************************************
FUNCTION LRIMPY0
	=working()
	set order to codcli IN PER
	set order to articulo in mer
	sele rex
	set rela to LEFT(articulo,13) into mer
	set rela to remito into rem addi
	sele rem
	set rela to codcli INTO PER addi
	sele rex
	NADA=GENTMP()
	INDE ON MER.MERCA TO (NADA) FOR EVAL(FISC) COMP
	sele rex
	go top
	lamerca=mer.merca
	elarticulo=LEFT(rex.articulo,13)
	store paip+PADC('ARTICULO',10)+paip+PADC('DENOMINACION',20)+paip+padc("CANTIDAD",XACDIGI)+paip to acla
	STORE REPL("=",LEN(acla)) TO lns
	tt='Listado de Items Remitos '
	=unwork()
RETURN .T.
