********************************************************************************
*-- Programa: XFAR.PRG
*-- Fecha   : 09-04-92 01:35am
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE FACTURAS DE COMPRA
********************************************************************************
PROCEDURE XFAR
ULPR=HORA_ULP()
IF CHEQSEG()
   DO OPFAR
   =men_lin('Generando Nuevo Indice de Facturas de Compra')
   SELE FAR
   =DOTALK()
   =OPFARX()
   =FLOCK("FAR") .OR. FLOK("FAR")
   =FLOCK("FAD") .OR. FLOK("FAD")
   SELE FAR
INDEX ON FECHAEM TAG FECHAEM
INDEX ON CONCOD TAG CONCOD
INDEX ON FECHAVE TAG FECHAVE
INDEX ON PROCOD TAG PROCOD
INDEX ON FACTURA+PROCOD TAG FACTURA 
   SELE FAD
   INDEX ON CONCOD TAG CONCOD
   INDEX ON PROCOD TAG  PROCOD
   INDEX ON FACTURA+PROCOD TAG FACTURA 
   =REOPFAR()
   =untalk()
   =IAUD('CREA INDICE')
ELSE
   =IAUDI()
ENDIF
RETURN
