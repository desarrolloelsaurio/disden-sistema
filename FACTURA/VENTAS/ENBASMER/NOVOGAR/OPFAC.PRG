****************************************
*-- Programa: OPFAC.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS
****************************************
PARAMETER SHIT
IF !USED("FAX")
   =MEN_LIN(ABA+"Facturas")
    SELE 9
   	USE (PATHVEN+'\FACTUDAT') ORDER TAG FACTURA ALIAS FAX
ENDIF
IF USED("FAC")
   SELE FAC
ELSE   
   =MEN_LIN(ABA+"Facturas")
   SELE 8
   USE (PATHVEN+'\FACTURAS') ORDER TAG FACTURA ALIAS FAC
ENDIF
RETURN MEN_LIN(BOTOM)
