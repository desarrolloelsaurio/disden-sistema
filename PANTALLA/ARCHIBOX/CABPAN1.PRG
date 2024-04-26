********************************************************************************
*-- Programa: cabpan1.prg
*-- Fecha   : 10/03/91 04:23pm
*-- Version : g. reiner
*-- Notas   : imprime titulos
********************************************************************************
function cabpan1
#DEFINE PAIP   "|"                               && PAIP
#DEFINE NUL    0                                 && NUL
@ nul,nul SAY REPLICATE("Û",80) COLO W
@ nul,1 SAY sstm COLO I
@ nul,23 SAY PAIP
@ nul,25 SAY DATE() COLO I
@ nul,34 SAY PAIP
@ nul,45 SAY PAIP
=HORA_ULP()
@ nul,58 SAY PAIP
@ nul,60 SAY PADL(janname,10) COLO I
@ nul,71 SAY PAIP
@ nul,72 SAY LEFT(usador,7) COLO I
XX=chr(71)+chr(79)+chr(89)+chr(79)+chr(32)+;
   chr(82)+chr(69)+chr(73)+chr(78)+chr(69)+;
   chr(82)+chr(32)+chr(80)+chr(65)+chr(82)+;
   chr(65)+chr(32)+chr(65)+chr(82)+chr(67)+;
   chr(72)+chr(73)+chr(66)+chr(79)+chr(88)+;
   chr(32)+chr(83)+chr(46)+chr(82)+chr(46)+;
   chr(76)+chr(46)
@ 23,nul SAY PADC(XX,80,'°') COLO i
RETURN .t.
