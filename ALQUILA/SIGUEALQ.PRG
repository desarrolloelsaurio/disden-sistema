* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � FUNCTION      : SIGUEALQ.PRG                                             �
* � COMENTARIO    : DEVUELVE .T. SI EL MISMO INQUILINO ESTA CARGADO COMO     �
* �                 AFUTURO EN EL MISMO INMUEBLE                             �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 02-15-94                                                    �
* � HORA       : 08:25:16pm                                                  �
* � COPYRIGHT  : 1994 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
* S_INQ = CODIGO DEL INQUILINO
* S_INM = CODIGO DEL INMUEBLE
FUNCTION SIGUEALQ
	PARAMETER S_INQ,S_INM
	IF !USED("FUT")
		RETURN .F.
	ENDIF
	IF XSEEK(S_INM,"FUT","CODINM")
		RETURN FUT.CODCLI=S_INQ
	ENDIF
RETURN .F.
