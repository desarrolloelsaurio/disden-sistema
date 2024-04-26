*************************************
*-- Programa: XHOR.PRG
*-- Fecha   : 
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE HORAS
**************************************
PROCEDURE XHOR
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=HORA_ULP()
ULPR=PROGRAM()
IF CHEQSEG()
   =OPHOR()
   SELE HOR
   =men_lin('Reindexando el Archivo')
   =FLOCK("HOR") .OR. FLOK("HOR")
   =DOTALK()
   =OPHOR(.T.)
   SELE HOR
   INDEX ON CODCLI TAG CODCLI
   INDEX ON CODCLI+DTOS(FECHAOP) TAG FECHAOP 
   TX='CREA INDICE '
   =OPHOR(.F.,.T.)
   =UNTALK()
   =IAUD(TX)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
