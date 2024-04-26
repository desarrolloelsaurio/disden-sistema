SET PATH TO \SISTEMAS\VARIOS\,\SISTEMAS\CARTELES,\SISTEMAS\BLOQUEOS,\SISTEMAS\CUERDAS
sele 0
use \sistemas\expensas\expensaa\personas alias per
sele 0
use \sistemas\alquiler\alquilea\CONTRATO alias ALQ
sele per
scat memv blan 
sele ALQ
scan
m.cliente="INQUILINO "+ALLTRIM(STR(RECNO()))
m.codcli=ALQ.CODCLI
M.FILTRO="I"
=AGRABAR("PER")
m.cliente="GARANTIA "+ALLTRIM(STR(RECNO()))
m.codcli=ALQ.CODGAR1
M.FILTRO="G"
=AGRABAR("PER")
sele ALQ
endscan