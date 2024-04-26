**********************************
*-- Programa: XMI1.PRG
*-- Fecha   : 06-07-93 01:25pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE MIXTA1
***********************************
PROCEDURE XMI1
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=HORA_ULP()
ULPR=PROGRAM()
IF CHEQSEG()
   =OPMI1()
   =men_lin('Reindexando el Archivo')
   =FLOCK("MI1") .OR. FLOK("MI1")
   =DOTALK()
   =OPMI1X()
   SELE MI1
   INDE ON FILTRO+LEFT(TEXTO2,2) TAG TODOS
   INDEX TAG ALITEX ON TEXTO1           FOR FILTRO="A"
   INDEX TAG ALICOD ON LEFT(TEXTO2,2)   FOR FILTRO="A"
   INDEX TAG CARTEX ON TEXTO1           FOR FILTRO="K"
   INDEX TAG CARCOD ON LEFT(TEXTO2,2)   FOR FILTRO="K"
   INDEX TAG MARTEX ON TEXTO1           FOR FILTRO="M"
   INDEX TAG MARCOD ON LEFT(TEXTO2,2)   FOR FILTRO="M"
   TX='CREA INDICE '
   =REOPMI1()
   =UNTALK()
   =IAUD("INDEXA")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
