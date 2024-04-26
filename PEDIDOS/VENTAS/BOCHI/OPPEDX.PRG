********************************************************************************
*-- Programa: OPPED.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO NOTAS DE PEDIDO
*-- PARAMETRO TRUCHO 14.12.92
********************************************************************************
=CLOSDBF("PEX")
=CLOSDBF("PED")
USE (PATHVEN+'\PEDTUDAT') ALIAS PEX EXCL IN 29
USE (PATHVEN+'\PEDTURA') ALIAS PED EXCL IN 28
RETURN MEN_LIN(BOTOM)

