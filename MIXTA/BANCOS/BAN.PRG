* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : BAN.PRG                                                  �
* � COMENTARIO    : GESTION DE BANCOS                                        �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 09-05-93                                                    �
* � HORA       : 01:09:40pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
PARAMETER B_PAR
EXTERNAL PROCEDURE ELIBAN
EXTERNAL PROCEDURE LBANI
EXTERNAL PROCEDURE LBANP
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PICU  '!!!!!!!!!!!!!!!!!!!!'
ULPR=PROGRAM()
=CABPAN1()
DO OPBAN
SELE MIX
DIME MENSAJE[10],OTROS[7],TEXTO[3,9]
MENSAJE[1]=" Ingreso Bancos - "
MENSAJE[2]=" Ingreso Bancos " 
MENSAJE[3]="BANCO "
MENSAJE[4]="N� CUENTA "
MENSAJE[5]=" Correcci�n Banco - "
MENSAJE[6]=" Correcci�n Banco "
MENSAJE[7]="BANCO"
MENSAJE[8]="COD BANCO"
MENSAJE[9]="Listado de Bancos"
MENSAJE[10]=' Bancos '

OTROS[1]="BANTEX" 
OTROS[2]=17
OTROS[6]='ORDBAN'
OTROS[7]='B'

TEXTO[1,1]='N� CUENTA'
TEXTO[1,2]=3
TEXTO[1,3]=PICU
TEXTO[1,4]='M.TEXTO1+M.TEXTO2'
TEXTO[1,5]='BANTEX'
TEXTO[1,9]=20

TEXTO[2,1]='BANCO'
TEXTO[2,2]=3
TEXTO[2,3]=PICU
TEXTO[2,4]='LEFT(M.TEXTO2,2)'
TEXTO[2,5]='BANCOD'
TEXTO[2,9]=2

TEXTO[3,1]='CODIGO   '
TEXTO[3,2]=3
TEXTO[3,3]='99999'
TEXTO[3,4]='STR(M.NU1,2)'
TEXTO[3,5]='BANCOD'
TEXTO[3,9]=5


ULPR=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO CASE
CASE EMPTY(B_PAR)
   DO MIX2NTXT.SPR
CASE B_PAR="D"
      DO DEPOSITO.SPR WITH .T.
CASE B_PAR="E"
         DO EMICHEQ.SPR WITH .T.
CASE B_PAR="N"
         DO ACNUCHE.SPR 
ENDCASE
UNLO ALL
RETURN MEN_LIN(BOTOM)
