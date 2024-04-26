* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : MAT.PRG                                 บ
* บ COMENTARIO    : GESTION DE MATERIALES (MADER->MOLDERIA) บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                บ
* บ FECHA      : 09-05-93 - 01:09:40pm                      บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                    บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* REDUCCION 08-31-95 01:02am
PROCEDURE MAT
EXTERNAL PROCEDURE ELIMAT
=OPMAT()
ULPR=PROGRAM()
RETURN MIX(PROP(MADER),PROP(MADERS),UPPE(MADER),UPPE(MADERS),"MATTEX","MATCOD","ORDMAT",'M')
