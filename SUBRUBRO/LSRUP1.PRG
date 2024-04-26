* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    ARCHIVO: LSRUP1.PRG    ³
* ³       AUTOR: G. REINER    ³
* ³ Date created: 12-10-92    ³
* ³ Time created: 11:29:00am  ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LSRUP1
	? paip
	?? STR(RECNO(),5)
	?? '| '
	?? zero(rub.codrub,3)+'.'+zero(rub.codsrub,3)
	?? ' |'
	?? iif(rub.codsrub=0,rub.rubro+"   ","   "+rub.rubro)
	=impuse()
RETURN .T.
