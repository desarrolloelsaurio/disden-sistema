* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ECAJA.PRG             บ
* บ COMENTARIO    : EGRESOS DE CAJA       บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 07-03-94                 บ
* บ HORA       : 07:31:00pm               บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
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
