* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LKAR1.PRG                                                �
* � COMENTARIO    : DERIVA A LISTADOS DE KARDE                               �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-16-93                                                    �
* � HORA       : 00:57:04am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
ulpr=PROGRAM()
DO CASE
CASE BAR()=1
	fisc=fsc
	tt=t1+' - Todos los Talleres'
	tt=alltrim(left(tt,78))
	if porpan
		do lkarp
	else
		do lkari
	endif
case bar()=2
	fisc=fsc+' .and. EMPTY(taller)'
	tt=t1+' - Dep�sito F�brica'
	if porpan
		do lkarp
	else
		do lkari
	endif
case bar()=3
	store 0 to respuesta
	IF !EMPTY(ELITAL(" a Listar"))
		fisc=fsc+' .and. taller="'+TAL.TALCOD+'"'
		tt=t1+' - '+alltrim(tal.talleres)
		tt=alltrim(left(tt,78))
		if porpan
			do lkarp
		else
			do lkari
		endif
	endif
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
