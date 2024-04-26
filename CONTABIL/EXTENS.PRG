* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : EXTENS.PRG                                               บ
* บ COMENTARIO    : DEVUELVE LA EXTENSION DEL ARCHIVO                        บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-10-93                                                    บ
* บ HORA       : 02:08:53am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION EXTENS
	PARAMETER E_FILE
	E_FILE=ALLTRIM(E_FILE)
RETURN UPPER(SUBSTR(E_FILE,AT('.',E_FILE)+1))
