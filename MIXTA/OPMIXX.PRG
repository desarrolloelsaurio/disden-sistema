**************************************
*-- Programa: OPMIXX.PRG
*-- Fecha   : 08-07-92 05:56pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MIXTO EXCL
**************************************
FUNCTION OPMIXX
RETURN CLOSDBF("MIX") .AND. GETDBF('MIXTA',.F.,"MIX",1,.T.)
