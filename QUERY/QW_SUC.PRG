* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_SUC.PRG       �
* �       Author: G. REINER        �
* � Date created: 04-08-94 04:11pm �
* �    Copyright: GOYO REINER      �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION QW_CLI
PARAMETER REN,COL,CUAL
PRIVATE REN,COL,CUAL
IF FILCLI=2
   STORE NUL TO RESPUESTA
   do cligrl with ren-7,col,IIF(SSTM2="EXPENSAS","Consorcista","Cliente")+" a Listar",.T.
   on sele popu cligrl DO RESP1
   ACTI POPU cligrl
   RELE POPU cligrl
   store '' to fisc,tt
   ch=bar()
   FISC=qwcli(bar(),CUAL)
   if fisc#".F."
      quecli=fisc
      ttcli=tt
   else
      store 1 to filcli
   endif
else
   if filcli=1
      IF SSTM2="EXPENSAS"
         quecli='LEFT(CCL.CODCLI,1)="C"'
      ENDIF
   endif
endif
return FILCLI=1 .or. (fiLcli=2 .and. ch#8)
