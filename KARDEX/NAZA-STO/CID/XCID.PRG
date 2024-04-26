*************************************
*-- Programa: XCID.PRG
*-- Fecha   : 252/12/96
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE CID
**************************************
FUNCTION XCID
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=HORA_ULP()
ULPR=PROGRAM()
IF CHEQSEG()
   =OPCID()
   SELE CID
   =men_lin('Reindexando el Archivo')
   =FLOCK("CID") .OR. FLOK("CID")
   =DOTALK()
   =OPCID(.F.,.T.)
   SELE CID
   Index TAG NUMERO     ON NUMERO
   Index TAG RESERVA    ON CORTE   For CODMOV="RS"
   Index TAG CORTE      ON CORTE   FOR !EMPTY(CORTE)
   SELE CIX
   =FLOCK("CIX") .OR. FLOK("CIX")
   Index TAG NUMERO     ON NUMERO
   Index TAG AVICOR     ON AVICODPRO+STR(CORTE)
   Index TAG TELCOR     ON TELCODPRO+STR(CORTE)
   TX='CREA INDICE '
   =OPCID(.T.)
   =UNTALK()
   =IAUD(TX)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
