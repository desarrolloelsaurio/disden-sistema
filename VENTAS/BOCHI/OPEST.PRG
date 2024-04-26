********************************************************************************
*-- Programa: OPEST.PRG
*-- Notas   : ABRE ARCHIVO MERC ESTUDIANTES
********************************************************************************
=MEN_LIN('Abriendo archivo de Estudiantes')
IF !USED("EST")
     =GETDBF("ESTUD","DENOM","EST",PRXAREA(.T.))
ELSE
   SELE EST
ENDIF
RETURN MEN_LIN(BOTOM)
