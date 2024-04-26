*******************************************
*-- Programa: OPCCL.PRG
*-- Fecha   : 07/30/91 06:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE CLIENTES
*-- Modificaci¢n GOYO 01-21-93 03:51pm (cambio de  rea)
*-- VERSION NAZA/ARGENTA/RAFULS/NOVOGAR
*****************************************
FUNCTION OPCCLH
PARAMETER SHIT
IF USED("CCLH")
	SELE CCLH
ELSE
	=MEN_LIN(ABA+"Cta Corriente Clientes")
	=PRXAREA(.T.)
	=GETDBF('CCCLIH','CODCLI','CCLH',SELE(0))
ENDIF
RETURN MEN_LIN(BOTOM)

