*******************************************
*-- Programa: OPCCL.PRG
*-- Fecha   : 07/30/91 06:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE CLIENTES
*             HISTORICO EXCLUSIVO
*-- Modificación GOYO 01-21-93 03:51pm (cambio de área)
*-- VERSION NAZA/ARGENTA/RAFULS/NOVOGAR
*****************************************
FUNCTION OPCCLHX
PARAMETER SHIT
=CLOSDBF("CCLH")
=MEN_LIN(ABA+"Cta Corriente Clientes Histórica")
=PRXAREA(.T.)
=GETDBF('CCCLIH','CODCLI','CCLH',SELE(0),.T.)
RETURN MEN_LIN(BOTOM)

