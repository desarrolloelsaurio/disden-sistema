*********************************************************************************
*-- Programa: BANCOS.prg
*-- Fecha   : 11/14/91
*-- Version : V.LEEGSTRA
*-- Notas   : MENU BANCOS
********************************************************************************
ulpr=program()
=CABPAN1()
DO CASE
CASE BAR()=1
   do opban
	=OPGAS()
   DO OPEMP
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO opcaj with JANNRO
      DO tban
   endif
CASE BAR()=2
   do opban
	=OPGAS()
   DO OPEMP
	=OPCLI()
	=OPFAC()
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO opcaj with JANNRO
      DO opcch with JANNRO
      =OPCCL() with JANNRO
      DO iacre
   endif
CASE BAR()=4
   do opban
	=OPGAS()
	=OPCLI()
   DO OPEMP
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      =OPFAC() with JANNRO
      DO opcaj with JANNRO
      DO opcch with JANNRO
      =OPCCL() with JANNRO
      DO coban with .T.
   endif
CASE BAR()=5
   do opban
	=OPGAS()
	=OPCLI()
   DO OPEMP
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      =OPFAC() with JANNRO
      DO opcaj with JANNRO
      DO opcch with JANNRO
      =OPCCL() with JANNRO
      DO coban with .F.
   endif
CASE BAR()=7
   do opban
	=OPGAS()
   =OPPRO()
	=OPCLI()
   DO OPEMP
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO opcaj with JANNRO
      DO opcch with JANNRO
      =OPCCL() with JANNRO
      do lsbo with .T.
   endif
CASE BAR()=8
   do opban
	=OPGAS()
   =OPPRO()
	=OPCLI()
   DO OPEMP
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO opcaj with JANNRO
      DO opcch with JANNRO
      =OPCCL() with JANNRO
      do lsbo with .T.
   endif
ENDCASE
=MEN_LIN(botom)
RETURN
