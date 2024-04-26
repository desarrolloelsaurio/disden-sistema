********************************************************************************
*-- Programa: opciu.prg
*-- Fecha   : 06/12/91 01:50pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE POLIGONAL
********************************************************************************
=men_lin('Abriendo archivo de Poligonal')
SELE 3
IF ALIAS()#'POL'
   USE (PATHPRO+'\POLIGONA') ORDER TAG LIMITE ALIAS POL
ENDIF
=men_lin(botom)
RETURN
