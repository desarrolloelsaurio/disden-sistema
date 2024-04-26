* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LKAR1.PRG                                                บ
* บ COMENTARIO    : DERIVA A LISTADOS DE KARDE                               บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-16-93                                                    บ
* บ HORA       : 00:57:04am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
	tt=t1+' - Depขsito F brica'
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
