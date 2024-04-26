*******************************************************************************
*-- Programa: TAR.prg
*-- Fecha   : 06-15-93 02:16am
*-- Version : GOYO
*-- Notas   : DERIVA A OPERACIONES TARJETAS DE CREDITO
********************************************************************************
EXTERNAL PROCEDURE ELITAR
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
ulpr=PROGRAM()
=cabpan1()
=OPTAR()
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Tarjetas de Cr‚dito - "              && ME1
MENSAJE[2]=" Ingreso Tarjetas de Cr‚dito "                && TITULO DE LA VENTANA
MENSAJE[3]="TARJETA DE CREDITO "
MENSAJE[4]="CODIGO TARJETA "
MENSAJE[5]=" Correcci¢n Tarjeta de Cr‚dito - "
MENSAJE[6]=" Correcci¢n Tarjeta de Cr‚dito "
MENSAJE[7]="TARJETA DE CREDITO"
MENSAJE[8]="COD TARJETA"
MENSAJE[9]="Listado de Tarjetas de Cr‚dito"
MENSAJE[10]=' Tarjetas de Cr‚dito '
OTROS[1]="TARTEX"                                && INDICE AL COMENZAR
OTROS[2]=17
OTROS[6]='ORDTAR'
OTROS[7]='J'

TEXTO[1,1]='TARJETA DE CREDITO'                           && SAY DEL GET
TEXTO[1,2]=3                                     && COLOR SCHEME
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'                && PICTURE
TEXTO[1,4]='M.TEXTO1'                            && CAMPO A buscar en xseek
TEXTO[1,5]='TARTEX'                              && ORDER TAG DE BUSQUEDA
TEXTO[1,9]=20                                    && ANCHO PARA LOS LISTADOS

TEXTO[2,1]='CODIGO   '                           && SAY DEL GET
TEXTO[2,2]=3                                     && COLOR SCHEME
TEXTO[2,3]='!!'                                  && PICTURE
TEXTO[2,4]='LEFT(M.TEXTO2,2)'                    && CAMPO A buscar en xseek
TEXTO[2,5]='TARCOD'                              && ORDER TAG DE BUSQUEDA
TEXTO[2,9]=2                                     && ANCHO PARA LOS LISTADOS

ulpr=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIX.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
