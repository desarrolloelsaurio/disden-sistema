*******************************************
*-- Programa: OPCCL.PRG
*-- Fecha   : 07/30/91 06:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE CLIENTES
*****************************************
FUNCTION OPCCLH
PARAMETER SHIT
IF USED("CCLH")
	SELE CCLH
ELSE
	=MEN_LIN(ABA+"Cta Corriente Clientes")
***	SELE 5
***	=GETDBF('CCCLIH','CODCLI','CCLH',5)
	SELE 0
	use (camino2+"\CCCLIH") ALIAS cclh
ENDIF
RETURN MEN_LIN(BOTOM)

