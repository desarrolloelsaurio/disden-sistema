*************************************
*-- Programa: XRPV.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE RPVTA
**************************************
PROCEDURE XRPV
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=HORA_ULP()
ULPR=PROGRAM()
IF CHEQSEG()
   =OPRPV()
   SELE RPV
   =men_lin('Reindexando el Archivo')
   =FLOCK("RPV") .OR. FLOK("RPV")
   =DOTALK()
   =OPRPV(.F.,.T.)
   SELE RPV
   Index TAG NUMERO  ON NUMERO
   Index TAG NUMTELA ON STR(NUMERO)+TELCODPRO
   Index TAG NUMAVIO ON STR(NUMERO)+AVICODPRO
   TX='CREA INDICE '
   =OPRPV(.T.)
   =UNTALK()
   =IAUD(TX)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
