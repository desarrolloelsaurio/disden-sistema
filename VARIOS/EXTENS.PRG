* 浜様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : EXTENS.PRG                         �
* � COMENTARIO    : DEVUELVE LA EXTENSION DEL ARCHIVO  �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                           �
* � FECHA      : 08-10-93                              �
* � HORA       : 02:08:53am                            �
* � COPYRIGHT  : 1993 by GREGORIO REINER               �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION EXTENS
	PARAMETER E_FILE
	E_FILE=ALLTRIM(E_FILE)
RETURN UPPER(SUBSTR(E_FILE,AT('.',E_FILE)+1))
