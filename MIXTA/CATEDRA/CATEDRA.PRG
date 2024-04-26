* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO CATEDRA.PRG
* บ COMENTARIO    : GESTION DE CATEDRAS                                  บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 01:09:40pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
EXTERNAL PROCEDURE ELICTD
ULPR=PROGRAM()
=CABPAN1()
DO OPCTD
SELE MIX
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Cแtedras - "
MENSAJE[2]=" Ingreso Cแtedras "
MENSAJE[3]="CATEDRA "
MENSAJE[4]="CODIGO CATEDRA "
MENSAJE[5]=" Correcci๓n Cแtedra - "
MENSAJE[6]=" Correcci๓n Cแtedra "
MENSAJE[7]="CATEDRA"
MENSAJE[8]="COD CATEDRA"
MENSAJE[9]="Listado de Cแtedras"
MENSAJE[10]=' Cแtedras '

OTROS[1]="CTDTEX"
OTROS[2]=17
OTROS[6]='ORDCTD'
OTROS[7]='แ'

TEXTO[1,1]='CATEDRA'
TEXTO[1,2]=3
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'
TEXTO[1,4]='M.TEXTO1'
TEXTO[1,5]='CTDTEX'
TEXTO[1,9]=20

TEXTO[2,1]='CODIGO   '
TEXTO[2,2]=3
TEXTO[2,3]='!!'
TEXTO[2,4]='LEFT(M.TEXTO2,2)'
TEXTO[2,5]='CTDCOD'
TEXTO[2,9]=2

ULPR=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIX.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
