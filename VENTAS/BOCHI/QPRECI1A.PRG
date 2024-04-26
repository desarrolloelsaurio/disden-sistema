function q_preci1
	IF precios=1
		precio=cosdol
	ELSE
		precio=cosdol+cosdol*mer.costor/100
		IF precios=3
			precio=precio+precio*mer.may/100
		ELSE
			IF precios=4
				precio=precio+precio*mer.may30/100
			ELSE
				IF precios=5
					precio=precio+precio*mer.min/100
				ELSE
					IF precios=6
						precio=precio+precio*mer.min30/100
					ENDI
				ENDI
			ENDI
		ENDI
	ENDI
return precio
