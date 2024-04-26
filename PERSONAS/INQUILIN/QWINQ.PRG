********************************************************************************
*-- Programa: QWINQ.PRG
*-- Fecha   : 11-23-92 03:40pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE QUERY DE INQUILINOS
********************************************************************************
FUNCTION QWINQ
PARAMETER TROFIL
PRIVATE TROFIL,QW_SALIDA
STORE ".F." TO QW_SALIDA
DO CASE
CASE TROFIL=1
	QW_SALIDA='.T.'
	ttu='Todos los Inquilinos'
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
	STOR NUL TO respuesta
	IF !EMPTY(eliiva(" a Listar",-1,1))
		QW_SALIDA='condiva='+alltrim(str(m.respuesta))
		ttu='Por Condici¢n de I.V.A.:'+ALLTRIM(xaciva[respuesta,1])
	ENDIF
CASE TROFIL=5
   STOR m.nul to m.respuesta
   IF ELIINQ("",-1,1)
		QW_SALIDA='PER.codcli="'+PER.codcli+'"'
		ttu='Inquilino '+alltrim(PER.cliente)+' - '+alltrim(PER.codcli)
   ENDIF
ENDCASE
RETURN QW_SALIDA
