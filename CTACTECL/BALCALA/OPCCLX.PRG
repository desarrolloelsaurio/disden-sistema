********************************************************************************
*-- Programa: OPCCLX.PRG
*-- Fecha   : 07/30/91 06:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE CLIENTES
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
*-- Modificaci¢n GOYO (area 5)
********************************************************************************
FUNCTION OPCCLX
PARAMETER CSA
PRIVATE CSA
=men_lin('Abriendo archivo de Cta Corriente Clientes')
JANNRO=IIF(PARAMETER()=1,CSA,nul)
SELE 5
=GETDBF(q_arc("ccl"),.F.,"ccl",5,.T.)
RETURN =MEN_LIN(BOTOM)
