*:*********************************************************************
*-- Programa: REC.prg
*-- Fecha   : 11-18-91 02:59pm
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE REMITOS PROVEEDORES
*:**********************************************************************
ulpr=hora_ulp(program())
dijo=bar()
=OPPRO()
DO OPEMP
=OPMER()
IF JANNRO#0
DO oprec WITH JANNRO
=OPKAR() WITH JANNRO

c1=1
c2=22
c3=53
c4=64
c5=61
c6=72
DO CASE
CASE dijo=1
  DO irec
CASE DIJO=3
DO LRECP WITH .T.
CASE DIJO=4
DO LRECP
CASE dijo=6
   ulpr='XREC'
   DO rndx WITH 10,30
   ON SELE POPU rndx DO xREC
   ACTI POPU rndx
   RELE POPU rndx
ENDCASE
endif
RETURN MEN_LIN(BOTOM)
