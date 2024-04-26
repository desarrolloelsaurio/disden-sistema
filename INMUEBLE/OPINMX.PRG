********************************************************************************
*-- Programa: OPINMX.PRG
*-- Fecha   : 12-21-92 01:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO INMUEBLES EXCLUSIVO
*-- Modificaci¢n GOYO 05-30-92 11:44am (saco else en elias#inm)
********************************************************************************
=MEN_LIN(ABA+"Inmuebles")
SELE 14
USE (PATHALQ+'\INMUEBLE') ALIAS INM EXCL
RETURN men_lin(BOTOM)
