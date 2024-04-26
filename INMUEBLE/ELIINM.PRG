* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ELIINM.PRG            บ
* บ COMENTARIO    : SELECCIONA INMUEBLE   บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 11-17-93                 บ
* บ HORA       : 07:38:02pm               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
FUNCTION ELIINM
PARA MSG,R1,C1,EL_TIPO
=IIF(USED("INM"),.T.,OPINM())
SELE INM
IF INMPOP
	STORE NUL TO RESPUESTA
	SET ORDER TO TAG DOMICILIO
	ACTI POPUP INMPOP
	STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
	RESPUESTA=ELIMIX1('Inmueble '+MSG,'INM','CODINM',10)
ENDIF
RETURN iif(LAST()=27,.F.,RESPUESTA)
