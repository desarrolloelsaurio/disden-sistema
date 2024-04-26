*******************************************************************************
*-- Programa: CAR.PRG
*-- Fecha   : 06-15-93 02:16am
*-- Version : GOYO
*-- Notas   : DERIVA A OPERACIONES CARCATERISTICAS
********************************************************************************
#DEFINE MAYSIN "CARACTERISTICA"
#DEFINE MAYPLU "CARACTERISTICAS"
#DEFINE MINSIN "Caracter¡stica"
#DEFINE MINPLU "Caracter¡sticas"
EXTERNAL PROCEDURE ELICAR
ulpr=PROGRAM()
=cabpan1()
=OPCAR()
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso "+minsin+" - "              && ME1
MENSAJE[2]=" Ingreso "+minsin+" "                && TITULO DE LA VENTANA
MENSAJE[3]=MAYSIN+" "
MENSAJE[4]="CODIGO "+MAYSIN+" "
MENSAJE[5]=" Correcci¢n "+minsin+" - "
MENSAJE[6]=" Correcci¢n "+minsin+" "
MENSAJE[7]=""+MAYSIN+""
MENSAJE[8]="COD "+MAYSIN
MENSAJE[9]="Listado de "+minplu
MENSAJE[10]=' '+minplu+' '
OTROS[1]="CARTEX"                                && INDICE AL COMENZAR
OTROS[2]=17
OTROS[6]='ORDCAR'
OTROS[7]='K'

TEXTO[1,1]=MAYSIN                        		 && SAY DEL GET
TEXTO[1,2]=3                                     && COLOR SCHEME
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'                && PICTURE
TEXTO[1,4]='M.TEXTO1'                            && CAMPO A buscar en xseek
TEXTO[1,5]='CARTEX'                              && ORDER TAG DE BUSQUEDA
TEXTO[1,9]=20                                    && ANCHO PARA LOS LISTADOS

TEXTO[2,1]='CODIGO   '                           && SAY DEL GET
TEXTO[2,2]=3                                     && COLOR SCHEME
TEXTO[2,3]='!!'                                  && PICTURE
TEXTO[2,4]='LEFT(M.TEXTO2,2)'                    && CAMPO A buscar en xseek
TEXTO[2,5]='CARCOD'                              && ORDER TAG DE BUSQUEDA
TEXTO[2,9]=2                                     && ANCHO PARA LOS LISTADOS

ULPR=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MI1.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
