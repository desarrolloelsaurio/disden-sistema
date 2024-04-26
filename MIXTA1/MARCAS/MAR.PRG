*******************************************************************************
*-- Programa: MAR.prg
*-- Fecha   : 06-15-93 02:16am
*-- Version : GOYO
*-- Notas   : DERIVA A OPERACIONES MARCAS
********************************************************************************
EXTERNAL PROCEDURE ELIMAR
ulpr=PROGRAM()
=cabpan1()
=OPMAR()
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Marcas - "              && ME1
MENSAJE[2]=" Ingreso Marcas "                && TITULO DE LA VENTANA
MENSAJE[3]="MARCA "
MENSAJE[4]="CODIGO MARCA "
MENSAJE[5]=" Correcci¢n Marca - "
MENSAJE[6]=" Correcci¢n Marca "
MENSAJE[7]="MARCA"
MENSAJE[8]="COD MARCA"
MENSAJE[9]="Listado de Marcas"
MENSAJE[10]=' Marcas '
OTROS[1]="MARTEX"                                && INDICE AL COMENZAR
OTROS[2]=17
OTROS[6]='ORDMAR'
OTROS[7]='M'

TEXTO[1,1]='MARCA'                               && SAY DEL GET
TEXTO[1,2]=3                                     && COLOR SCHEME
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'                && PICTURE
TEXTO[1,4]='M.TEXTO1'                            && CAMPO A buscar en xseek
TEXTO[1,5]='MARTEX'                              && ORDER TAG DE BUSQUEDA
TEXTO[1,9]=20                                    && ANCHO PARA LOS LISTADOS

TEXTO[2,1]='CODIGO   '                           && SAY DEL GET
TEXTO[2,2]=3                                     && COLOR SCHEME
TEXTO[2,3]='!!'                                  && PICTURE
TEXTO[2,4]='LEFT(M.TEXTO2,2)'                    && CAMPO A buscar en xseek
TEXTO[2,5]='MARCOD'                              && ORDER TAG DE BUSQUEDA
TEXTO[2,9]=2                                     && ANCHO PARA LOS LISTADOS


ulpr=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MI1.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
