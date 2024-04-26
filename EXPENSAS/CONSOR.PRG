********************************
*-- Programa: consor.prg
*-- Fecha   : 02-18-92 12:27pm
*-- Version : G. REINER
*-- Notas   : MENU consorcios
********************************
=cabpan1()
DO CASE
case bar()=1
   DO OPTIP
   DO TIP
CASE BAR()=2
	=OPCIU()
	=OPPRV()
   do opcns
   do grl with 5,30,"Gesti¢n de Consorcios"
   on sele popu grl do cNS
   ACTI POPU GRL
   rele POPU GRL
CASE BAR()=3
   do optip
   do opcns
   do OPCSS
	=OPPRV()
	=OPCIU()
   do opcnx
   respuesta='grl#6#30#Unidades de Consorcios#3;
#\<Ingreso Manual;
#Ingreso por \<Rangos;
#\<Corrige;
#C\<orrige Propietario;
#-;
#\<Borra;
#\<Recupera;
#-'
   respuesta=respuesta+';
#\<Lista por Impresora#;
Lista \<por Pantalla;
#-;
#Posici¢n de \<Ventanas;
#-;
#Res\<taura el Archivo'
=defpop()
   on sele popu grl do CNX
   ACTI POPU GRL
   rele POPU GRL
case bar()=5
	=OPGAS()
   do gas
CASE BAR()=6
   store 1 to itixr,itixc, ctixr,ctixc, VtixR, VtixC, mtixR, mtixC, mcnsR, mcnsC
   store 15 to tixpopr
   store 40 to tixpopc
   STORE 7 TO ItixLA, ctixla, mtixla
   STORE 60 TO ItixAN, ctixan, mcnsan
   tixpop = .t.
   DO OPTIP
   DO OPCNS
   DO OPCNX
   DO OPCSS
   DO OPTIX
   do grl with 7,30,"Asignaci¢n Tipo de Gasto a Consorcios"
   on sele popu grl do tix
   ACTI POPU GRL
   rele POPU GRL
ENDCASE
RETURN MEN_LIN(BOTOM)
