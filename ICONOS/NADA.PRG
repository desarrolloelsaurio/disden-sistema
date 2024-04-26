use iconos
defi wind win at 0,0 size 20,40
acti wind win
cosa=alltrim(direc)+alltrim(icono)
@ 0,35 say (cosa) bitmap
defi wind win1 at 0,0 size 10,30 in win
acti wind win1
on key label enter do muesico
on key label uparrow do muesico
brow field icono ;
wind win1
rele wind win
on key label enter
on key label uparrow 
return 

function muesico
acti wind win
cosa=alltrim(direc)+alltrim(icono)
show gets wind win
return .t.