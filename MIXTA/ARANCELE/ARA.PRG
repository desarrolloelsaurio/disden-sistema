* 浜様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : ARA.PRG                            �
* � COMENTARIO    : GESTION DE GENERACION DE ARANCELES �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                           �
* � FECHA      : 09-05-93                              �
* � HORA       : 02:45:00am                            �
* � COPYRIGHT  : 1993 by GREGORIO REINER               �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様夕
EXTERNAL PROCEDURE ELIARA
ulpr=PROGRAM()
=cabpan1()
SELE mix
DIME MENSAJE[10],OTROS[7],TEXTO[3,9]
MENSAJE[1]=" Ingreso Aranceles - "              && ME1
MENSAJE[2]=" Ingreso Aranceles "                && TITULO DE LA VENTANA
MENSAJE[3]="CODIGO TIPO ARANCEL"
MENSAJE[4]="CODIGO TIPO UNIDAD"
MENSAJE[5]="ARANCEL"
MENSAJE[6]=" Correcci�n Aranceles "
MENSAJE[7]="TIPO ARANCEL"
MENSAJE[8]="TIPO UNIDAD"

MENSAJE[9]="Listado de Aranceles"
MENSAJE[10]=' Arancel '

OTROS[1]="ARACOD"                                && INDICE AL COMENZAR
OTROS[2]=17
OTROS[6]='ORDARA'
OTROS[7]='A'
L_DERIVA=.T.

TEXTO[1,1]='COD. TIPO ARANCEL'                   && SAY DEL GET
TEXTO[1,2]=3                                     && COLOR SCHEME
TEXTO[1,3]='!!'
TEXTO[1,4]="SAYMIX(LEFT(M.TEXTO1,2),'TARCOD')"
TEXTO[1,5]='TARCOD'                              && ORDER TAG DE BUSQUEDA
TEXTO[1,7]="ELITAR"
TEXTO[1,9]=20                                    && ANCHO PARA LOS LISTADOS

TEXTO[2,1]='COD. TIPO UNIDAD'                     && SAY DEL GET
TEXTO[2,2]=3                                     && COLOR SCHEME
TEXTO[2,3]='!!'                                  && PICTURE
TEXTO[2,4]="SAYMIX(M.TEXTO2,'UNICOD')"
TEXTO[2,5]='UNICOD'                              && ORDER TAG DE BUSQUEDA
TEXTO[2,7]="ELIUNI"
TEXTO[2,9]=20                                    && ANCHO PARA LOS LISTADOS


TEXTO[3,1]="ARANCEL"
TEXTO[3,2]=3
TEXTO[3,3]="99,999,999.99"
TEXTO[3,9]=XACDIGI

ulpr=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO ARA.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
