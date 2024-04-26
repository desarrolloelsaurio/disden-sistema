********************************************************************************
*-- Programa: XEST.PRG
*-- Fecha   : 06/04/91 06:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE ESTRUCTURA DE PRODUCTO
********************************************************************************
ulpr=HORA_ULP(PROGRAM())
IF CHEQSEG()
	SELE EST
		=men_lin('Generando Nuevo Indice de Estructura de Producto')
		=FLOCK("EST") .or. FLOK("EST")
		=dotalk()
		=OPESTX()
		SELE EST
		INDE ON ARTICULO TAG ARTICULO
		INDE ON ARTICULO+STR(POSICION) TAG HOJARUT
		INDE ON LEFT(ARTICULO,10)+STR(POSICION) TAG REDUC UNIQ
		=REOPEST()
		=untalk()
	=iaud('Estr Producto')
ELSE
	=IAUDI()
ENDIF
RETURN
