#DEFINE NUL    0                                 && NUL
function sumarex
para nro
sele reQx
store nul to m.toto
scan for numero=nro
	if empty(monto)
		store nul to m.toto
		exit
	endif
	store m.toto+monto*pedido to m.toto
endscan
return m.toto