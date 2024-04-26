********************************************************************************
*-- Programa: OPMERX.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MERCADERIAS
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
*-- Modificaci¢n GOYO (area 14)
********************************************************************************
FUNCTION OPMERX
RETURN GETDBF("MERCA",.F.,'MER',14,.T.)
