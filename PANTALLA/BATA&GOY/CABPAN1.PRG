********************************************************************************
*-- Programa: cabpan1.prg
*-- Fecha   : 10/03/91 04:23pm
*-- Version : g. reiner
*-- Notas   : imprime titulos
********************************************************************************
function cabpan1
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
XX=chr(73)+chr(78)+chr(70)+chr(79)+chr(82)+;
   chr(77)+chr(65)+chr(84)+chr(73)+chr(67)+;
   chr(65)+chr(32)+chr(77)+chr(69)+chr(68)+;
   chr(73)+chr(67)+chr(65)+chr(32)+chr(45)+;
   chr(32)+chr(82)+chr(105)+chr(99)+chr(97)+;
   chr(114)+chr(100)+chr(111)+chr(32)+chr(84)+;
   chr(65)+chr(66)+chr(65)+chr(67)+chr(77)+;
   chr(65)+chr(78)+chr(32)+chr(47)+chr(32)+;
   chr(71)+chr(111)+chr(121)+chr(111)+chr(32)+;
   chr(82)+chr(69)+chr(73)+chr(78)+chr(69)+chr(82)
@ 23,nul SAY PADC(XX,80,'°') COLO i
RETURN .t.
