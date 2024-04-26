********************************************
*-- Programa: XCOMS.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE PRODUCTOS TERMINADOS
********************************************
PROCEDURE XOTRS
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=HORA_ULP()
ULPR=PROGRAM()
IF CHEQSEG()  .AND. ;
  FUERARED()#27
   =OPOTRS()
   SELE OTRS
   =men_lin('Reindexando el Archivo de Otros Productos')
   =FLOCK("OTRS") .OR. FLOK("OTRS")
   =DOTALK()
   =OPOTRS(.F.,.T.)
   SELE OTRS
 	 INDEX ON OTRCODPRO TAG OTRCODPRO
	 INDEX ON OTRPRA TAG OTRO
	 INDEX ON MADRE TAG MADRE
   TX='CREA INDICE '
   =OPOTRS(.T.)
   =UNTALK()
   =IAUD(TX)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
