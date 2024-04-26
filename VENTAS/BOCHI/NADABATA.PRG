set talk on
set dele off
clea
sele 1
use f:\sistemas\ventas\ventasa\merca orde articulo alias mer
sele 2
use f:\sistemas\ventas\ventasa\factura orde factura alias fac
sele 3
use f:\sistemas\ventas\ventasa\factudat alias fax
sele 4
use f:\sistemas\ventas\ventasa\personas orde codcli alias cli
sele 5
use f:\sistemas\ventas\ventasa\mixta orde cagtex alias cag


m.quien=""
DEFINE POPUP popfield PROMPT FIELD texto1 SCROLL MARGIN MARK CHR(16)
@ 2,25 GET m.quien POPUP popfield 
read
clea
@ 1,1 say cag.texto1

sele fax
set rela to factura  into fac
set rela to articulo into mer addi
sele fac
set rela to codcli into cli

sele fax
sort to ("c:\promedi\"+alltr(cag.texto1)) on fax.articulo  ;
        fiel mer.merca, fax.articulo, fax.cantidad , fax.total;
		for year(fac.fechaem)=2000 and ;
		    mer.proveedor="R000002356" and ;
		    left(cag.texto2,2)$cli.cag
