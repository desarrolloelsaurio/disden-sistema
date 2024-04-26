***********************************************
*-- Programa: OPCCH.PRG
*-- Fecha   : 09/03/91 06:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE DE CHEQUES
*-- Modificaci¢n GOYO 01-21-93 04:17pm (cambio de area)
*-- VERSION NOVOGAR/RAFULS/NAZA
*************************************************
PARAMETER SHIT
IF USED("CCH")
   SELE CCH
ELSE
   =MEN_LIN(ABA+"Cta Corriente de Cheques")
   =GETDBF('CCCHE','CODCLI','CCH',7)
ENDIF
RETURN MEN_LIN(BOTOM)
