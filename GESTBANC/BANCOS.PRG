* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Application: CAJA               ³
* ³    File Name: BANCOS.PRG         ³
* ³       Author: G. REINER          ³
* ³ Date created: 05-04-94           ³
* ³ Time created: 02:37:48pm         ³
* ³    Copyright: 1994 by G. REINER  ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
ULPR=PROGRAM()
BA_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
DO CASE
CASE BA_DIJO="Transferencia de Fondos"
   DO OPBAN
	=OPGAS()
   DO OPEMP
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO OPCAJ WITH JANNRO
      DO TBAN
   endif
CASE BA_DIJO="Acreditaci¢n de Cheques"
   DO OPBAN
	=OPGAS()
   DO OPEMP
	=OPCLI()
	=OPFAC()
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO OPCAJ WITH JANNRO
      DO OPCCH WITH JANNRO
      =OPCCL() WITH JANNRO
      DO IACRE
   ENDIF
CASE BA_DIJO="Ajuste de Cta Cte"
   DO OPBAN
	=OPGAS()
	=OPCLI()
   DO OPEMP
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      =OPFAC() WITH JANNRO
      DO OPCAJ WITH JANNRO
      DO OPCCH WITH JANNRO
      =OPCCL() WITH JANNRO
      DO COBAN WITH .T.
   ENDIF
CASE BA_DIJO="Dep¢sito en Efectivo"
   DO OPBAN
	=OPGAS()
	=OPCLI()
   DO OPEMP
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      =OPFAC() WITH JANNRO
      DO OPCAJ WITH JANNRO
      DO OPCCH WITH JANNRO
      =OPCCL() WITH JANNRO
      DO COBAN WITH .F.
   ENDIF
CASE BA_DIJO="Dep¢sito de Cheques de Terceros"
   DO OPBAN
	=OPGAS()
	=OPCLI()
   DO OPEMP
   DO DEPCHE3
CASE BA_DIJO="Listados por Pantalla"
   DO OPBAN
	=OPGAS()
   =OPPRO()
	=OPCLI()
   DO OPEMP
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO OPCAJ WITH JANNRO
      DO OPCCH WITH JANNRO
      =OPCCL() WITH JANNRO
      DO LSBO WITH .T.
   ENDIF
CASE BA_DIJO="Listados por Impresora"
   DO OPBAN
	=OPGAS()
   =OPPRO()
	=OPCLI()
   DO OPEMP
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIEMP('',-1,1))
      DO OPCAJ WITH JANNRO
      DO OPCCH WITH JANNRO
      =OPCCL() WITH JANNRO
      DO LSBO WITH .T.
   ENDIF
ENDCASE
RETURN MEN_LIN(botom)
