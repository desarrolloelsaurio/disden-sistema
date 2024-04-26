********************************************************************************
*-- Programa: cabpan1.prg
*-- Fecha   : 10/03/91 04:23pm
*-- Version : g. reiner
*-- Notas   : imprime titulos
********************************************************************************
function cabpan1
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE ONE    1                                 && ONE
XX=chr(32)+chr(71)+chr(111)+chr(121)+chr(111)+;
   chr(32)+chr(82)+chr(69)+chr(73)+chr(78)+chr(69)+chr(82)+;
   chr(32)

#IF "Wind" $ vers()
=MEN_LIN(XX)
#else
*elren=iif(menu()="_MSYSMENU",1,nul)
ELREN=NUL
@ elren,nul SAY REPLICATE("Û",80) COLO W
@ elren,1 SAY sstm COLO I
@ elren,23 SAY PAIP
@ elren,25 SAY DATE() COLO I
@ elren,34 SAY PAIP
@ elren,45 SAY PAIP
=HORA_ULP()
@ elren,58 SAY PAIP
@ elren,60 SAY PADL(janname,10) COLO I
@ elren,71 SAY PAIP
@ elren,72 SAY LEFT(usador,7) COLO I
@ 23,nul SAY PADC(XX,80,'°') COLO I
#endif
RETURN .T.
