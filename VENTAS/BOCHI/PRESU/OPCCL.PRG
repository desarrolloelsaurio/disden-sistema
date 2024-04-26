*******************************************
*-- Programa: OPCCL.PRG
*-- Fecha   : 07/30/91 06:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE CLIENTES
*****************************************
FUNCTION OPCCL
PARAMETER SHIT
IF USED("CCL")
	SELE CCL
ELSE
	=MEN_LIN(ABA+"Cta Corriente Clientes")
***	SELE 5
***	=GETDBF('CCCLI','CODCLI','CCL',5)
	SELE 0
	use (camino2+"\CCCLI") ALIAS ccl
ENDIF
RETURN MEN_LIN(BOTOM)

