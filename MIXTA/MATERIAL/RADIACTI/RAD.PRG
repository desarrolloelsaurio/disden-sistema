* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : RAD.PRG                                                  บ
* บ COMENTARIO    : GESTION DE MATERIAL RADIACTIVO                           บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 02:45:00am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE ELIRAD
ulpr=PROGRAM()
=cabpan1()
SELE mix
DIME MENSAJE[10],OTROS[7],TEXTO[3,9]
MENSAJE[1]=" Ingreso Material Radiactivo - "              && ME1
MENSAJE[2]=" Ingreso Material Radiactivo "                && TITULO DE LA VENTANA
MENSAJE[3]="MATERIAL "
MENSAJE[4]="CODIGO MATERIAL "
MENSAJE[5]="MONTO"
MENSAJE[6]=" Correcciขn Material Radiactivo "
MENSAJE[7]="MATERIAL"
MENSAJE[8]="COD MATERIAL"
MENSAJE[9]="Listado de Material Radiactivo"
MENSAJE[10]=' Material Radiactivo '
OTROS[1]="RADTEX"                                && INDICE AL COMENZAR
OTROS[2]=17
OTROS[6]='ORDRAD'
OTROS[7]='R'

TEXTO[1,1]='MATERIAL'                           && SAY DEL GET
TEXTO[1,2]=3                                     && COLOR SCHEME
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'                && PICTURE
TEXTO[1,4]='M.TEXTO1'                            && CAMPO A buscar en xseek
TEXTO[1,5]='RADTEX'                              && ORDER TAG DE BUSQUEDA
TEXTO[1,9]=20                                    && ANCHO PARA LOS LISTADOS

TEXTO[2,1]='CODIGO   '                           && SAY DEL GET
TEXTO[2,2]=3                                     && COLOR SCHEME
TEXTO[2,3]='!!'                                  && PICTURE
TEXTO[2,4]='LEFT(M.TEXTO2,2)'                    && CAMPO A buscar en xseek
TEXTO[2,5]='RADCOD'                              && ORDER TAG DE BUSQUEDA
TEXTO[2,9]=2                                     && ANCHO PARA LOS LISTADOS


TEXTO[3,1]="MONTO    "
TEXTO[3,2]=3
TEXTO[3,3]="99,999,999.99"
TEXTO[3,9]=XACDIGI

ulpr=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIXN.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
