pat='f:\sistemas\ventas\ventasa\'
sele 1
use (pat+'factura')    orde factura alias fac 
scatt memv
	store "A0003-00000001" to m.factura
	store {01/01/99} to m.fechaem, m.fechave
	store "CO" to m.condpago
sele 2
use (pat+'cccli')  alias ccl
scan for ccl.comprre="S"
	scatt memv
	insert into fac from memv
ends