*************************************
*-- Programa: XPRS.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE PRSTA
**************************************
PROCEDURE XPRS
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=HORA_ULP()
ULPR=PROGRAM()
IF CHEQSEG()
   =OPPRS()
   SELE PRS
   =men_lin('Reindexando el Archivo')
   =FLOCK("PRS") .OR. FLOK("PRS")
   =DOTALK()
   =OPPRS(.F.,.T.)
   SELE PRS
   Index ON NUMERO tag NUMERO
   Index ON CODCLI+ARTICULO+PRCCOD tag PRCCOD FOR !EMPTY(CODCLI)
   TX='CREA INDICE '
   =OPPRS(.T.)
   =UNTALK()
   =IAUD(TX)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
