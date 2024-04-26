********************************************************************************
*-- Programa: MEDJ.prg
*-- Fecha   : 06/06/91 02:13pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE DOMICILIO POSTAL
********************************************************************************
ulpr=hora_ulp(program())
DO CASE
CASE BAR()=1
	stor nul TO respuesta
	IF !EMPTY(eliMED(" para Ingresar Legajo",-1,10))
		DO iMEDP
	ENDIF
CASE BAR()=3
	stor nul TO respuesta
	IF !EMPTY(eliMED(" a Borrar",-1,10))
		DO bMEDp
	ENDIF
CASE BAR()=4
	IF confirma('Borrar TODOS los DOMICILIOS POSTALES',.T.,10,nul)
		SELE MED
		REPL ALL MED.postal WITH ""
		DO iaud  WITH 'BORRO TODOS LEGAJOS MEDICOS '
	ENDIF
CASE BAR()=6
	DO MEDgrl WITH 14,60,'L¡mites del Listado',.T.
	ON SELE POPU MEDgrl DO lMEDPp
	ACTI POPU MEDgrl
	RELE POPU MEDgrl
CASE BAR()=7
	DO MEDgrl WITH 14,60,'L¡mites del Listado'
	ON SELE POPU MEDgrl DO lMEDPi
	ACTI POPU MEDgrl
	RELE POPU MEDgrl
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
