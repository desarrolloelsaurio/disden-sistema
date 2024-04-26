********************************************************************************
*-- Programa: mer.prg
*-- Fecha   : 06/05/91 03:21pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE PROCESOS DE FABRICACION
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
SELE mer
DO CASE
CASE BAR()=1
   DO imer
CASE BAR()=2
   STOR NUL TO respuesta
   IF ELImer(" a Corregir",-1,1)
      DO cmer
   ENDIF
CASE BAR()=4
   do grl2 with 6,25,"L¡mites del Borrado"
   DEFI BAR 7 OF nada PROM ' Un \<Producto'
   on sele popu nada do bmer
   acti popu nada
   rele popu nada
CASE BAR()=5
   do grl2 with 6,25,"L¡mites de la Recuperaci¢n"
   DEFI BAR 7 OF nada PROM ' Un \<Producto'
   on sele popu nada do llmer
   acti popu nada
   rele popu nada
CASE BAR()=8
   DO grl2 WITH 8,25,'L¡mites del Listado'
   ON SELE POPU nada DO lmeri
   ACTI POPU nada
   RELE POPU nada
CASE BAR()=9
   DO grl2 WITH 9,25,'L¡mites del Listado'
   ON SELE POPU nada DO lmerp
   ACTI POPU nada
   RELE POPU nada
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
=men_lin(botom)
UNLO ALL
RETURN
