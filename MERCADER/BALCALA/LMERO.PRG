* ��������������������������������������������������������������������������ͻ
* � PROCEDIMIENTO : LMERO.PRG                                                �
* � COMENTARIO    : GENERA INDICE DE MERCADERIAS                             �
* ��������������������������������������������������������������������������͹
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-30-93                                                    �
* � HORA       : 02:09:56am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* ��������������������������������������������������������������������������ͼ
FUNCTION LMERO
	PARAMETER L_ARCHI
	IF EMPTY(L_ARCHI)
		L_ARCHI=GENTMP()
	ENDIF
	SELE MER
	SET ORDER TO
	=FLOCK() .OR. FLOCK()
	IF TYPE("ORDMER")#'L' .OR. ORDMER
		IF TYPE("ORDRUB")#'L' .OR. ORDRUB
			SORT ON RUBRO,ARTICULO ;
			TO (L_ARCHI) FOR &FISC
		ELSE
			SORT ON RUB.RUBRO,ARTICULO ;
			TO (L_ARCHI) FOR &FISC
		ENDIF
	ELSE
		IF TYPE("ORDRUB")#'L' .OR. ORDRUB
			SORT ON RUBRO,MERCA ;
			TO (L_ARCHI) FOR &FISC
		ELSE
			SORT ON RUB.RUBRO,MERCA  ;
			TO (L_ARCHI) FOR &FISC
		ENDIF
	ENDIF
	SELE MER
	USE
	USE (L_ARCHI) ALIAS MER EXCL
RETURN .T.