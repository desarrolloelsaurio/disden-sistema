* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ELITIP.PRG           บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 10-29-93                บ
* บ HORA       : 03:55:34pm              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
* VERSION CAMARA GAMMA
* TIPO DE CONCEPTO
*
FUNCTION ELITIP
PARA MSG,R1,C1
SELE MIX
IF TIPPOP
   SET ORDER TO TAG TIPTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1('Tipo de Concepto '+MSG,'MIX','TIPCOD',3)
ENDIF
RETURN RESPUESTA
