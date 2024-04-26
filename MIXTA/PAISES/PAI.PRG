* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : PAI.PRG              บ
* บ COMENTARIO    : GESTION DE PAISES    บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 09-05-93 - 01:09:40pm   บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
* REDUCCION 08-30-95 11:51pm
PROCEDURE PAI
EXTERNAL PROCEDURE ELIPAI
=OPPAI()
ULPR=PROGRAM()
if _windows
RETURN MIX("Paํs","Paํses","PAIS","PAISES","PAITEX","PAICOD","ORDPAI","ใ")
ELSE
RETURN MIX("Paกs","Paกses","PAIS","PAISES","PAITEX","PAICOD","ORDPAI","ใ")
ENDIF