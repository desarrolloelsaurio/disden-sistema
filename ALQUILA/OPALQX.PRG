*****************************************
*-- Programa: OPALQX.PRG
*-- Fecha   : 04-15-92 02:37pm
*-- Notas   : ABRE ARCHIVO CONTRATOS
******************************************
FUNCTION OPALQX
USE (PATHALQ+'\CONTRATO') ALIAS ALQ EXCL IN 16
RETURN .T.
