* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : EST.PRG                                                  บ
* บ COMENTARIO    : GESTION DE ESTADOS                                    บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 01:09:40pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE ELIEST
ULPR=PROGRAM()
=CABPAN1()
=OPEST()
SELE MIX
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Estados - "
MENSAJE[2]=" Ingreso Estados "
MENSAJE[3]="ESTADO "
MENSAJE[4]="CODIGO ESTADO "
MENSAJE[5]=" Correcciขn Estado - "
MENSAJE[6]=" Correcciขn Estado "
MENSAJE[7]="ESTADO"
MENSAJE[8]="COD ESTADO"
MENSAJE[9]="Listado de Estados"
MENSAJE[10]=' Estados '

OTROS[1]="ESTTEX"
OTROS[2]=17
OTROS[6]='ORDEST'
OTROS[7]='E'

TEXTO[1,1]='ESTADO'
TEXTO[1,2]=3
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'
TEXTO[1,4]='M.TEXTO1'
TEXTO[1,5]='ESTTEX'
TEXTO[1,9]=20

TEXTO[2,1]='CODIGO   '
TEXTO[2,2]=3
TEXTO[2,3]='!!'
TEXTO[2,4]='LEFT(M.TEXTO2,2)'
TEXTO[2,5]='ESTCOD'
TEXTO[2,9]=2

ULPR=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIX.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
