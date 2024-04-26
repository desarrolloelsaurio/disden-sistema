* ษอออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : SUC.PRG                 บ
* บ COMENTARIO    : GESTION DE PROVINCIAS   บ
* ฬอออออออออออออออออออออออออออออออออออออออออน
* บ FECHA      : 09-05-93 - 01:09:40pm      บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER    บ
* ศอออออออออออออออออออออออออออออออออออออออออผ
* REDUCCION 08-30-95 11:23pm
PROCEDURE SUC
EXTERNAL PROCEDURE ELISUC
=OPSUC()
ULPR=PROGRAM()
RETURN MIX("Sucursal","Sucursales","SUCURSAL","SUCURSALES","SUCTEX","SUCCOD","ORDSUC","S",4,"ZERO(M.TEXTO2,4)")
