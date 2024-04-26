********************************************************************************
*-- Programa: QWMER
*-- Fecha   : 05-11-92 02:58pm
*-- Version : ELINA
*-- Notas   : GENERA QUERY DE MERCADERIAS
*--           VERSION ARGENTA
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
********************************************************************************
PARAMETER TROFIL
PRIVATE TROFIL,SALIDA
DO CASE
CASE TROFIL=1
   SALIDA='.t.'
CASE TROFIL=2
   stor nul TO respuesta
   IF !EMPTY(elirub(" a Listar",-1,1))
      SALIDA='mer->rubro='+ALLTRIM(STR(RUB.CODRUB))
      tt=tt+' - Por RUBRO '+ALLTRIM(rub->rubro)
   ELSE
      SALIDA='.F.'
   ENDIF
CASE TROFIL=3
   stor SPACE(20) TO respuesta
   stor nul TO respuesta
   IF !EMPTY(elivar(" a Listar",-1,1))
      xcos=left(texto2,2)
      SALIDA='MER->variedad="'+LEFT(MIX.TEXTO2,2)+'"'
      tt=tt+' - Por VARIEDAD '+ALLTRIM(MIX.TEXTO1)
   ELSE
      SALIDA='.F.'
   ENDIF
CASE TROFIL=4
   stor nul TO respuesta
   IF !EMPTY(elical(" a Listar",-1,1))
      SALIDA='MER->calidad="'+LEFT(MI1.TEXTO2,2)+'"'
      tt=tt+' - Por CALIDAD '+ALLTRIM(MI1->TEXTO1)
   ELSE
      SALIDA='.F.'
   ENDIF
ENDCASE
=MEN_LIN(BOTOM)
RETURN SALIDA
