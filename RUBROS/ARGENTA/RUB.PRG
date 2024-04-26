********************************************************************************
*-- Programa: RUB.prg
*-- Fecha   : 12/10/91
*-- Version : V.LEEGSTRA
*-- Notas   : DERIVA A OPERACIONES DE "RUVROS"
********************************************************************************
ulpr=PROGRAM()
=CABPAN1()
SELE rub
DO CASE
CASE BAR()=1
   DO irub
CASE BAR()=2
   STORE 0 TO respuesta
   IF !EMPTY(elirub(" a Corregir",-1,1))
      DO crub
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF !EMPTY(elirub(" a Borrar",-1,1))
      DO brub
   ENDIF
CASE BAR()=5
   SET DELE OFF
   SET FILTER TO DELETED()
   GOTO TOP
   IF !EOF()
      STORE rubpop TO anterior
      STORE .T. TO rubpop
		=OPRUB()
      STORE 0 TO respuesta
      IF !EMPTY(elirub(" a Recuperar",-1,1))
         DO llrub
      ENDIF
      STORE anterior TO rubpop
   ENDIF
   SET DELE ON
   SELE rub
   SET FILTER TO
CASE BAR()=8
   DO lrubi
CASE BAR()=9
   DO lrubp
CASE BAR()=13
   ulpr='XRUB'
   DO rndx WITH 16,20
   ON SELE POPU rndx DO xrub
   ACTI POPU rndx
   RELE POPU rndx
CASE BAR()=11
   DO vrub
ENDCASE
ulpr=PROGRAM()
@ 24,0 say "  "+repl("°",78)
UNLO ALL
RETURN
*: EOF: RUB.PRG
