********************************************************************************
*-- Programa: OPFACx.PRG
*-- Fecha   : 09-18-92 03:46pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS exclusivo
********************************************************************************
=men_lin('Abriendo archivo de Facturas')
SELE 23
USE (PATHVEN+'\FACTUDAT') ALIAS fax
SELE 8
USE (PATHVEN+'\FACTURA') ALIAS fac
=MEN_LIN(BOTOM)
RETURN
