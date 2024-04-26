********************************************
*-- Programa: XTELS.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE TELOS DE STOCK
********************************************
PROCEDURE XTELS
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=HORA_ULP()
ULPR=PROGRAM()
IF CHEQSEG()  .AND. ;
   FUERARED()#27
   =OPTELS()
   SELE TELS
   =men_lin('Reindexando el Archivo de '+TELLAS)
   =FLOCK("TELS") .OR. FLOK("TELS")
   =DOTALK()
   =OPTELS(.F.,.T.)
   SELE TELS
	 INDEX ON TELCODPRO TAG TELCODPRO
	 INDEX ON TELA TAG TELA
	 INDEX ON MADRE TAG MADRE
   TX='CREA INDICE '
   =OPTELS(.T.)
   =UNTALK()
   =IAUD(TX)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
