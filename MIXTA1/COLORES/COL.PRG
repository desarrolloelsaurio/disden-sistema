*******************************************
*-- Programa: COL.prg
*-- Fecha   : 06-15-93 02:16am
*-- Version : GOYO
*-- Notas   : DERIVA A OPERACIONES COLORES
*******************************************
EXTERNAL PROCEDURE ELICOL
ulpr=PROGRAM()
=cabpan1()
=OPCOL()
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Colores - "              && ME1
MENSAJE[2]=" Ingreso Colores "                && TITULO DE LA VENTANA
MENSAJE[3]="COLOR "
MENSAJE[4]="CODIGO COLOR "
MENSAJE[5]=" Correcci¢n Color - "
MENSAJE[6]=" Correcci¢n Color "
MENSAJE[7]="COLOR"
MENSAJE[8]="COD COLOR"
MENSAJE[9]="Listado de Colores"
MENSAJE[10]=' Colores '
OTROS[1]="COLTEX"                                && INDICE AL COMENZAR
OTROS[2]=17
OTROS[6]='ORDCOL'
OTROS[7]='O'

TEXTO[1,1]='COLOR'                           && SAY DEL GET
TEXTO[1,2]=3                                     && COLOR SCHEME
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'                && PICTURE
TEXTO[1,4]='M.TEXTO1'                            && CAMPO A buscar en xseek
TEXTO[1,5]='COLTEX'                              && ORDER TAG DE BUSQUEDA
TEXTO[1,9]=20                                    && ANCHO PARA LOS LISTADOS

TEXTO[2,1]='CODIGO   '                           && SAY DEL GET
TEXTO[2,2]=3                                     && COLOR SCHEME
TEXTO[2,3]='!!'                                  && PICTURE
TEXTO[2,4]='LEFT(M.TEXTO2,2)'                    && CAMPO A buscar en xseek
TEXTO[2,5]='COLCOD'                              && ORDER TAG DE BUSQUEDA
TEXTO[2,9]=2                                     && ANCHO PARA LOS LISTADOS

ulpr=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIX.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
