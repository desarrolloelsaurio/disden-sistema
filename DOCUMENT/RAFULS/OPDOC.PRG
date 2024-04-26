********************************************************************************
*-- Programa: OPDOC.PRG
*-- Fecha   : 11/02/91 13:31am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE NUMEROS DE DOCUMENTO
********************************************************************************
PARAMETER SHIT
sele 22
=MEN_LIN(ABA+'Documentaci¢n')
USE (PATHALQ+'\document') order tag doccod ALIAS doc
=MEN_LIN(BOTOM)
RETURN
