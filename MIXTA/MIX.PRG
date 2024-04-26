* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : MIX.PRG              บ
* บ COMENTARIO    : GESTION DE DISPARO DEบ
* บ                 MIXTA COMUN          บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 30/08/95 15:13          บ
* บ COPYRIGHT  : 1995 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
PROCEDURE MIX
PARAMETER MINSIN,MINPLU,MAYSIN,MAYPKU,ORDENTEX,ORDENCOD,ORDENLIS,ELFILTRO,LARGOCOD,TWOSIX
#DEFINE BOTOM    "  "+repl("ฐ",78)                 && BOTOM
EXTERNAL PROCEDURE LMIXP1
EXTERNAL PROCEDURE LMIXI1
=CABPAN1()
SELE MIX
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
M.LARGOCOD=IIF(EMPTY(M.LARGOCOD),2,M.LARGOCOD)
MENSAJE[1]=" Ingreso "+Minplu+" - "
MENSAJE[2]=" Ingreso "+Minplu+" "
MENSAJE[3]=maysin+" "
MENSAJE[4]="CODIGO "+maysin+" "
#IF "Wind" $ VERS()
MENSAJE[5]=" Correcci๓n "+Minsin+" - "
MENSAJE[6]=" Correcci๓n "+Minsin+" "
#ELSE
MENSAJE[5]=" Correcciขn "+Minsin+" - "
MENSAJE[6]=" Correcciขn "+Minsin+" "
#ENDIF
MENSAJE[7]=maysin
MENSAJE[8]="COD "+maysin+""
MENSAJE[9]="Listado de "+Minplu+""
MENSAJE[10]=" "+Minplu+" "

OTROS[1]=ORDENTEX
OTROS[2]=17
OTROS[6]=ORDENLIS
OTROS[7]=ELFILTRO

TEXTO[1,1]=maysin
TEXTO[1,2]=3
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'
TEXTO[1,4]='M.TEXTO1'
TEXTO[1,5]=ORDENTEX
TEXTO[1,9]=20

TEXTO[2,1]='CODIGO   '
TEXTO[2,2]=3
TEXTO[2,3]=REPL('!',M.LARGOCOD)
TEXTO[2,4]='LEFT(M.TEXTO2,'+ALLTRIM(STR(M.LARGOCOD))+')'
TEXTO[2,5]=ORDENCOD
TEXTO[2,6]=M.TWOSIX
TEXTO[2,9]=M.LARGOCOD

EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIX.SPR
UNLO ALL
RETURN MEN_LIN(BOTOM)
