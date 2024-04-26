FUNCTION IMP_FAC
PARAMETER ULPR
=working()
=xseek(fac.codcli,'PER','codcli')
set order to tag articulo in mer
sele fax
set rela to articulo into mer
SEEK FAC.FACTURA
REPO FORM (ULPR) ;
PDSETUP TO PRIN ;
NOCONSOLE ;
WHILE FAX.FACTURA=FAC.FACTURA
RETURN REOPFAC()
