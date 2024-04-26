*:*********************************************************************
*-- Programa: OPRECX.PRG
*-- Fecha   : 07/04/91 11:00am
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO REMITO PROVEEDORES EXCL
*-- Modificaci¢n GOYO 08/08/92
*:*********************************************************************
=MEN_LIN('Abriendo archivo Remitos de Proveedores')
SELE 11
USE (PATHCPR+'\REMITDAC') ALIAS RED EXCL
SELE 10
USE (PATHCPR+'\REMITOC') ALIAS REC EXCL
RETURN MEN_LIN(BOTOM)
