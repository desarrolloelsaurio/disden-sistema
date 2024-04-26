*********************************************************************************
*-- Programa: ENTRAD.PRG
*-- Fecha   : 11-08-91 12:21pm
*-- Version : R. 'EL BATA'
*-- Notas   : MENU DE INGRESOS DE CAJA
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
ulpr=program()
=cabpan1()
dijo=bar()
=OPCIU()
DO CASE
CASE DIJO=1
   =OPCAJ()
   =OPCLI()
   DO ICOBCTDO
CASE dijo=2
   =OPCAJ()
   =OPCLI()
   DO ICOBTARJ
CASE dijo=3
   =OPCAJ()
   =OPCLI()
   DO IEFE
case dijo=5
   =OPCAJ()
   =OPPRO()
   DO OPBAN
   =OPCLI()
   do lcaj with .t.,'GAS','C'
case dijo=6
   =OPCAJ()
   =OPPRO()
   DO OPBAN
   =OPCLI()
   do lcaj with .f.,'GAS','C'
CASE dijo=8
   =OPCIU()
   =OPCLI()
   =OPCCH()
   =OPCCL()
   =cclgrl(7,20)
   ON SELE POPU nada DO ctactec1
   ACTI POPU nada
   RELE POPU nada
CASE dijo=9
   =OPCIU()
   =OPCLI()
   =OPCCH()
   =OPCCL()
   =cclgrl(7,20)
   ON SELE POPU nada DO ctactec2
   ACTI POPU nada
   RELE POPU nada
ENDCASE
RETURN MEN_LIN(BOTOM)
