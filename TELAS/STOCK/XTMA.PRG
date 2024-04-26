********************************************
*-- Programa: XTMA.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE TELOS DE STOCK
********************************************
PROCEDURE XTMA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=HORA_ULP()
ULPR=PROGRAM()
IF CHEQSEG()  .AND. ;
   FUERARED()#27
   =OPTMA()
   SELE TMA
   =men_lin('Reindexando el Archivo de '+TELLAS)
   =FLOCK("TMA") .OR. FLOK("TMA")
   =FLOCK("THI") .OR. FLOK("THI")   
   =DOTALK()
   =OPTMA(.F.,.T.)
      SELE TMA
	 INDEX ON CODMADRE TAG CODMADRE
	 INDEX ON TELMADRE TAG TELMADRE
	 SELE THI
	 INDEX ON CODMADRE TAG CODMADRE
	 INDEX ON TELCODPRO TAG TELCODPRO
	 INDEX ON CODMADRE+TELCODPRO TAG PARIENTE
   TX='CREA INDICE '
   =OPTMA(.T.)
   =UNTALK()
   =IAUD(TX)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
