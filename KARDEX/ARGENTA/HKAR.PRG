********************************************************************************
*-- Programa: HKAR.PRG
*-- Fecha   : 01/29/92
*-- Version : V.LEEGSTRA
*-- Notas   : GENERA HISTORICO DE KARDEX SOBRE REGISTROS ASOCIADOS A REMESAS AGOTADAS
********************************************************************************
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   =iaud('INGRESO '+ulpr)
   =hora_ulp()
   CLEA
   =movewin(10,10 TO 15,69,win," Archivando en el Hist¢rico de Kardex ")
   @ 1,3 say "Archivando en el Hist¢rico de Kardex la Mercader¡a "
   @ 2,3 say "asociada a Remesas agotadas y borradas l¢gicamente."
   if confirma(" Archivar en el Hist¢rico",.t.,20,0)
      SET DELE OFF
      sele kar
      COPY TO TMPKAR FOR deleted()
      use
      acti scre
      DO ophka
      SELE hka
      DO flok WITH "hka"
      APPE FROM TMPKAR
      UNLO IN hka
      USE
      DELE FILE TMPKAR.DBF
      =OPKAR()
      SELE kar
      DO flok WITH "kar"
*     PACK
      UNLO IN kar
      SET DELE ON
   endif
   =RELEWIN(win)
ELSE
   =iaudi()
ENDIF
ACTI SCREE
=men_lin(botom)
RETURN
*: EOF: HKAR.PRG
