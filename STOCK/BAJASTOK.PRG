* FUNCION QUE BAJA O SUBE DEL STOCK
FUNCTION BAJASTOK
	PARAMETER B_MERCA,B_CANT,B_OPK,B_DREF,B_NROREF,B_CLIENTE,B_DETALLE,B_PROV
	IF USED("STO")
		B_ALIAS="STO"
	ELSE
		B_ALIAS="MER"
	ENDIF
	SELE (B_ALIAS)
	IF XSEEK(B_MERCA,(B_ALIAS),'ARTICULO')
		REGISTRO=STR(RECNO())
		=LOCK() .OR. LOK()
		REPL STOCK WITH STOCK-B_CANT
		UNLO IN (B_ALIAS)
	ENDIF
	IF USED("KAR")
	SELE KAR
	SCAT MEMV BLAN
	M.FECHAOP=Date()
	M.ARTICULO=B_MERCA
	M.OPK=B_OPK
	M.DOCREF=B_DREF
	M.NRODOCREF=B_NROREF
	M.CLIENTE=B_CLIENTE
	M.DETALLE=B_DETALLE
	IF B_CANT>0
		M.SALIDA=B_CANT
	ELSE
		M.ENTRADA=ABS(B_CANT)
	ENDIF
	M.PROVEEDOR=B_PROV
	=AGRABAR("KAR")
	ENDIF
RETURN .T.
