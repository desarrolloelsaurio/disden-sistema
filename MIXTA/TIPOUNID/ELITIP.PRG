* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ELITIP.PRG                                               บ
* บ COMENTARIO    : SELECCIONA TIPO DE UNIDAD                                บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 11-18-93                                                    บ
* บ HORA       : 09:02:41pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION ELITIP
PARA MSG,R1,C1
SELE MIX
IF TIPPOP
   SET ORDER TO TAG TIPTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
	 RESPUESTA=ELIMIX1('Tipo de Unidad '+MSG,'MIX','TIPCOD')
ENDIF
RETURN RESPUESTA
