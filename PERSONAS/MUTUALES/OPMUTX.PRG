********************************************************************************
*-- Programa: OPMUTX.PRG
*-- Fecha   : 10-07-92 03:18pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE MUTUALES EXCLUSIVE
********************************************************************************
=men_lin('Abriendo archivo de Obras Sociales')
SELE 5
USE (PATHPRO+'\MUTUALES') ALIAS MUT EXCL
SELE 6
USE (PATHPRO+'\MUTUALDAT') ALIAS MUX EXCL
=men_lin(botom)
RETURN
