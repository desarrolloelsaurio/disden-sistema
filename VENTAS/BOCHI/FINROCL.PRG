set dele off
i=0
use f:\sistemas\ventas\ventasa\personas 
set orde to codcli
go top
store codcli to ultnro 
scan
	do while prox(ultnro)<codcli
		??prox(ultnro)
		??"  "
		store prox(ultnro) to ultnro
		i = i + 1
		if i%8=0
			?
		endif
		if i=1000
			cancel 
		endif
	enddo
	store codcli to ultnro 
endscan

function prox
para cual
return "C"+righ(repl("0",8)+allt(str(val(subst(cual,2))+1)),9)
