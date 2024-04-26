********************************************************************************
*-- Programa: OPPED.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO NOTAS DE PEDIDO
*-- PARAMETRO TRUCHO 14.12.92
********************************************************************************
parameter shit
IF ESOPEN("Notas de Pedido",29,"PEX")
	USE (PATHVEN+'\PEDTUDAT') ORDER TAG FACTURA ALIAS PEX
ENDIF
IF ESOPEN("",28,"PED")
	USE (PATHVEN+'\PEDTURA') ORDER TAG FACTURA ALIAS PED
ENDIF
RETURN MEN_LIN(BOTOM)

