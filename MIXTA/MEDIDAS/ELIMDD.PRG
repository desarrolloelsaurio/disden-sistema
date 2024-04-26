* ษอออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ELIMDD.PRG                  บ
* บ COMENTARIO    : SELECCIONA UNIDAD DE MEDIDA บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                    บ
* บ FECHA      : 10-26-93                       บ
* บ HORA       : 12:46:43pm                     บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER        บ
* ศอออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION ELIMDD
PARA MSG,R1,C1
STOR 0 TO M.RESPUESTA
SELE MIX
IF MDDPOP
   SET ORDER TO TAG MDDTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1('Unidad de Medida '+MSG,'MIX','MDDCOD')
ENDIF
RETURN RESPUESTA 
