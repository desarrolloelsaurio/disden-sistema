********************************************************************************
*-- Programa: OPHKA.PRG
*-- Fecha   : 01/29/92
*-- Version : V.LEEGSTRA
*-- Notas   : ABRE ARCHIVO HISTORICO DE KARDEX
********************************************************************************
=MEN_LIN('Abriendo archivo Hist¢rico de Kardex')
SELE 17
IF ALIAS()#'HKA'
   A=PATH+'\HKARDEX'
   USE &a INDEX &A ALIAS HKA
ENDIF
=MEN_LIN(BOTOM)
RETURN

