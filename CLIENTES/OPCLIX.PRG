********************************************************************************
*-- Programa: OPCLIX.PRG
*-- Fecha   : 06/27/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO CLIENTES
********************************************************************************
=MEN_LIN('Abriendo archivo de Clientes')
USE (PATHVEN+'\CLIENTES') ALIAS cli EXCL IN 3
RETURN MEN_LIN(botom)
