* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : QWPRP.PRG            บ
* บ COMENTARIO    :                      บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 11-15-93                บ
* บ HORA       : 07:24:46pm              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
PARAMETER TROFIL
PRIVATE TROFIL
SALIDA='.F.'
DO CASE
CASE TROFIL=1
	SALIDA='.t.'
	TT='Todos los Propietarios'
CASE TROFIL=2
	=OPCIU()
	stor nul TO respuesta
	IF !EMPTY(eliciu(" a Listar",-1,1))
		SALIDA='PER.localidad='+ALLTRIM(STR(MIX.NU1))
		TT='Por Localidad:'+ALLTRIM(mix.texto1)
	ELSE
		STORE '.F.' TO SALIDA
	ENDIF
CASE TROFIL=3
	stor nul TO respuesta
	IF !EMPTY(eliiva(" a Listar",-1,1))
		xcos=respuesta
		SALIDA='PER.condiva='+ALLTRIM(STR(RESPUESTA))
		TT='Por Condiciขn de I.V.A.:'+ALLTRIM(xaciva[respuesta,1])
	ELSE
		STORE '.F.' TO SALIDA
	ENDIF
CASE TROFIL=4
	do opprp
	stor nul TO respuesta
	IF !EMPTY(ELIPRP(" a Corregir",-1,1))
		tt='Propietario:'+alltrim(PER.CLIENTE)
		salida='PER.CODCLI="'+PER.CODCLI+'"'
	else
		store '.F.' to salida
	ENDIF
OTHERWISE
	STORE '.T.' TO SALIDA
ENDCASE
=MEN_LIN(BOTOM)
RETURN SALIDA
