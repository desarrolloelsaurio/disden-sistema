* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LINM.PRG                                                 �
* � COMENTARIO    : DERIVA A LISTADOS DE INMUEBLE                            �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION LINM
	PARAMETER PORPAN
	IF XINM
		ALT_TIT=ALLT(WTIT("XINM"))
		DO CASE
		CASE ALT_TIT='Autorizaci�n de Alquileres'
			=LALQAUT(PORPAN)
		CASE ALT_TIT='Emisi�n de Recibo Bancario'
			=LALQREC()
		CASE ALT_TIT="Datos Impositivos del Inmueble"
			=QUERYINM(PORPAN,2)
		CASE ALT_TIT="Legajo del Inmueble"
			=LINMJI()
		CASE ALT_TIT="Datos Personales"
			* 1 DATOS PERSONALES
			* 2 DATOS CONTRACTUALES
			* 3 DATOS MONETARIOS
			=IIF(XXXINM,QYALQMON(PORPAN,3),IIF(XXINM,QYALQCON(PORPAN,2),QYALQPER(PORPAN,1)))
		ENDCASE
	ELSE
		=QUERYINM(PORPAN,1)
	ENDIF
RETURN .T.
