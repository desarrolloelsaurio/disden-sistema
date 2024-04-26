********************************************************************************
*-- Programa: OPREMX.PRG
*-- Fecha   : 07/04/91 10:57am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO REMITOS EXCLUSIVO
********************************************************************************
SELE 11
   USE (PATHVEN+'\REMITDAT') ALIAS rex EXCL
SELE 10
   USE (PATHVEN+'\REMITOS') ALIAS rem EXCL
=MEN_LIN(BOTOM)
RETURN
