********************************************************************************
*-- Programa: QWMED.PRG
*-- Fecha   : 05-04-92 03:19pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE FISC PARA MEDICOS
********************************************************************************
PARAMETER TROFIL
PRIVATE TROFIL
SALIDA='.F.'
DO CASE
CASE TROFIL=1
   SALIDA='.t.'
   TT='Todos los M‚dicos'
CASE TROFIL=2
   DO OPSAN
   stor nul TO respuesta
   IF !EMPTY(ELISAN(" a Listar",-1,1))
      SALIDA='MED.SANATORIO="'+MI2.TEXTO1+'"'
      TT='Por Sanatorio:'+ALLTRIM(mi2.texto2)
	 ELSE
	STORE '.F.' TO SALIDA
   ENDIF
CASE TROFIL=3
	=OPCIU()
   stor nul TO respuesta
   IF !EMPTY(eliciu(" a Listar",-1,1))
      SALIDA='med.localidad='+ALLTRIM(STR(MIX.NU1))
      TT='Por Localidad:'+ALLTRIM(mix.texto1)
	 ELSE
	STORE '.F.' TO SALIDA
   ENDIF
CASE TROFIL=4
   DO OPESP
   stor nul TO respuesta
   IF !EMPTY(ELIESP(" a Listar",-1,1))
      SALIDA='MED.ESPECIALI="'+LEFT(MIX.TEXTO2,2)+'"'
      TT='Por Especialidad:'+ALLTRIM(miX.texto1)
	 ELSE
	STORE '.F.' TO SALIDA
   ENDIF
CASE TROFIL=5
  STOR NUL TO RESPUESTA
  IF ELIMED("a Listar",-1,1)
     SALIDA='MED.CODMED="'+MED.CODMED+'"'
     TT='M‚dico '+alltrim(med.apellido)+' '+alltrim(proper(med.nombre))
  ELSE
     STORE ".F." TO SALIDA
  ENDIF
ENDCASE
=MEN_LIN(BOTOM)
RETURN SALIDA
