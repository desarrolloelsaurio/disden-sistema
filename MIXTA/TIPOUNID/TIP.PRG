* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : TIP.PRG                                                  �
* � COMENTARIO    : GESTION DE TIPOS DE UNIDAD                               �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 09-05-93                                                    �
* � HORA       : 01:09:40pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
EXTERNAL PROCEDURE ELITIP
ULPR=PROGRAM()
=CABPAN1()
=OPTIP()
SELE MIX
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Tipos de Unidad - "
MENSAJE[2]=" Ingreso Tipos de Unidad "
MENSAJE[3]="TIPO DE UNIDAD "
MENSAJE[4]="CODIGO TIPO DE UNIDAD "
MENSAJE[5]=" Correcci�n Tipo de Unidad - "
MENSAJE[6]=" Correcci�n Tipo de Unidad "
MENSAJE[7]="TIPO DE UNIDAD"
MENSAJE[8]="COD TIPO DE UNIDAD"
MENSAJE[9]="Listado de Tipos de Unidad"
MENSAJE[10]=' Tipos de Unidad '

OTROS[1]="TIPTEX"
OTROS[2]=17
OTROS[6]='ORDTIP'
OTROS[7]='I'

TEXTO[1,1]='TIPO DE UNIDAD'
TEXTO[1,2]=3
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'
TEXTO[1,4]='M.TEXTO1'
TEXTO[1,5]='TIPTEX'
TEXTO[1,9]=20

TEXTO[2,1]='CODIGO   '
TEXTO[2,2]=3
TEXTO[2,3]='!!'
TEXTO[2,4]='LEFT(M.TEXTO2,2)'
TEXTO[2,5]='TIPCOD'
TEXTO[2,9]=2

ULPR=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIX.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
