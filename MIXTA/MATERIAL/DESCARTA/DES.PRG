* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : DES.PRG                                                  บ
* บ COMENTARIO    : GESTION DE MATERIAL DESCARTABLE                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 02:41:49am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE ELIDES
ulpr=PROGRAM()
=cabpan1()
SELE mix
DIME MENSAJE[10],OTROS[7],TEXTO[3,9]
MENSAJE[1]=" Ingreso Material Descartable - "
MENSAJE[2]=" Ingreso Material Descartable "
MENSAJE[3]="MATERIAL "
MENSAJE[4]="CODIGO MATERIAL "
MENSAJE[5]="MONTO"
MENSAJE[6]=" Correcciขn Material Descartable "
MENSAJE[7]="MATERIAL"
MENSAJE[8]="COD MATERIAL"
MENSAJE[9]="Listado de Material Descartable"
MENSAJE[10]=' Material Descartable '
OTROS[1]="DESTEX"
OTROS[2]=17
OTROS[6]='ORDDES'
OTROS[7]='S'

TEXTO[1,1]='MATERIAL'
TEXTO[1,2]=3
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'
TEXTO[1,4]='M.TEXTO1'
TEXTO[1,5]='DESTEX'
TEXTO[1,9]=20

TEXTO[2,1]='CODIGO   '
TEXTO[2,2]=3
TEXTO[2,3]='!!'
TEXTO[2,4]='LEFT(M.TEXTO2,2)'
TEXTO[2,5]='DESCOD'
TEXTO[2,9]=2


TEXTO[3,1]="MONTO    "
TEXTO[3,2]=3
TEXTO[3,3]="99,999,999.99"
TEXTO[3,9]=XACDIGI

ulpr=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIXN.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
