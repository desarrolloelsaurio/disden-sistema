*******************************************
*-- Programa: OPCCL.PRG
*-- Fecha   : 07/30/91 06:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE CLIENTES
*-- Modificaci¢n GOYO 01-21-93 03:51pm (cambio de  rea)
*-- VERSION NAZA/ARGENTA/RAFULS/NOVOGAR
*****************************************
FUNCTION OPCCL
PARAMETER SHIT
IF USED("CCL")
	SELE CCL
ELSE
	=MEN_LIN(ABA+"Cta Corriente Clientes")
	SELE 5
	=GETDBF('CCCLI','CODCLI','CCL',5)
ENDIF
RETURN MEN_LIN(BOTOM)

