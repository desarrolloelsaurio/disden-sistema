********************************************************************************
*-- Programa: QWTALS.PRG
*-- Fecha   : 09/12/91 12:34pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE TIPO DE LISTADO DE TALLERES
* 1. Todos los Talleres
* 2. Por Localidad
* 3. Por Condici¢n de I.V.A.
* 4. Un Taller
********************************************************************************
FUNCTION QWTALS
PARAMETER TROFIL
PRIVATE TROFIL,SALIDA
SALIDA='.F.'
DO CASE
CASE TROFIL=1
	 TT='Todos los Art¡culos'
    SALIDA='.T.'
CASE TROFIL=2
STORE space(20) TO RESPUESTA
   IF !empty(infic1("Ciudad a Listar",20))
      salida='"'+UPPER(alltrim(respuesta))+'" $ PER.localidad'
      TT='Por Ciudad:'+alltrim(respuesta)
   ELSE
      SALIDA=".F."
   ENDIF
CASE TROFIL=3
STORE NUL TO RESPUESTA
   IF !empty(ELIiva("a Listar",-1,1))
      salida='PER.CONDIVA='+ALLTRIM(STR(RESPUESTA))
      TT='Por Condici¢n de I.V.A.:'+alltrim(xaciva[respuesta,1])
   ELSE
      SALIDA=".F."
   ENDIF
CASE TROFIL=4
STORE NUL TO RESPUESTA
   IF !empty(ELIETA("a Listar",-1,1))
      salida='PER.ETAPA="'+LEFT(MIX.TEXTO2,2)+'"'
      TT='Por Etapa:'+alltrim(mix.texto1)
   ELSE
      SALIDA=".F."
   ENDIF
CASE TROFIL=5
STORE NUL TO RESPUESTA
   IF !empty(ELITALS("a Listar",-1,1))
      store codCLI to salida
   ELSE
      SALIDA=".F."
   ENDIF
ENDCASE
RETURN salida
