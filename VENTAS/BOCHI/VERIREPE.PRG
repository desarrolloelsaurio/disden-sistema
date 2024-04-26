set printer to c:\jaja.txt
set printer on
use f:\sistemas\ventas\ventasa\personas orde codcli
m.codant =""
scan
	if m.codant=codcli
		?codcli, recno(), cliente, "*", m.codant, m.recant, m.cliant
	endif
	m.codant = codcli
	m.recant = recn()
	m.cliant = cliente
ends
set printer to
set printer off
