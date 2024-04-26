********************************************************************************
*-- Programa: QWGAR.PRG
*-- Fecha   : 11-23-92 07:53pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE QUERY DE GARANTIAS
*-- Modificaci¢n GOYO 12-03-92 04:45pm (RoSARIO COMUN y P H)
********************************************************************************
FUNCTION QWGAR
	PARAMETER TROFIL
	PRIVATE TROFIL,QW_SALIDA
	STORE ".F." TO QW_SALIDA
	DO CASE
	CASE TROFIL=1
		QW_SALIDA='.T.'
		ttu='Todos los Garantes'
	CASE TROFIL=2
		STOR NUL TO respuesta
		IF !EMPTY(eliciu(" a Listar",-1,1))
			QW_SALIDA="localidad="+ALLTRIM(STR(MIX.NU1))
			ttu='Por Localidad:'+ALLTRIM(mix.texto1)
		ENDIF
	CASE TROFIL=3
		STOR NUL TO respuesta
		IF !EMPTY(eliprv(" a Listar",-1,1))
			QW_SALIDA='RIGHT(MIX.TEXTO2,2)="'+LEFT(MIX.TEXTO2,2)+'"'
			ttu='Por Provincia:'+ALLTRIM(mix.texto1)
		ENDIF
	CASE TROFIL=4
		STORE "Tipo: PROPIEDAD HORIZONTAL" to m.ttu
		STORE "PER.TIPOTOMO='PH'" to m.qw_salida
	CASE TROFIL=5
		STORE "Tipo: ROSARIO COMUN" to m.ttu
		STORE "PER.TIPOTOMO='RC'" to m.qw_salida
	CASE TROFIL=6
		STOR m.nul to m.respuesta
		IF ELIGAR("",-1,1)
			QW_SALIDA='PER.CODCLI="'+PER.CODCLI+'"'
			ttu='Garante '+alltrim(PER.CLIENTE)+' - '+alltrim(PER.CODCLI)
		ENDIF
	ENDCASE
RETURN QW_SALIDA
