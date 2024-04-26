********************************************************************************
*-- Programa: XMER.PRG
*-- Fecha   : 01-04-93 05:43pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE MERCADERIA
********************************************************************************
ulpr=HORA_ULP(PROGRAM())
STORE "" TO tx
SELE mer
DO CASE
CASE BAR()=1
	=men_lin('Reindexando el Archivo de Mercader¡as')
	=FLOcK("MEX") .or. flok("MEX")
	=FLOcK("MER") .or. flok("MER")
	=dotalk()
	=opMERx()
	SELE MER
	REINDEX
	SELE MEX
	REINDEX
	=reopMER()
	=untalk()
	TX='REINDEX '
CASE BAR()=2
	=men_lin('Generando Nuevo Indice de Mercader¡as')
	=FLOcK("MER") .or. flok("MER")
	=FLOcK("MEX") .or. flok("MEX")
	=dotalk()
	=OPMERX()
	SELE MER
	sele mer
	index on RUBRO+VARIEDAD+CALIDAD tag MERCE for EXENTA
	index on RUBRO+VARIEDAD+CALIDAD tag MERCA for .NOT.EXENTA
	index on PALPOPUP               tag PALPOPUP 
	index on RUBRO+VARIEDAD+CALIDAD tag ARTIXULO 
	index on ARTICULO               tag ARTICULO 
	sele mex
	index on  ARTICULO                       tag ARTICULO for .NOT.AGOTADA
	index on  ARTICULO+PROVEEDOR+STR(REMESA) tag MERCA for .NOT.AGOTADA
	index on  PROVEEDOR+STR(REMESA) tag PROVEEDOR for .NOT.AGOTADA	
	=REOPMER()
	=untalk()
	TX='CREA INDICE '
ENDCASE
IF tx#''
	DO iaud WITH tx+' Mercader¡a'
ENDIF
RETURN
