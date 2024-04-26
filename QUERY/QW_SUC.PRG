* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: QW_SUC.PRG       ³
* ³       Author: G. REINER        ³
* ³ Date created: 04-08-94 04:11pm ³
* ³    Copyright: GOYO REINER      ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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
