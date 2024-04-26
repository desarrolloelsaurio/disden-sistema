********************************************************************************
*-- Programa: OPPRAX.PRG
*-- Fecha   : 10-17-92 07:31pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE PRACTICAS Y UNIDADES DE PRACTICAS excl
********************************************************************************
=men_lin('Abriendo archivo de Pr cticas')
SELE 15
USE (PATHPRO+'\PRACTDAT') ALIAS PRX excl
SELE 14
USE (PATHPRO+'\PRACTICA') ALIAS PRA excl
RETURN men_lin(botom)
