*************************************
*-- Programa: XMIX.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE MIXTA
**************************************
PROCEDURE XCJJ
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=HORA_ULP()
ULPR=PROGRAM()
IF CHEQSEG()
   DO OPCJJ
   SELE CJJ
   =men_lin('Reindexando el Archivo')
   =FLOCK("CJJ") .OR. FLOK("CJJ")
   =DOTALK()
   =OPCJJ(.T.)
   SELE CJJ
   INDEX ON NUMERO TAG NUMERO
   INDEX ON CODCLI+STR(NUMINT) TAG NUMINT
   INDEX ON STR(PASILLO,2)+MANO+STR(COLUMNA,3)+STR(FILA,2)+POSICION TAG UBICACION
   INDEX ON PEDIDO TAG PEDIDO
   INDEX ON CODCLI TAG CODCLI
   TX='CREA INDICE '
   =OPCJJ(.F.,.T.)
   =UNTALK()
   =IAUD(TX)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
