* ษอออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : REM.PRG                 บ
* บ COMENTARIO    : GESTION DE Medicamentos บ
* ฬอออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                บ
* บ FECHA      : 09-05-93                   บ
* บ HORA       : 02:41:49am                 บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER    บ
* ศอออออออออออออออออออออออออออออออออออออออออผ
#DEFINE MAYSIN "MEDICAMENTO"
#DEFINE MAYPLU "MEDICAMENTOS"
#DEFINE MINSIN "Medicamento"
#DEFINE MINPLU "Medicamentos"
EXTERNAL PROCEDURE ELIREM
ulpr=PROGRAM()
=cabpan1()
SELE mix
DIME MENSAJE[10],OTROS[7],TEXTO[3,9]
MENSAJE[1]=" Ingreso "+MINPLU+" - "
MENSAJE[2]=" Ingreso "+MINPLU+" "
MENSAJE[3]=MAYSIN
MENSAJE[4]="CODIGO "+MAYSIN+" "
MENSAJE[5]="MONTO"
MENSAJE[6]=" Correcciขn "+MINPLU+" "
MENSAJE[7]=MAYSIN
MENSAJE[8]="COD "+MAYSIN
MENSAJE[9]="Listado de "+MINPLU
MENSAJE[10]=' '+MINPLU+' '
OTROS[1]="REMTEX"
OTROS[2]=17
OTROS[6]='ORDREM'
OTROS[7]='M'

TEXTO[1,1]=MAYSIN
TEXTO[1,2]=3
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!' 
TEXTO[1,4]='M.TEXTO1'
TEXTO[1,5]='REMTEX'
TEXTO[1,9]=20

TEXTO[2,1]='CODIGO   '
TEXTO[2,2]=3
TEXTO[2,3]='!!'
TEXTO[2,4]='LEFT(M.TEXTO2,2)'
TEXTO[2,5]='REMCOD'
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
