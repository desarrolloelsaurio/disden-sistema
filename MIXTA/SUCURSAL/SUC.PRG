* 浜様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : SUC.PRG                 �
* � COMENTARIO    : GESTION DE PROVINCIAS   �
* 麺様様様様様様様様様様様様様様様様様様様様�
* � FECHA      : 09-05-93 - 01:09:40pm      �
* � COPYRIGHT  : 1993 by GREGORIO REINER    �
* 藩様様様様様様様様様様様様様様様様様様様様�
* REDUCCION 08-30-95 11:23pm
PROCEDURE SUC
EXTERNAL PROCEDURE ELISUC
=OPSUC()
ULPR=PROGRAM()
RETURN MIX("Sucursal","Sucursales","SUCURSAL","SUCURSALES","SUCTEX","SUCCOD","ORDSUC","S",4,"ZERO(M.TEXTO2,4)")
