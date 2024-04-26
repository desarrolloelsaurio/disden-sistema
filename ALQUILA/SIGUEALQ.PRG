* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ FUNCTION      : SIGUEALQ.PRG                                             บ
* บ COMENTARIO    : DEVUELVE .T. SI EL MISMO INQUILINO ESTA CARGADO COMO     บ
* บ                 AFUTURO EN EL MISMO INMUEBLE                             บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 02-15-94                                                    บ
* บ HORA       : 08:25:16pm                                                  บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
