********************************************************************************
*-- Programa: defpop.prg
*-- Fecha   : 03-08-92 05:29pm
*-- Version : G. REINER
*-- Notas   : define popups
*-- Modif.  : GOYO 05-30-92 09:40pm REEMP IF POR IIF
********************************************************************************
FUNCTION DEFPOP
PRIVATE PPU,RPPU,CPPU,CTT,LPPU,CLPPU
respuesta=respuesta+"#!"
ppu=g1()
rppu=VAL(g1())
cppu=VAL(g1())
ctt=g1()
lppu=""
clppu=VAL(g1())
DEFI POPU (ppu) FROM rppu,cppu MESS ctt SHAD COLO SCHE IIF(clppu=3,4,CLPPU)
ren=1
DO WHILE respuesta#"!"
   ctt=g1()
   DEFI BAR ren OF (ppu) PROM IIF(CTT='-','\-',' '+ctt+' ')
   ren=ren+1
ENDDO
RETURN .T.

*!*********************************************************************
*!
*!       Function: G1()
*!
*!      Called by: DEFPOP.PRG
*!
*!*********************************************************************
FUNCTION g1
m.pocas=AT("#",respuesta)
pp=LEFT(respuesta,m.pocas-1)
respuesta=SUBSTR(respuesta,m.pocas+1)
RETURN pp
