*************************************
*-- Programa: XCNX.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE CONSORCIOS
**************************************
PROCEDURE XCNX
=HORA_ULP()
ULPR=PROGRAM()
IF CHEQSEG()
   DO OPCNX
   SELE CNX
   =men_lin('Reindexando el Archivo')
   =FLOCK("CNX") .OR. FLOK("CNX")
   =DOTALK()
   =OPCNXX()
   SELE CNX
   Index TAG CONCOD on CONCOD
   Index TAG DENOM on DENOM
   Index TAG CODCLI on CODCLI
   Index TAG CONDENOM on CONCOD+DENOM
   TX='CREA INDICE '
   =REOPCNX()
   =UNTALK()
   =IAUD(TX)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
