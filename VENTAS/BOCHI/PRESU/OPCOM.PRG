*******************************************
*-- Programa: OPCCL.PRG
*-- Fecha   : 07/30/91 06:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE CLIENTES
*****************************************
FUNCTION OPCOM
PARAMETER SHIT
IF USED("COM")
	SELE COM
ELSE
	=MEN_LIN(ABA+"Comisiones")
	SELE 0
	use (camino2+"\COMISION") ALIAS COM
ENDIF
RETURN MEN_LIN(BOTOM)

