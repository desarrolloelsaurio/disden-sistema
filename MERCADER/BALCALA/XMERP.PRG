FUNCTION XMERP
	=DOTALK()
	sele mer
	SET ORDER TO
	INDE ON ARTICULO TAG ARTICUL1 OF "NADA" FOR proveedor=m.procod
	INDE ON MERCA TAG MERC1 OF "NADA" FOR proveedor=m.procod
	=UNTALK()
RETURN .T.
