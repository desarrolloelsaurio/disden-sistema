********************************************************************************
*-- Programa: XREM.PRG
*-- Fecha   : 09-18-92 03:49pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE REMITOS
*-- VERSION NOVOGAR
********************************************************************************
PROCEDURE XREM
Ulpr=hora_ulp(PROGRAM())
IF CHEQSEG()
   STORE "" TO TX
   DO OPREM
   SELE REM
   =men_lin('Generando Nuevo Indice de Remitos')
   =FLOCK("REM") .or. FLOK("REM")
   =FLOCK("REX") .or. FLOK("REX")
   =dotalk()
   =OPREMX()
   SELE REM
   INDEX ON REMITO TAG REMITO
   INDEX ON TIPO TAG TIPO
   SELE REX
   INDEX ON REMITO TAG REMITO
   =untalk()
   =REOPREM()
   =IAUD('Remitos')
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
