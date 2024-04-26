FUNCTION LRIMPY0
	=working()
	if inter
		set order to codcli IN PER
	endif
	set order to articulo in mer
	sele rex
	set rela to articulo into mer
	set rela to remito into rem addi
	if inter
		sele rem
		set rela to codcli INTO PER addi
	endif
	sele rex
	NADA=GENTMP()
	INDE ON MER.MERCA TO (NADA) FOR EVAL(FISC) COMP
	sele rex
	go top
	store nul to can,tcan
	lamerca=mer.merca
	elarticulo=rex.articulo
	store paip+PADC('ARTICULO',10)+paip+PADC('DENOMINACION',20)+paip+padc("CANTIDAD",XACDIGI)+paip to acla
	STORE REPL("=",LEN(acla)) TO lns
	tt='Listado de Mercader¡as s/Remitos '+iif(inter,'Internos','a Clientes ')+ttque
	=unwork()
RETURN .T.
