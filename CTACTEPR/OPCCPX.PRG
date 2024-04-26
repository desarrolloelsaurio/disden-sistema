*:*********************************************************************
*-- Programa: OPCCPX.PRG
*-- Fecha   : 08/25/91 07:08pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE PROVEEDORES EXCL
*-- Modificaci¢n GOYO 06-09-92 06:06pm (men_lin / order tag)
*-- Modificaci¢n GOYO 09-04-92 02:14pm (cambia de area)
*-- VERSION NAZA/ARGENTA/RAFULS/NOVOGAR
*:*********************************************************************
=MEN_LIN('Abriendo archivo de Cta Corriente Proveedores')
SELE 6
DO CASE
CASE SSTM1="ADMIN"
	USE (PATHALQ+'\CCPRO') ALIAS CCP EXCL
CASE SSTM1="MERCADO"
	USE (PATHPRO+'\CCPRO') ALIAS CCP EXCL
OTHERWISE
	USE (PATHCPR+'\CCPRO') ALIAS CCP EXCL
ENDCASE
RETURN MEN_LIN(BOTOM)
