********************************************************************************
*-- Programa: opvixX.prg
*-- Fecha   : 06/12/91 01:50pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO ZONAS DE VIAJANTES EXCLUSIVO
*-- Modificaci¢n GOYO 01-21-93 05:06pm
*-- VERSION NOVOGAR
********************************************************************************
RETURN GETDBF('VIAJADAT',.F.,'VIX',20,.T.)
