*:*********************************************************************
*-- Programa: OPFAR.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS
*:*********************************************************************
PARAMETER SHIT
IF !USED("FARX")
    =MEN_LIN(ABA+"Facturas de Compra")
    SELE 9
	USE (pathcpr+'\FACTUDAC') ORDER TAG FACTURA ALIAS FARX
ENDIF
IF USED("FAR")
   SELE FAR
ELSE
   =MEN_LIN(ABA+"Facturas de Compra")
   SELE 8
   USE (pathcpr+'\FACTURAc') ORDER TAG FACTURA ALIAS far
ENDIF
RETURN MEN_LIN(BOTOM)
