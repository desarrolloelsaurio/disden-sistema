use f:\sistemas\ventas\ventasa\cccli   alias ccl in 0
use f:\sistemas\ventas\ventasa\factura alias fac in 0
select fac.*, ccl.monto as cclmon from fac, ccl ;
     where (fac.monto-fac.descuento)!=fac.montobru and ;   
           year(fac.fecha)=2018 and ;
           fac.factura=ccl.numerore and ;
           (fac.monto-fac.descuento)*1.21 != ccl.monto

