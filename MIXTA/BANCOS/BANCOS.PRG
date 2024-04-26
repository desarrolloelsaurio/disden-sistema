*********************************************************************************
*-- Programa: BANCOS.prg
*-- Fecha   : MAYO DE 1994
*-- Version : G. REINER
*-- Notas   : MENU BANCOS
********************************************************************************
ulpr=program()
=cabpan1()
BA_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE BAR()=1
   do opban
	=OPGAS()
   DO OPEMP
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO opcaj
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
      DO opcaj
		=OPCCH()
		=OPCCL()
      DO iacre
   endif
CASE BAR()=4
   do opban
	=OPGAS()
	=OPCLI()
   DO OPEMP
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO opcaj
		=OPCCH()
		=OPCCL()
      DO coban with .T.
   endif
CASE BAR()=5
   do opban
	=OPGAS()
	=OPCLI()
   DO OPEMP
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO opcaj
		=OPCCH()
		=OPCCL()
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
      DO opcaj
		=OPCCH()
		=OPCCL()
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
      DO opcaj
		=OPCCH()
		=OPCCL()
      do lsbo with .T.
   endif
ENDCASE
RETURN MEN_LIN(botom)
