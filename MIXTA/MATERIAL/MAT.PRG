* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : MAT.PRG                                 �
* � COMENTARIO    : GESTION DE MATERIALES (MADER->MOLDERIA) �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                                �
* � FECHA      : 09-05-93 - 01:09:40pm                      �
* � COPYRIGHT  : 1993 by GREGORIO REINER                    �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
* REDUCCION 08-31-95 01:02am
PROCEDURE MAT
EXTERNAL PROCEDURE ELIMAT
=OPMAT()
ULPR=PROGRAM()
RETURN MIX(PROP(MADER),PROP(MADERS),UPPE(MADER),UPPE(MADERS),"MATTEX","MATCOD","ORDMAT",'M')
