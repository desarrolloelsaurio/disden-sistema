******************************************************
*-- Programa: REIMP.PRG
*-- Fecha   : 09-05-92 02:41pm
*-- Version : G. REINER
*-- Notas   : DERIVA A PROCEDIMIENTOS DE REIMPUTACION
******************************************************
PARAMETER DIRETO
R_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE R_DIJO="Reimputación Manual" .OR. DIRETO
   DO CLI
CASE R_DIJO="Por Factura"
   ON SELE POPU CLIGRL DO REIMP_1 WITH 1
   m.eltitu='Factura'
   =CLIGRL(11,40,'Límites de la Reimputación por '+m.eltitu,.t.)
   ACTI POPU CLIGRL
   RELE POPU CLIGRL
CASE R_DIJO="Por Fecha de Emisión"
   ON SELE POPU CLIGRL DO REIMP_1 WITH 2
   m.eltitu='Fecha de Emisión'
   =CLIGRL(11,40,'Límites de la Reimputación por '+m.eltitu,.t.)
   ACTI POPU CLIGRL
   RELE POPU CLIGRL
CASE R_DIJO="Fecha de Vencimiento"
   =CLIGRL(11,40,'Límites de la Reimputación por '+m.eltitu,.t.)
   ON SELE POPU CLIGRL DO REIMP_1 WITH 3
   m.eltitu='Fecha de Vencimiento'
   ACTI POPU CLIGRL
   RELE POPU CLIGRL
CASE R_DIJO="Reimputación Automática"
   =CLIGRL(11,40,'Límites de la Reimputación Automática',.t.)
   ON SELE POPU CLIGRL DO REIMP_1
   m.eltitu='Automática'
   ACTI POPU CLIGRL
   RELE POPU CLIGRL
ENDCASE
RETURN MEN_LIN(BOTOM)
