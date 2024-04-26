********************************************************************************
*-- Programa: OPMER.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MERCADERIAS
********************************************************************************
=MEN_LIN('Abriendo archivo de Mercaderías')
IF !USED("MER")
     =GETDBF("MERCA","ARTICULO","MER",PRXAREA(.T.))
ELSE
   SELE MER     
ENDIF
IF merpop
   DEFI POPU merpop FROM merpopr,merpopc PROM FIELD mer.merca MESS ' Elija la Mercader¡a ' SHAD COLOR SCHE 3 IN SCREEN
   ON SELE POPU merpop DO resp1
ELSE
   RELE POPU merpop
ENDIF
RETURN MEN_LIN(BOTOM)
