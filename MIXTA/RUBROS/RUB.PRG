*******************************************
*-- Programa: RUB.prg
*-- Fecha   : 06-15-93 02:16am
*-- Version : GOYO
*-- Notas   : DERIVA A OPERACIONES RUBROS
******************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

EXTERNAL PROCEDURE ELIRUB
ulpr=PROGRAM()
=cabpan1()
=OPRUB()
SELE mix
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Rubros - "              && ME1
MENSAJE[2]=" Ingreso Rubros "                && TITULO DE LA VENTANA
MENSAJE[3]="RUBRO "
MENSAJE[4]="CODIGO RUBRO "
MENSAJE[5]=" Correcci¢n Rubro - "
MENSAJE[6]=" Correcci¢n Rubro "
MENSAJE[7]="RUBRO"
MENSAJE[8]="COD RUBRO"
MENSAJE[9]="Listado de Rubros"
MENSAJE[10]=' Rubros '
OTROS[1]="RUBTEX"                                && INDICE AL COMENZAR
OTROS[2]=17
OTROS[6]='ORDRUB'
OTROS[7]='R'

TEXTO[1,1]='RUBRO'                           && SAY DEL GET
TEXTO[1,2]=3                                     && COLOR SCHEME
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'
TEXTO[1,4]='M.TEXTO1'                            && CAMPO A buscar en xseek
TEXTO[1,5]='RUBTEX'                              && ORDER TAG DE BUSQUEDA
TEXTO[1,9]=20

TEXTO[2,1]='CODIGO'
TEXTO[2,2]=3
IF SSTM1="DIS-DEN"
   TEXTO[2,3]='!!!'
   TEXTO[2,4]='PADR(ALLTRIM(M.TEXTO2),3)'
   TEXTO[2,6]='PADR(ALLTRIM(M.TEXTO2),3)'
ELSE
   TEXTO[2,3]='999'
   TEXTO[2,4]='ZERO(VAL(LEFT(M.TEXTO2,3)),3)'
   TEXTO[2,6]='ZERO(VAL(LEFT(M.TEXTO2,3)),3)'
ENDIF
TEXTO[2,5]='RUBCOD'
TEXTO[2,9]=3

ULPR=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIX.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
