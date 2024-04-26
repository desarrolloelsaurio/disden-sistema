*******************************************************************************
*-- Programa: ALI.PRG
*-- Fecha   : 06-15-93 02:16am
*-- Version : GOYO
*-- Notas   : DERIVA A OPERACIONES ALIMENTACIONS
********************************************************************************
EXTERNAL PROCEDURE ELIALI
ulpr=PROGRAM()
=cabpan1()
=OPALI()
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Tipo Alimentaci¢n - "              && ME1
MENSAJE[2]=" Ingreso Tipo Alimentaci¢n "                && TITULO DE LA VENTANA
MENSAJE[3]="ALIMENTACION "
MENSAJE[4]="CODIGO ALIMENTACION "
MENSAJE[5]=" Correcci¢n Tipos de Alimentacion - "
MENSAJE[6]=" Correcci¢n Tipos de Alimentacion "
MENSAJE[7]="ALIMENTACION"
MENSAJE[8]="COD ALIMENTACION"
MENSAJE[9]="Listado de Tipos de Alimentaci¢n"
MENSAJE[10]=' Tipos de Alimentaci¢n '
OTROS[1]="ALITEX"                                && INDICE AL COMENZAR
OTROS[2]=17
OTROS[6]='ORDALI'
OTROS[7]='A'

TEXTO[1,1]='ALIMENTACION'                        && SAY DEL GET
TEXTO[1,2]=3                                     && COLOR SCHEME
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'                && PICTURE
TEXTO[1,4]='M.TEXTO1'                            && CAMPO A buscar en xseek
TEXTO[1,5]='ALITEX'                              && ORDER TAG DE BUSQUEDA
TEXTO[1,9]=20                                    && ANCHO PARA LOS LISTADOS

TEXTO[2,1]='CODIGO   '                           && SAY DEL GET
TEXTO[2,2]=3                                     && COLOR SCHEME
TEXTO[2,3]='!!'                                  && PICTURE
TEXTO[2,4]='LEFT(M.TEXTO2,2)'                    && CAMPO A buscar en xseek
TEXTO[2,5]='ALICOD'                              && ORDER TAG DE BUSQUEDA
TEXTO[2,9]=2                                     && ANCHO PARA LOS LISTADOS

ulpr=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MI1.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
