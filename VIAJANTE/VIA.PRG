********************************************************************************
*-- Programa: via.prg
*-- Fecha   : 06/06/91 04:30pm
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE VIAJANTES
*-- Modificaci¢n GOYO 05-14-92 03:55pm
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
SELE via
DO CASE
CASE BAR()=1
DO ivia
CASE BAR()=2
STOR NUL TO respuesta
IF ELIvia(" a Corregir",-1,1)
DO cvia
ENDIF
CASE BAR()=4
STOR NUL TO respuesta
IF ELIvia(" a Borrar",-1,1)
DO bvia
ENDIF
CASE BAR()=5
   SET DELE OFF
   SET FILTER TO DELETED()
   GOTO TOP
   IF !EOF()
      stor viapop TO anterior
      stor .T. TO viapop
		=OPVIA()
      SET FILTER TO DELETED()
      STOR NUL TO respuesta
      IF ELIvia(" a Recuperar",-1,1)
         DO llvia
      ENDIF
      stor anterior TO viapop
		=OPVIA()
   ENDIF
   SET FILTER TO
   SET DELE ON
CASE BAR()=6
DO rvia
CASE BAR()=8
DO lviai
CASE BAR()=9
respuesta='NADA#15#25#Tipo de Listado de '+biajas+'#3#\<Domicilio#\<Tel‚fono'
=DEFPOP()
ON SELE POPU NADA DO lviap
ACTI POPU NADA
RELE POPU NADA
CASE BAR()=11
DO vvia
CASE BAR()=13
ulpr='XVIA'
DO rndx WITH 16,20
ON SELE POPU rndx DO xvia
ACTI POPU rndx
RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
