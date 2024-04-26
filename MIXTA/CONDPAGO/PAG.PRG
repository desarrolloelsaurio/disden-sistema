* ษอออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : PAG.PRG                       บ
* บ COMENTARIO    : GESTION DE CONDICION DE PAGOS บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                      บ
* บ FECHA      : 09-05-93                         บ
* บ HORA       : 01:09:40pm                       บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER          บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE ELIPAG
EXTERNAL PROCEDURE LPAGP
EXTERNAL PROCEDURE LPAGI
EXTERNAL PROCEDURE LPAGX1
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
ULPR=PROGRAM()
=CABPAN1()
=OPPAG()
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Condiciones de Pago - "
MENSAJE[2]=" Ingreso Condiciones de Pago "
MENSAJE[3]="CONDICION DE PAGO "
MENSAJE[4]="CODIGO CONDICION DE PAGO "
MENSAJE[5]=" Correcciขn Condiciขn de Pago - "
MENSAJE[6]=" Correcciขn Condiciขn de Pago "
MENSAJE[7]="CONDICION DE PAGO"
MENSAJE[8]="COD CONDICION DE PAGO"
MENSAJE[9]="Listado de Condiciones de Pago"
MENSAJE[10]=' Condiciones de Pago '

OTROS[1]="PAGTEX"
OTROS[2]=17
OTROS[6]='ORDPAG'
OTROS[7]='G'

TEXTO[1,1]='CONDICION DE PAGO'
TEXTO[1,2]=3
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'
TEXTO[1,4]='M.TEXTO1'
TEXTO[1,5]='PAGTEX'
TEXTO[1,9]=20

TEXTO[2,1]='CODIGO   '
TEXTO[2,2]=3
TEXTO[2,3]='!!'
TEXTO[2,4]='LEFT(M.TEXTO2,2)'
TEXTO[2,5]='PAGCOD'
TEXTO[2,9]=2

EXTERNAL ARRAY MENSAJE,OTROS,TEXTO

SELE MIX
#IF "PRODUC" $ CURD()
DO IPAG.SPR
#ELSE
DO PAG.SPR
#ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)
