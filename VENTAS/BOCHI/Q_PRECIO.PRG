FUNCTION Q_PRECIO
	IF !EMPTY(MER.dolar)
		IF moneda=1
			cosdol=mer.dolar*valdol
		ELSE
			cosdol=mer.dolar
		ENDI
	ELSE
		cosdol=mer.costo
	ENDI
	precio=q_preci1()
RETURN ROUND(precio,2)
