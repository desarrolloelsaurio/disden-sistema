* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : IMP.PRG                                                  บ
* บ COMENTARIO    : GESTION DE IMPUESTOS                                    บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 01:09:40pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE ELIIMP
ULPR=PROGRAM()
=CABPAN1()
=OPIMP()
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Impuestos - "
MENSAJE[2]=" Ingreso Impuestos "
MENSAJE[3]="IMPUESTO "
MENSAJE[4]="CODIGO IMPUESTO "
MENSAJE[5]=" Correcciขn Impuesto - "
MENSAJE[6]=" Correcciขn Impuesto "
MENSAJE[7]="IMPUESTO"
MENSAJE[8]="COD IMPUESTO"
MENSAJE[9]="Listado de Impuestos"
MENSAJE[10]=' Impuestos '

OTROS[1]="IMPTEX"
OTROS[2]=17
OTROS[6]='ORDIMP'
OTROS[7]='M'

TEXTO[1,1]='IMPUESTO'
TEXTO[1,2]=3
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'
TEXTO[1,4]='M.TEXTO1'
TEXTO[1,5]='IMPTEX'
TEXTO[1,9]=20

TEXTO[2,1]='CODIGO   '
TEXTO[2,2]=3
TEXTO[2,3]='!!'
TEXTO[2,4]='LEFT(M.TEXTO2,2)'
TEXTO[2,5]='IMPCOD'
TEXTO[2,9]=2

ULPR=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIX.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
