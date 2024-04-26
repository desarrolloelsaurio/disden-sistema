********************************************************************************
*-- Programa: OPFACx.PRG
*-- Fecha   : 09-18-92 03:46pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS exclusivo
********************************************************************************
USE (PATHVEN+'\FACTUDAT') ALIAS fax EXCL IN 9
USE (PATHVEN+'\FACTURAS') ALIAS fac EXCL IN 8
RETURN
