set talk off
set date brit
set excl off
set dele on

use f:\sistemas\ventas\ventasa\factudat alias fax in 1
use f:\sistemas\ventas\ventasa\factura  alias fac in 2
use f:\sistemas\ventas\ventasa\personas alias per in 3
use f:\sistemas\ventas\ventasa\merca    alias mer in 4
use f:\sistemas\ventas\ventasa\mixta    alias mix in 5

if elicag()
	store date() to fechini, fechfin
	=elifech()
	sele fax.*, per.cag from fax, fac, per, mer where;
		fac.factura = fax.factura and;
		per.codcli  = fac.codcli  and;
		mer.articulo= fax.articulo and;
		mer.proveedor = "R000000016" and;
		betw(fac.fechaem, fechini, fechfin) ;
		into cursor tmp
	sum montoor*cantidad to fintot for left(mix.texto2,2)+"/"$cag
	defi wind a from 10,10 to 15,40
	acti wind a 
	?mix.texto1, " Vendio ",fintot
	do while inkey()=0
	enddo
endif
	


function ELICAG
	SELE MIX
	set orde to cagtex in mix
	DEFINE POPU PEPE PROMP FIEL TEXTO1
	ON KEY LABEL ENTER  DEACTIVATE POPU PEPE
	ON KEY LABEL ESCAPE DEACTIVATE POPU PEPE
	ACTI POPU PEPE
	sele mix
	on key label ENTER
	on key label ESCAPE
return LAST()#27


function ELIFECH
	define window a from 10,10 to 15,40
	activa window a
	@ 1,4 say "Desde  : "
	@ 1,10 get fechini pict "@D"
	@ 2,4 say "Hasta  :"
	@ 2,10 get fechfin pict "@D"
	read
	rele wind a
return