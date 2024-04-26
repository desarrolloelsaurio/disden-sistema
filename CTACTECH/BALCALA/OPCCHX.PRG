********************************************************************************
*-- Programa: OPCCH.PRG
*-- Fecha   : 09/03/91 06:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE DE CHEQUES
*-- Modificaci¢n GOYO (area 7)
********************************************************************************
FUNCTION OPCCHX
PARAMETER SHIT
=men_lin(ABA+'Cta Corriente de Cheques')
SELE 7
cosa=q_arc("cch")
USE (PATHVEN+'\'+COSA) ALIAS cch EXCL
=MEN_LIN(BOTOM)
RETURN
