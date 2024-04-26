*******************************************************************************
*-- Programa: HREM.PRG
*-- Fecha   : 01/29/92
*-- Version : V.LEEGSTRA
*-- Notas   : GENERA HISTORICO DE REMESAS SOBRE REMESAS AGOTADAS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   =iaud('INGRESO '+ulpr)
   =movewin(10,10,15,69,'win'," Archivando en el Hist¢rico de Remesas ")
   @ 1,3 say "Archivando en el Hist¢rico de Remesas la Mercader¡a"
   @ 2,3 say "de las Remesas agotadas y borradas l¢gicamente.    "
   if confirma(" Archivar en el Hist¢rico",.t.,20,0)
      SET DELE OFF
      sele rem
      COPY TO TMPREM FOR deleted()
      use
      acti scre
      DO ophre
      SELE hre
      =FLOCK('HRE') .OR. flok("hre")
      APPE FROM TMPREM
      UNLO IN hre
      USE
      DELE FILE TMPREM.DBF
      DO oprem
      SELE rem
      =FLOCK('REM') .OR. flok("rem")
*     PACK
      UNLO IN rem
      SET DELE ON
   endif
   =RELEWIN('win')
ELSE
   =iaudi()
ENDIF
=men_lin(botom)
RETURN
