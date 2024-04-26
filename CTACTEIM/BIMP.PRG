*************************************************
*-- Programa: BIMP.PRG
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : BORRA IMPUESTOA
************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
I_DIJO=ALLTRIM(PROMPT())
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE I_DIJO="Borra Impuesto de Inquilino"
   DO BIMPINQ.SPR
CASE I_DIJO="Borra Impuesto de Propietario"
   DO BIMPPRP.SPR
CASE I_DIJO="Transfiere a Inquilino"
   DO BIMPPRIN.SPR
CASE I_DIJO="Transfiere a Propietario"
   DO BIMPINPR.SPR WITH .T.
CASE I_DIJO="Transfiere de Inquilino a Inquilino"
ENDCASE
ULPR=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
