********************************************************************************
*-- Programa: QWTEM
*-- Fecha   : 05-04-92 03:19pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE FISC PARA CONDICIONES DE TEM
* 1.Todas las Condiciones
* 2.Una Condicion
* 3.Todas Menos Una Condicion
* 4.Algunas Condiciones
********************************************************************************
PARAMETER TROFIL,QW_CAMPO
SALIDA='.F.'
DO CASE
CASE TROFIL=1
	SALIDA='.T.'+CHR(250)+'Todas las Temporadas'
CASE TROFIL=2
	=QWTEM1("=",":")
CASE TROFIL=3
	=QWTEM1("#"," NO ")
CASE TROFIL=4
	STORE "" TO SAX,TIX
	DO WHILE .T.
		=QWTEM1("=",":")
		IF SALIDA=".F."
			EXIT
		ELSE
			SAX=qw_fisco(SAX,QW_CAMPO+'='+LEFT(ALLTRIM(QTEM(respuesta)),1))
			TIX=TIX+IIF(EMPTY(TIX),"","-")+QTEM(RESPUESTA)
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
FUNCTION QWTEM1
	PARAMETER QW_SIGNO,QW_TEXTO
	stor nul TO respuesta
	IF !EMPTY(eliTEM(" a Listar",-1,1))
	    respuesta=qtem(respuesta)
		SALIDA=QW_CAMPO+QW_SIGNO+"'"+left(respuesta,1)+"'"+chr(250)+'Temporada'+QW_TEXTO+alltrim(respuesta)
	ELSE
		STORE '.F.' TO SALIDA
	ENDIF
RETURN SALIDA
