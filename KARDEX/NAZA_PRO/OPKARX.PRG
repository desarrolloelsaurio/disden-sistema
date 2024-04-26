********************************************************************************
*-- Programa: OPKARX.PRG
*-- Fecha   : 06/18/91
*-- Version : V.LEEGSTRA
*-- Notas   : ABRE ARCHIVO KARDEX
*-- Modificaci¢n GOYO 03/08/92
********************************************************************************
=men_lin('Abriendo archivo de Kardex')
SELE 17
   USE (PATH+'\KARDEX') ORDER TAG ARTICULO ALIAS kar EXCL
RETURN men_lin(botom)
