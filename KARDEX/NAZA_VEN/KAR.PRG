*:*********************************************************************
*:
*:        Program: KAR.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/04/91     18:06
*:
*:      Called by: KARDEX.PRG
*:
*:          Calls: IKAR.PRG
*:               : BKAR.PRG
*:               : LKARI.PRG
*:               : LKARP.PRG
*:               : VKAR.PRG
*:               : RNDX.PRG
*:               : XKAR.PRG
*:
*:      Documented 09/26/91 at 11:53               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: kar.prg
*-- Fecha   : 06/21/91 11:46am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE kardex
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
SELE kar
DO CASE
CASE BAR()=1
   DO ikar
CASE BAR()=3
   respuesta='nada#8#15#Tipo de Borrado#3#Borra \<Todo el Archivo#\<'+abios+'#\<'+tellas+'#\<Por '+abio+'#P\<or '+tella
=DEFPOP()
   ON SELE POPU nada DO bkar
   ACTI POPU nada
   RELE POPU nada
CASE BAR()=4
   respuesta='nada#8#15#Calcula Saldos de Kardex#3#Borra \<Todo el Archivo#\<'+abios+'#\<'+tellas+'#\<Por '+abio+'#P\<or '+tella
	=DEFPOP()
   ON SELE POPU nada DO skar
   ACTI POPU nada
   RELE POPU nada
CASE BAR()=6
respuesta='nada#9#45#Tipo de Listado#3#\<'+abio+'#\<'+tella+'#\<Un Taller#Una Orden de \<'+favri
=DEFPOP()
   ON SELE POPU nada DO lkari
   ACTI POPU nada
   RELE POPU nada
CASE BAR()=7
respuesta='nada#9#45#Tipo de Listado#3#\<'+abio+'#\<'+tella+'#\<Un Taller#Una Orden de \<'+favri
=DEFPOP()
   ON SELE POPU nada DO lkarp
   ACTI POPU nada
   RELE POPU nada
CASE BAR()=9
   DO vkar
CASE BAR()=11
   ulpr='Xkar'
   DO rndx WITH 16,20
   ON SELE POPU rndx DO xkar
   ACTI POPU rndx
   RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN
*: EOF: KAR.PRG
