*********************************************
*-- Programa: OPTIXX.PRG
*-- Fecha   : 01-18-92 08:44am
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO DE TIPO DE GASTOS
*********************************************
FUNCTION OPTIXX
RETURN GETDBF('UNIDAT',.F.,"TIX",15,.T.)
