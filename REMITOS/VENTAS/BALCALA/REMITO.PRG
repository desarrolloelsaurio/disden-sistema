********************************************************************************
*-- Programa: REMITO.PRG
*-- Fecha   : 12-11-91 02:45pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE REMITOS
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
DO OPEMP
=OPCLI()
=OPVIA()
=OPCIU()
=OPPAG()

DO CASE
CASE BAR()=1
   store nul to respuesta
   if !empty(ELIEMP("a Remitir",-1,1))
      =OPMER() with jannro
      =OPKAR() WITH JANNRO
      DO OPPED with jannro
      do oprem with jannro
      STORE 0 TO RESPUESTA
      IF !empty(ELICLI("a Facturar",-1,1))
         DO REMP
      endif
   endif
CASE BAR()=2
   store nul to respuesta
   if !empty(ELIEMP("a Remitir",-1,1))
      JANCOD=LEFT(MIX.TEXTO2,2)
      =OPMER() with jannro
      =OPKAR() with jannro
      DO OPREM with jannro
      DO REMD
   endif
CASE BAR()=3
   store nul to respuesta
   if !empty(ELIEMP("a Remitir",-1,1))
      JANCOD=LEFT(MIX.TEXTO2,2)
      =OPMER() WITH JANNRO
      =OPKAR() WITH JANNRO
      DO OPREI WITH JANNRO
      DO REMI
   endif
CASE BAR()=5
   STOR NUL TO nurem,numarca
   IF BUSREM()
      JANCOD=LEFT(MIX.TEXTO2,2)
      =OPMER() WITH JANNRO
      =OPKAR() WITH JANNRO
      DO OPREI WITH JANNRO
      DO CREM
   ENDIF
CASE BAR()=6
   =OPMER() WITH JANNRO
   =OPKAR() WITH JANNRO
   DO OPREI WITH JANNRO
   DO AREM
CASE BAR()=8
   respuesta='nadax#5#30#Tipo de Listado de Remitos#3#\<Clientes#\<'+biajas
	=DEFPOP()
   on sele popu nadax do lrem WITH .T.
   acti popu nadax
   rele popu nadax
CASE BAR()=9
   respuesta='nadax#5#30#Tipo de Listado de Remitos#3#\<Clientes#\<'+biajas
	=DEFPOP()
   on sele popu nadax do lrem WITH .F.
   acti popu nadax
   rele popu nadax
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN
