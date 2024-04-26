****************************************
*-- PROGRAMA: OPCLJ.PRG
*-- FECHA   : 06/12/91 01:50PM
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO DE CAJAS DE SEGURIDAD
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
PARAMETER EXCLUS,REOPEN
IF USED("CJJ")
   IF EXCLUS 
      USE IN CJJ
      =HOPCJJ(.T.)
   ELSE
      IF REOPEN
         =REOPXXX("CJJ")
         =HOPCJJ()
      ELSE
         SELE CJJ
         SET ORDER TO TAG NUMERO
      ENDIF
   ENDIF
ELSE
   =MEN_LIN(ABA+'Cajas')
   =PRXAREA(.T.)
   =HOPCJJ()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION HOPCJJ
PARAMETER EX
=MEN_LIN(ABA+'Cajas')
=PRXAREA(.T.)
RETURN GETDBF("Cajas","NUMERO","CJJ",.F.,EX)
