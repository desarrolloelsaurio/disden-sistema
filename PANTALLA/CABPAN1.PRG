*********************************
*-- Programa: CABPAN1.PRG
*-- Fecha   : 10/03/91 04:23pm
*-- Version : G. REINER
*-- Notas   : IMPRIME TITULOS
*********************************
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP

function cabpan1
	elren=iif(menu()="_MSYSMENU",1,nul)
	#if "Wind" $ vers()
		@ 0,0 say repl(chr(176),80) colo w/b
	#ELSE
		@ ELREN,ELREN SAY REPLICATE("Û",80) COLO W
	#endif
	@ ELREN,1 SAY sstm COLO I
	@ ELREN,23 SAY PAIP
	@ ELREN,25 SAY DATE() COLO I
	@ ELREN,34 SAY PAIP
	@ ELREN,45 SAY PAIP
	=HORA_ULP()
	@ ELREN,58 SAY PAIP
	@ ELREN,60 SAY PADL(janname,10) COLO I
	@ ELREN,71 SAY PAIP
	@ ELREN,72 SAY LEFT(usador,7) COLO I
	XX=chr(83)+chr(73)+chr(83)+chr(84)+chr(69)+chr(77)+chr(65)+;
		chr(83)+chr(32)+chr(73)+chr(78)+chr(70)+chr(79)+chr(82)+;
		chr(77)+chr(65)+chr(84)+chr(73)+chr(67)+chr(79)+chr(83)+;
		chr(32)+chr(83)+chr(46)+chr(82)+chr(46)+chr(76)+chr(46)+;
		chr(32)+chr(45)+chr(32)+chr(71)+chr(111)+chr(121)+chr(111)+;
		chr(32)+chr(82)+chr(69)+chr(73)+chr(78)+chr(69)+chr(82)+;
		chr(32)+chr(47)+chr(32)+chr(67)+chr(97)+chr(114)+chr(108)+;
		chr(111)+chr(115)+chr(32)+chr(71)+chr(69)+chr(78)+chr(90)+;
		chr(76)+chr(69)+chr(82)
	@ 23,ELREN SAY PADC(XX,80,'°') COLO i
RETURN .t.
