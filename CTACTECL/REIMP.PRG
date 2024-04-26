******************************************************
*-- Programa: REIMP.PRG
*-- Fecha   : 09-05-92 02:41pm
*-- Version : G. REINER
*-- Notas   : DERIVA A PROCEDIMIENTOS DE REIMPUTACION
******************************************************
PARAMETER DIRETO
R_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE R_DIJO="Reimputaci¢n Manual" .OR. DIRETO
   DO CLI
CASE R_DIJO="Por Factura"
   ON SELE POPU CLIGRL DO REIMP_1 WITH 1
   m.eltitu='Factura'
   =CLIGRL(11,40,'L¡mites de la Reimputaci¢n por '+m.eltitu,.t.)
   ACTI POPU CLIGRL
   RELE POPU CLIGRL
CASE R_DIJO="Por Fecha de Emisi¢n"
   ON SELE POPU CLIGRL DO REIMP_1 WITH 2
   m.eltitu='Fecha de Emisi¢n'
   =CLIGRL(11,40,'L¡mites de la Reimputaci¢n por '+m.eltitu,.t.)
   ACTI POPU CLIGRL
   RELE POPU CLIGRL
CASE R_DIJO="Fecha de Vencimiento"
   =CLIGRL(11,40,'L¡mites de la Reimputaci¢n por '+m.eltitu,.t.)
   ON SELE POPU CLIGRL DO REIMP_1 WITH 3
   m.eltitu='Fecha de Vencimiento'
   ACTI POPU CLIGRL
   RELE POPU CLIGRL
CASE R_DIJO="Reimputaci¢n Autom tica"
   =CLIGRL(11,40,'L¡mites de la Reimputaci¢n Autom tica',.t.)
   ON SELE POPU CLIGRL DO REIMP_1
   m.eltitu='Autom tica'
   ACTI POPU CLIGRL
   RELE POPU CLIGRL
ENDCASE
RETURN MEN_LIN(BOTOM)
