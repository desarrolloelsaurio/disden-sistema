FUNCTION SAYTEX_2
	?
	IF !EMPTY(texto3)
		?
		?
		??? CHR(27)
		??? 'x1'
		?? PADC(ALLTRIM(texto3),80)
		IF !EMPTY(texto4)
			? PADC(ALLTRIM(texto4),80)
		ENDI
	ENDI
	IF mmaayy=1
		?
		? "Todos los Productos Llevan I.V.A., Que Sera Facturado por Separado"
	ENDI
RETURN .T.
