********************************************************************************
*-- Programa: mere.prg
*-- Fecha   : 06/05/91 03:21pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE MERCADERIA EXENTA
********************************************************************************
ulpr=PROGRAM()
=CABPAN1()
SELE mer
SET ORDER TO TAG MERCE
DO CASE
CASE BAR()=1
DO imere
CASE BAR()=2
STORE 0 TO respuesta
IF !EMPTY(elimer(" a Corregir",-1,1,.T.))
DO cmer
ENDIF
CASE BAR()=4
STORE 0 TO respuesta
IF !EMPTY(elimer(" a Borrar",-1,1,.T.))
DO bmer
ENDIF
CASE BAR()=5
SET DELE OFF
GOTO TOP
IF !EOF()
STORE MERpop TO anterior
STORE .T. TO MERpop
STORE 0 TO respuesta
SET FILTER TO DELETED()
IF !EMPTY(eliMER(" a Recuperar",-1,1,.T.))
DO llMER
ENDIF
STORE anterior TO MERpop
ENDIF
SET DELE ON
SELE MER
SET FILTER TO
CASE BAR()=6
DO rmer
CASE BAR()=8
DO lmeri
CASE BAR()=9
DO lmerp
CASE BAR()=11
DO vmer
CASE BAR()=13
ulpr='Xmer'
DO rndx WITH 16,20
ON SELE POPU rndx DO xmer
ACTI POPU rndx
RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=men_lin("  "+repl("°",78))
UNLO ALL
RETURN

