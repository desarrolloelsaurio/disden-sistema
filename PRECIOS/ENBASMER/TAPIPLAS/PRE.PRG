****************************************************************************
*-- Programa: mer.prg
*-- Fecha   : 06/05/91 03:21pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE PROCESOS DE FABRICACION
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
do oppol
=OPPRO()
DO CASE
CASE BAR()=1
	do ipol
CASE BAR()=2
	ttque=''
	fisc=grl2(' L¡mites de la Correcci¢n ')
	if fisc#'.F.'
		=WORKING()
		SELE MER
		INDE ON ARTICULO TO (GENTMP()) FOR EVAL(FISC) comp
		DO CPRE
	endif
CASE BAR()=4
	ttque=''
	fisc=grl2(' L¡mites de la Actualizaci¢n ')
	if fisc#'.F.'
		=WORKING()
		SELE MER
		INDE ON ARTICULO TO (GENTMP()) FOR EVAL(FISC) comp
		DO APRE
	endif
CASE BAR()=6
	respuesta='LPRE#7#45#Tipo de Lista de Precios#3#\<Rubro-Sub Rubro#\<Por Proveedor'
	=DEFPOP()
	ON SELE POPU LPRE DO lpre WITH .T.
	ACTI POPU LPRE
	RELE POPU LPRE
CASE BAR()=7
	respuesta='LPRE#7#45#Tipo de Lista de Precios#3#\<Rubro-Sub Rubro#\<Por Proveedor'
	=DEFPOP()
	ON SELE POPU LPRE DO lpre
	ACTI POPU LPRE
	RELE POPU LPRE
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN
