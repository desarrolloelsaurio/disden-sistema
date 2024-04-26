********************************************************************************
*-- Programa: OPKAR.PRG
*-- Fecha   : 06/18/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO KARDEX DE MERCADERIAS TERMINADAS EXCL
********************************************************************************
=men_lin('Abriendo archivo de Kardex')
SELE 18
   USE (PATHVEN+'\KARDEX') ALIAS kar EXCL
=MEN_LIN(BOTOM)
RETURN
