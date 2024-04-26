********************************************************************************
*-- Programa: QWVIA.PRG
*-- Fecha   : 05-21-92 12:05pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE FISC PARA VIAJANTES
********************************************************************************
PARAMETER TROFIL
PRIVATE TROFIL
SALIDA='.F.'
DO CASE
CASE TROFIL=1
   SALIDA='.t.'
   TT='Todos los Viajantes'
CASE TROFIL=2
	=OPCIU()
   stor nul TO respuesta
   IF !EMPTY(eliciu(" a Listar",-1,1))
      SALIDA='VIA.local='+ALLTRIM(STR(MIX.NU1))
      TT='Por Localidad:'+ALLTRIM(mix.texto1)
	 ELSE
   STORE '.F.' TO SALIDA
   ENDIF
CASE TROFIL=3
   stor nul TO respuesta
   IF !EMPTY(eliiva(" a Listar",-1,1))
      xcos=respuesta
      SALIDA='VIA.condiva='+ALLTRIM(STR(RESPUESTA))
      TT='Por Condici¢n de I.V.A.:'+ALLTRIM(xaciva[respuesta,1])
   ELSE
      STORE '.F.' TO SALIDA
   ENDIF
CASE TROFIL=7
   SALIDA='VIA.bloqueo'
   TT='Viajantees Bloqueados'
case trofil=8
=OPVIA()
stor nul TO respuesta
IF !EMPTY(eliVIA(" a Corregir",-1,1))
	 tt='VIAJANTE:'+alltrim(VIA.Viajante)
   salida='VIA.codVIA="'+VIA.codVIA+'"'
else
   store '.f.' to salida
ENDIF
OTHERWISE
STORE '.T.' TO SALIDA
ENDCASE
=MEN_LIN(BOTOM)
RETURN SALIDA
