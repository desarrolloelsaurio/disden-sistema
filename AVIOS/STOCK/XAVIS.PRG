********************************************
*-- Programa: XAVIS.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE AVIOS DE STOCK
********************************************
PROCEDURE XAVIS
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=HORA_ULP()
ULPR=PROGRAM()
IF CHEQSEG() .AND. ;
	 FUERARED()#27
   DO OPAVIS
   SELE AVIS
   =men_lin('Reindexando el Archivo de '+ABIOS)
   =FLOCK("AVIS") .OR. FLOK("AVIS")
   =DOTALK()
   =OPAVIS(.F.,.T.)
   SELE AVIS
	 INDEX ON AVICODPRO TAG AVICODPRO
	 INDEX ON AVIO TAG AVIO
	 INDEX ON MADRE TAG MADRE
   TX='CREA INDICE '
   =OPAVIS(.T.)
   =UNTALK()
   =IAUD(TX)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
