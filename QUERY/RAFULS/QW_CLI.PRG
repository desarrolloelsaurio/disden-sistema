function qw_cli
parameter ren,col,cual
private ren,col,cual
if filcli=2
   store nul to respuesta
   =cligrl(ren-7,col,"a Listar",.T.)
   on sele popu cligrl DO RESP1
   ACTI POPU cligrl
   RELE POPU cligrl
   store '' to fisc,tt
   ch=bar()
   FISC=qwcli(ch)
   if fisc#".F."
      quecli=fisc
      ttcli=tt
   else
      store 1 to filcli
   endif
else
   if filcli=3
      quecli="LEFT("+CUAL+",1)='I'"
   endif   
endif
return FILCLI=1 .or. (fiLcli=2 .and. ch#3)
