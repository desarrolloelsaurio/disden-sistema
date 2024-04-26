********************************************************************************
*-- Programa: OPCCLX.PRG
*-- Fecha   : 01-25-93 01:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE CLIENTES EXCLUSIVO
*-- Modificaci¢n GOYO 01-21-93 03:51pm (cambio de  rea)
*-- VERSION NAZA/ARGENTA/RAFULS/NOVOGAR
********************************************************************************
PARAMETER SHIT
RETURN GETDBF('CCCLI',.F.,'ccl',5,.T.)
