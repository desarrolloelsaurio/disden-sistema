SET DATE BRIT
sele 1
use F:\sistemas\ventas\ventasa\FACTURA alias FAC 
SET orde TO FACTURA
sele 2
use F:\sistemas\ventas\ventasa\cccli alias ccl 
set rela to ALLT(NUMERORE) into FAC
TOPE = CTOD("20/03/98")
REPL COMISION WITH COMISION/(FAC.MONTONET+FAC.DESCUENTO)*FAC.MONTONET ;
     FOR FAC.DESCUENTO>0 AND FECHAOP>TOPE AND COMPRRE="FA"
CLOS DATA
RETU




**repl comision with monto*iIf(EMPTY(AT("MA",PER.CAG)),0.1,0.03) ; 
         for comprre#"SD" AND comprre#"SA" .and. empty(comision)

