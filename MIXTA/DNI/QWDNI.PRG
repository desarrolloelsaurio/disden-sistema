********************************************************************************
*-- Programa: QWDNI
*-- Fecha   : 05-04-92 03:19pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE FISC PARA CONDICIONES DE DNI
* 1.Todas las Condiciones
* 2.Una Condicion
* 3.Todas Menos Una Condicion
* 4.Algunas Condiciones
********************************************************************************
PARAMETER TROFIL,QW_CAMPO
PRIVATE TROFIL
SALIDA='.F.'
DO CASE
CASE TROFIL=1
	SALIDA='.T.'+CHR(250)+'Todos los Documentos'
CASE TROFIL=2
	=QWDNI1("=",":")
CASE TROFIL=3
	=QWDNI1("#"," NO ")
CASE TROFIL=4
	STORE "" TO SAX,TIX
	DO WHILE .T.
		=QWDNI1("=",":")
		IF SALIDA=".F."
			EXIT
		ELSE
			SAX=qw_fisco(SAX,QW_CAMPO+'="'+left(mix.texto2,2)+'"')
			TIX=TIX+IIF(EMPTY(TIX),"","-")+ALLTRIM(MIX.TEXTO1)
		ENDIF
	ENDDO
	IF !EMPTY(SAX)
		SALIDA="("+SAX+")"+CHR(250)+TIX
	ELSE
		SALIDA=".F."
	ENDIF
OTHERWISE
	STORE ".F." TO SALIDA
ENDCASE
=MEN_LIN(BOTOM)
RETURN SALIDA

FUNCTION QWDNI1
	PARAMETER QW_SIGNO,QW_TEXTO
	stor nul TO respuesta
	IF !EMPTY(eliDNI(" a Listar",-1,1))
		SALIDA=QW_CAMPO+QW_SIGNO+STR(respuesta)+chr(250)+'Cond. I.V.A. '+QW_TEXTO+alltrim(mix.texto1)
	ELSE
		STORE '.F.' TO SALIDA
	ENDIF
RETURN SALIDA
