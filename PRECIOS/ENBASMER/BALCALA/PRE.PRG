********************************************************************************
*-- Programa: PRE.PRG
*-- Fecha   : 08/26/91 11:18am
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE PRECIOS
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
********************************************************************************
ulpr=PROGRAM()
=CABPAN1()
SELE mer
pcu='Porcentaje Utilidad '
DO CASE
CASE BAR()=1
respuesta='nada1#7#35#Forma de Ingreso de Precios#3#\<Un Producto#\<Generaliza#\<Ingreso Global'
=DEFPOP()
ON SELE POPU nada1 DO ipre
ACTI POPU nada1
RELE POPU nada1
CASE BAR()=2
STOR NUL TO respuesta
IF ELImer(" a Corregir",-1,1)
DO cpre
ENDIF
CASE BAR()=3
DO grl2 WITH 9,32,'L¡mites de la Actualizaci¢n'
ON SELE POPU nada DO apre
ACTI POPU nada
RELE POPU nada
CASE BAR()=5
STORE NUL TO RESPUESTA
IF !empty(ELIemp('a Listar',-1,1))
   =OPMER() WITH JANNRO
   DO LPRE WITH .F.
ENDIF
CASE BAR()=6
STORE NUL TO RESPUESTA
IF !empty(ELIemp('a Listar',-1,1))
   =OPMER() WITH JANNRO
   DO LPRE WITH .T.
ENDIF
CASE BAR()=8
ulpr='XPRE'
DO rndx WITH 13,25
ON SELE POPU rndx DO xpre
ACTI POPU rndx
RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
UNLO ALL
RETURN
*: EOF: PRE.PRG
