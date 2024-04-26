*******************************************
*-- Programa: QWPER.PRG
*-- Fecha   : 05-04-92 03:19pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE FISC PARA CLIENTES
*******************************************
PARAMETER TROFIL,OTRAVAR
PRIVATE TROFIL
#DEFINE NUL    0                                 && NUL
SALIDA='.F.'
DO CASE
CASE TROFIL=1
	SALIDA='.T.'
	TT='Todos los Consorcistas'
CASE TROFIL=2
	SALIDA=QWCIU(CIUGRL(" Ciudad a Listar "),"PER.localidad")
	IF SALIDA#".F."
		QW=AT(CHR(250),SALIDA)
		SALIDA=left(SALIDA,qw-1)
		TT=SUBSTR(SALIDA,QW+1)
	ENDIF
CASE TROFIL=3
	DO OPCNX
	DO OPCNS
	STOR NUL TO RESPUESTA
	IF !EMPTY(eliCNS(" a Listar",-1,1))
		SALIDA='CNX.CONCOD="'+CNS.CONCOD+'"'
		TT='Consorcio:'+ALLTRIM(cns.consorcio)
	ELSE
		STORE '.F.' TO SALIDA
	ENDIF
CASE TROFIL=4
	DO OPCSS
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELICSS("a Listar",-1,1))
		SALIDA='CCL.CODCLI="'+PER.CODCLI+'"'
		TT='Consorcista:'+ALLTRIM(per.cliente)+" ("+alltrim(per.codcli)+")"
	ELSE
		STORE '.F.' TO SALIDA
	ENDIF
OTHERWISE
	STORE '.T.' TO SALIDA
ENDCASE
=MEN_LIN(BOTOM)
RETURN SALIDA
