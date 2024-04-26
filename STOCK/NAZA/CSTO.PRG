********************************************************************************
*-- Programa: CPRE.PRG
*-- Fecha   : 08/26/91 11:28am
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE ingreso de Stock
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
A=(xatalmax-xatalmin)/xatalstep+1
IF A>12
A=22
ELSE
A=A+13
ENDIF
DEFI WIND win FROM 10,6 TO A,73 TITL " "+ALLTRIM(mer->merca)+'/'+ALLTRIM(mer->articulo)+' ' NONE
SELE pre
ff=LEFT(mer->articulo,13)
fi=ff+'     '
ff=ff+'þþþþþ'
STORE xas1 TO stoc
STORE xas2 TO stocmin
STORE xas3 TO stocmax
STORE xas4 TO stocres

BROW FIELD talle=(VAL(RIGHT(articulo,3))/10) :R:p="##.##";
,stock :p="99999999.99":H="STOCK DISPONIBLE";
,STOCKMIN  :p="99999999.99":H="STOCK MINIMO";
,STOCKMAX  :p="99999999.99":H="STOCK MAXIMO";
,STOCKRES  :p="99999999.99":H="STOCK RESERVADO";
KEY fi,ff NOAPPEND  NODELETE  NOMENU  WIND win
ELSE
=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
