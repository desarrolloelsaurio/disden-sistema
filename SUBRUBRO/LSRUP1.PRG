* 旼 PROGRAMA 컴컴컴컴컴컴컴컴�
* �    ARCHIVO: LSRUP1.PRG    �
* �       AUTOR: G. REINER    �
* � Date created: 12-10-92    �
* � Time created: 11:29:00am  �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴�
FUNCTION LSRUP1
	? paip
	?? STR(RECNO(),5)
	?? '| '
	?? zero(rub.codrub,3)+'.'+zero(rub.codsrub,3)
	?? ' |'
	?? iif(rub.codsrub=0,rub.rubro+"   ","   "+rub.rubro)
	=impuse()
RETURN .T.
