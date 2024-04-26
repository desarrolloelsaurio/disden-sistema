*********************************************************************
*-- Programa: LFARPZ0.PRG
*-- Fecha   : 09-29-92 02:00pm
*-- Version : G. REINER
*-- Notas   : GENERA ORDENAMIENTO PARA LISTADO DE FACTURAS DE COMPRA
*********************************************************************
FUNCTION LFARPZ0
	=WORKING()
	for a=8 to CANT_MAX
		if variable[a]
			ttl[a]=nul
			store .t. to hay
		endif
	NEXT
	if !hay
		rele ttl,ctrl
	endif
	SELE FAR
	set order to tag factura
	set order to tag procod in per
	set relation to FAR.codcli INTO per
	set order to tag PAGCOD in MIX
	set relation to FAR.CONDPAGO INTO MIX ADDI
	tmp=gentmp()
	IF ".T."=FISC
		INDE ON DTOS(FECHAEM) to (tmp) COMP
	ELSE
		INDE ON DTOS(FECHAEM) to (tmp) for EVAL(FISC) COMP
	ENDIF
	ACLA=HAZ_ACLA()
	linea=REPL("=",LEN(acla))
	tt='Listado de '+PROP(TIT_INVOS)+' de Proveedores'+TTQUE
	=UNWORK()
RETURN .T.
