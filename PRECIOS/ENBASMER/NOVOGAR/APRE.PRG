* 浜様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : APRE.PRG                        �
* � COMENTARIO    : GENERA ACTUALIZACION DE PRECIOS �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                        �
* � FECHA      : 11-19-93                           �
* � HORA       : 00:36:59am                         �
* � COPYRIGHT  : 1993 by GREGORIO REINER            �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様�
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	TT=''
	FISC=QWMER(BAR())
	IF FISC#'.F.'
		TT='Actualizaci�n Precios'+tt
		DO APRE1
	ENDIF
ELSE
	=IAUDI()
ENDIF
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
