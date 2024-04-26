****************************************************************************
*-- Programa: precios.prg
*-- Fecha   : 11-09-92 10:53pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE PRECIOS
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
=OPPRO()
DO OPPOL
DO CASE
CASE BAR()=1
DO POL
CASE BAR()=2
	respuesta='POL#6#28#Gesti¢n de Poligonales#3#\<Ingreso'
	=DEFPOP()
	on sele popu pol do pol
	acti popu pol
	rele popu pol
CASE BAR()=3
*LISTADOS
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN
