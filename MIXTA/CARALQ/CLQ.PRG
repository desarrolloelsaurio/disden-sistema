* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : CLQ.PRG                                                  �
* � COMENTARIO    : GESTION DE CARGOS POR GESTION DE ALQUILERES              �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 09-05-93                                                    �
* � HORA       : 01:09:40pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
EXTERNAL PROCEDURE ELICLQ
EXTERNAL PROCEDURE LCLQP
EXTERNAL PROCEDURE LCLQI
ULPR=PROGRAM()
=CABPAN1()
SELE MIX
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Cargos por Alquileres - "
MENSAJE[2]=" Ingreso Cargos por Alquileres " 
MENSAJE[3]="CARGO POR ALQ."
MENSAJE[4]="CODIGO CARGO"
MENSAJE[5]=" Correcci�n Cargos por Alquileres  - "
MENSAJE[6]=" Correcci�n Cargos por Alquileres  "
MENSAJE[7]="CARGO POR ALQ."
MENSAJE[8]="CODIGO CARGO"
MENSAJE[9]="Listado de Cargos por Gesti�n de Alquileres"
MENSAJE[10]=' Cargos por Gesti�n de Alquileres '

OTROS[1]="CLQTEX" 
OTROS[2]=17
OTROS[6]='ORDCLQ'
OTROS[7]='6'

TEXTO[1,1]='CARGO POR ALQUILER'
TEXTO[1,2]=3
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'
TEXTO[1,4]='M.TEXTO1'
TEXTO[1,5]='CLQTEX'
TEXTO[1,9]=20

TEXTO[2,1]='CODIGO   '
TEXTO[2,2]=3
TEXTO[2,3]='!!'
TEXTO[2,4]='LEFT(M.TEXTO2,2)'
TEXTO[2,5]='CLQCOD'
TEXTO[2,9]=2

ULPR=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO CLQ.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
