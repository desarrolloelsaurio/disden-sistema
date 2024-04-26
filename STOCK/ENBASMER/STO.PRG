********************************************************
*-- Programa: STO.PRG
*-- Fecha   : 12-12-91 05:48pm
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE STOCk
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
*******************************************************
ulpr=PROGRAM()
=cabpan1()
SELE mer
pcu='Porcentaje Utilidad '
DO CASE
CASE BAR()=1
respuesta='nada1#7#33#Forma de Ingreso de Stock#3#\<Un Producto#\<Generaliza#\<Ingreso Global'
=DEFPOP()
ON SELE POPU nada1 DO iSTO
ACTI POPU nada1
RELE POPU nada1
CASE BAR()=2
DO grl2 WITH 9,32,'L¡mites de la Correcci¢n'
ON SELE POPU nada DO ASTO WITH 2
ACTI POPU nada
RELE POPU nada
CASE BAR()=3
DO grl2 WITH 9,32,'L¡mites de la Actualizaci¢n'
ON SELE POPU nada DO aSTO WITH 1
ACTI POPU nada
RELE POPU nada
CASE BAR()=5
store nul to respuesta
if !empty(ELIEMP("a Listar",-1,1))
   =reopmer()
do lsto with .f.
endif
CASE BAR()=6
store nul to respuesta
if !empty(ELIEMP("a Listar",-1,1))
=reopmer()
do lsto with .t.
endif
ENDCASE
ulpr=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
