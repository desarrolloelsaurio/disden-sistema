*******************************************************************************
*-- Programa: GAS.prg
*-- Fecha   : 06-15-93 02:16am
*-- Version : GOYO
*-- Notas   : DERIVA A OPERACIONES Conceptos de Imputaci¢n
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
EXTERNAL PROCEDURE ELIGAS
IF SSTM1="BARCOS" 
PLUMIN="Cuentas Contables"
PLUMAY="CTA CONTABLE"
SINGMIN="Cuenta Contabie"
SINGMAY="CTA CONTABLE"
ELSE
PLUMIN="Conceptos de Imputaci¢n"
PLUMAY="CONC. IMPUTACION"
SINGMIN="Concepto de Imputaci¢n"
SINGMAY="CONCEPTO DE IMPUTACION"
ENDIF
ulpr=PROGRAM()
=cabpan1()
=OPGAS()
SELE mix
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso "+PLUMIN+" - "              && ME1
MENSAJE[2]=" Ingreso "+PLUMIN+" "                && TITULO DE LA VENTANA
MENSAJE[3]=SINGMAY+" "
MENSAJE[4]="CODIGO "+SINGMAY+" "
MENSAJE[5]=" Correcci¢n "+SINGMIN+" - "
MENSAJE[6]=" Correcci¢n "+SINGMIN+" "
MENSAJE[7]=""+SINGMAY+""
MENSAJE[8]="COD "+SINGMAY
MENSAJE[9]="Listado de "+PLUMIN
MENSAJE[10]=' '+PLUMIN+' '
OTROS[1]="GASTEX"                                && INDICE AL COMENZAR
OTROS[2]=17
OTROS[6]='ORDGAS'
OTROS[7]='T'

TEXTO[1,1]=SINGMAY                           && SAY DEL GET
TEXTO[1,2]=3                                     && COLOR SCHEME
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'                && PICTURE
TEXTO[1,4]='M.TEXTO1'                            && CAMPO A buscar en xseek
TEXTO[1,5]='GASTEX'                              && ORDER TAG DE BUSQUEDA
TEXTO[1,9]=20                                    && ANCHO PARA LOS LISTADOS

TEXTO[2,1]='CODIGO   '                           && SAY DEL GET
TEXTO[2,2]=3                                     && COLOR SCHEME
TEXTO[2,3]='99.99.99.99'                                  && PICTURE
TEXTO[2,4]='LEFT(M.TEXTO2,11)'                    && CAMPO A buscar en xseek
TEXTO[2,5]='GASCOD'                              && ORDER TAG DE BUSQUEDA
*TEXTO[2,6]='TRANSF(LEFT(ALLTRIM(M.TEXTO2)+"000000000000",12),"99.99.99.99")'
TEXTO[2,6]='AJCCOD(M.TEXTO2)'
TEXTO[2,9]=11                                     && ANCHO PARA LOS LISTADOS

ulpr=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIX.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
