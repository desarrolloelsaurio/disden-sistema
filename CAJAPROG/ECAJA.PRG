* 浜様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : ECAJA.PRG             �
* � COMENTARIO    : EGRESOS DE CAJA       �
* 麺様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER              �
* � FECHA      : 07-03-94                 �
* � HORA       : 07:31:00pm               �
* � COPYRIGHT  : 1994 by GREGORIO REINER  �
* 藩様様様様様様様様様様様様様様様様様様様�
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE BAR()=1
     DO ECAJ1
CASE BAR()=2
     DO OPBAN
     DO ECAJ2
CASE BAR()=3
     DO ECAJ3
ENDCASE
RETURN MEN_LIN(botom)
