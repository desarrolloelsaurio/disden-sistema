* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : OPK.PRG                                                  �
* � COMENTARIO    : GESTION DE OPERACIONES DE KARDEX                         �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 09-05-93                                                    �
* � HORA       : 01:09:40pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
EXTERNAL PROCEDURE ELIOPK
ULPR=PROGRAM()
=CABPAN1()
SELE MIX
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Operaciones de Kardex - "
MENSAJE[2]=" Ingreso Operaciones de Kardex "
MENSAJE[3]="OPERACION DE KARDEX "
MENSAJE[4]="CODIGO OPERACION DE KARDEX "
MENSAJE[5]=" Correcci�n Operaci�n de Kardex - "
MENSAJE[6]=" Correcci�n Operaci�n de Kardex "
MENSAJE[7]="OPERACION DE KARDEX"
MENSAJE[8]="COD OPERACION DE KARDEX"
MENSAJE[9]="Listado de Operaciones de Kardex"
MENSAJE[10]=' Operaciones de Kardex '

OTROS[1]="OPKTEX"
OTROS[2]=17
OTROS[6]='ORDOPK'
OTROS[7]='X'

TEXTO[1,1]='OPERACION DE KARDEX'
TEXTO[1,2]=3
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'
TEXTO[1,4]='M.TEXTO1'
TEXTO[1,5]='OPKTEX'
TEXTO[1,9]=20

TEXTO[2,1]='CODIGO   '
TEXTO[2,2]=3
TEXTO[2,3]='!!'
TEXTO[2,4]='LEFT(M.TEXTO2,2)'
TEXTO[2,5]='OPKCOD'
TEXTO[2,9]=2

ULPR=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIX.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
