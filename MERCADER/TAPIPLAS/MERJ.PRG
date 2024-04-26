********************************************************************************
*-- Programa: MERJ.PRG
*-- Fecha   : 06/06/91 02:13pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE LEGAJOS CLIENTES
********************************************************************************
ulpr=hora_ulp(program())
DO CASE
CASE BAR()=1
	stor nul TO respuesta
	IF !EMPTY(eliMER(" para Ingresar Legajo",-1,10))
		DO iMERj
	ENDIF
CASE BAR()=3
	stor nul TO respuesta
	IF !EMPTY(eliMER(" a Borrar",-1,10))
		DO bMERj
	ENDIF
CASE BAR()=4
	IF confirma('Borrar TODOS los Legajos ',.T.,10,nul)
		SELE MER
		REPL ALL MER.legajo WITH ""
		DO iaud  WITH 'BORRO TODOS LEGAJOS MERCADERIAS '
	ENDIF
CASE BAR()=6
	DO MERgrl WITH 8,34,'L¡mites del Listado'
	ON SELE POPU MERgrl DO lMERjp
	ACTI POPU MERgrl
	RELE POPU MERgrl
CASE BAR()=7
	DO MERgrl WITH 8,34,'L¡mites del Listado'
	ON SELE POPU MERgrl DO lMERji
	ACTI POPU MERgrl
	RELE POPU MERgrl
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
