* ษออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : IVA.PRG                          บ
* บ COMENTARIO    : GESTION DE Condiciones de I.V.A. บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                         บ
* บ FECHA      : 09-05-93 - 01:09:40pm               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER             บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออผ
* REDUCCION 08-31-95 00:54am
PROCEDURE IVA
EXTERNAL PROCEDURE ELIIVA
=OPIVA()
ULPR=PROGRAM()
RETURN MIX("Condiciขn de I.V.A.","Condiciones de I.V.A.","COND. I.V.A.","COND. I.V.A.","IVATEX","IVACOD","ORDIVA",'2')
