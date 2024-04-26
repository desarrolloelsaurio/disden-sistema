*:*********************************************************************
*-- Programa: OPFARX.PRG
*-- Fecha   : 09-04-92 01:31am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS EXCLUSIVO
*:*********************************************************************
=MEN_LIN('Abriendo archivo de Facturas')
SELE 9
USE (pathcpr+'\FACTUDAC') ALIAS fad EXCL
SELE 8
USE (pathcpr+'\FACTURAc') ALIAS faR EXCL
RETURN MEN_LIN(BOTOM)
