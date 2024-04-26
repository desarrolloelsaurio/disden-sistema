*:*********************************************************************
*-- Programa: OPCCP.PRG
*-- Fecha   : 08/25/91 07:08pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE PROVEEDORES
*-- Modificaci¢n GOYO 06-09-92 06:06pm (men_lin / order tag)
*-- Modificaci¢n GOYO 09-04-92 02:14pm (cambia de area)
*-- VERSION NAZA/ARGENTA/RAFULS/NOVOGAR
*:*********************************************************************
PARAMETER SHIT
IF !USED("CCP")
    SELE 6
    =MEN_LIN(ABA+"Cta Corriente "+PROPER(PROBES))
	elpath=iif(SSTM1="ADMIN",pathalq,iif(sstm1="MERCADO" .OR. SSTM1="BARCOS",PATHPRO,PATHCPR))
	USE (elpath+'\CCpro') ORDER TAG PROCOD ALIAS ccp
ENDIF
RETURN MEN_LIN(BOTOM)
