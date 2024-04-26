********************************************************************************
*-- Programa: bmer.prg
*-- Fecha   : 11-02-91 12:22pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE borrado de mercader¡as
*-- Modificaci¢n GOYO 07-23-92 01:11am marca . empresa
********************************************************************************
ACTI SCRE
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
SELE MER
   =DOTALK()
   INDE ON ARTICULO TO (GENTMP()) FOR eval(fisc) comp
   =flock("mer") .or. flok('mer')
   DELE ALL
   UNLO ALL
   =REOPMER()
   =UNTALK()
=IAUD(FISC)
ELSE
=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
