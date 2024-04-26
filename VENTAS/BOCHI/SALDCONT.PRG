clientecero = "C000000001"
set dele on
set safe off
set talk off
set excl off
set defa to f:\sistemas\ventas\ventasa\
sucu="0001-"
use document alias doc
sele 0
use cccli
maximino = recc()
sum monto to losdebe for codcli = clientecero and esdebe(comprre)  and recn()<=maximino and !dele()
sum monto to loshabe for codcli = clientecero and !esdebe(comprre) and recn()<=maximino and !dele()
scatter memvar blank

*        proximo recibo
sele doc
go 3
=lock() 
m.numero=doc.numero
repl doc.numero with doc.numero+1
unlo in doc

*        arma variables del recibo
m.codcli = clientecero
m.comprre = "RE"
m.compr="RE Nº  "+sucu+zero(m.numero,8)
NUMERORE=" "+sucu+zero(m.numero,8)
store date() to m.fechaop,m.fechave,m.fecha
m.moneda="$"
store losdebe-loshabe to m.monto, m.equivale, m.cuota
store .t. to m.pagada
*///   store m.usador to m.usuario
STORE 0 TO m.TGY_DEBE,m.TGY_HABER,m.TGY_SALDO
store 0 to m.comision
m.detalle = "Saldo a Cero" 

*         - Pasa los movimientos
sele cccli
copy to c:\nada for codcli = clientecero and recn()<=maximino and !dele()
use ccclih in 0
sele ccclih
append from c:\nada
insert into ccclih from memvar

*    ahora los borro
sele cccli
dele for codcli = clientecero and recn()<=maximino
return
