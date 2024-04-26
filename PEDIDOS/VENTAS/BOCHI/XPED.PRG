*************************************************
*-- Programa: XPED.PRG
*-- Fecha   : 09-18-92 03:49pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE PEDTURAS DE VENTA
*-- VERSION NOVOGAR
*************************************************
PROCEDURE XPED
	ULPR=HORA_ULP(PROGRAM())
	=CHEQSEG()
	IF FUERARED()#27
		STORE "" TO TX
		=OPPED()
		SELE PED
		=men_lin('Generando Nuevo Indice')
		=FLOCK("PED") .or. FLOK("PED")
		USE
		=FLOCK("PEX") .or. FLOK("PEX")
		USE
		=OPPEDX()
		=dotalk()
		SELE PED
		INDEX ON PEDIDO TAG PEDTURA
		INDEX ON CODCLI TAG CODCLI
		SELE PEX
		INDEX ON PEDIDO TAG PEDTURA 
		=UNTALK()
		=REOPPED()
		=IAUD('CREA INDICE')
	ENDIF
RETURN
