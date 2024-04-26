*******************************************
*-- Programa: OPCOM.PRG
*-- Fecha   : 08/25/91 07:05pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS COMPRAS
*******************************************
PARAMETER SHIT
IF !USED("COM")
	=MEN_LIN(ABA+'Facturas de Compras')
	SELE 8
	USE (pathcpr+'\FACTUCO') INDEX (pathcpr+'\FACTUCO') ALIAS COM
ENDIF
=MEN_LIN(BOTTOM)
RETURN
