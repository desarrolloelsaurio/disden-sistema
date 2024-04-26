********************************************************************************
*-- Programa: OPREMx.PRG
*-- Fecha   : 07/04/91 10:57am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO REMITOS EXCL
********************************************************************************
=men_LIN('Abriendo archivo de Remitos')
SELE 11
   USE (PATHVEN+'\REMITDAT') ALIAS rex EXCL
SELE 10
   USE (PATHVEN+'\REMITO') ALIAS rem EXCL
=MEN_LIN(BOTOM)
RETURN
