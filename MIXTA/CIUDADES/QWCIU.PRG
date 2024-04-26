********************************************************************************
*-- Programa: QWCIU
*-- Fecha   : 05-04-92 03:19pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE FISC PARA CLIENTES
* 1.Todas las Ciudades;;
* 2.Una Ciudad;;
* 3.Todas Menos Una Ciudad;;
* 4.Algunas Ciudades;;
* 5.Una Provincia;;
* 5.Todas Menos Una Provincia;;
* 7.Algunas Provincias"
********************************************************************************
PARAMETER TROFIL,QW_CAMPO
PRIVATE TROFIL
CIU_SALIDA=TROFIL
=OPCIU()
SALIDA='.F.'
DO CASE
CASE TROFIL=1
	SALIDA='.T.'+CHR(250)+'Todas las Ciudades'
CASE TROFIL=2
	=QWCIU1("=",":")
CASE TROFIL=3
	=QWCIU1("#"," NO ")
CASE TROFIL=4
	STORE "" TO SAX,TIX
	DO WHILE .T.
		=QWCIU1("=",":")
		IF SALIDA=".F."
			EXIT
		ELSE
			SAX=QW_FISCO(SAX,QW_CAMPO+'='+ALLTRIM(STR(MIX.NU1)))
			TIX=TIX+IIF(EMPTY(TIX),"","-")+ALLTRIM(MIX.TEXTO1)
		ENDIF
	ENDDO
	IF !EMPTY(SAX)
		SALIDA="("+SAX+")"+CHR(250)+TIX
	ELSE
		SALIDA=".F."
	ENDIF
CASE TROFIL=5
	=QWCIU2("=",":")
CASE TROFIL=6
	=QWCIU2("#"," NO ")
CASE TROFIL=7
	STORE "" TO SAX,TIX
	DO WHILE .T.
		=QWCIU2("=",":")
		IF SALIDA=".F."
			EXIT
		ELSE
			SAX=QW_FISCO(SAX,'LAPRV(RIGHT(MIX.TEXTO2,2),"PRVCOD")="'+LEFT(MIX.TEXTO2,2)+'"')
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

FUNCTION QWCIU1
	PARAMETER QW_SIGNO,QW_TEXTO
	stor nul TO respuesta
	IF !EMPTY(eliciu(" a Listar",-1,1))
		SALIDA=QW_CAMPO+QW_SIGNO+'"'+ALLTRIM(STR(MIX.NU1))+'"'+chr(250)+'Localidad'+QW_TEXTO+ALLTRIM(mix.texto1)
	ELSE
		STORE '.F.' TO SALIDA
	ENDIF
RETURN SALIDA

FUNCTION QWCIU2
	PARAMETER QW_SIGNO,QW_TEXTO
	stor nul TO respuesta
	IF !EMPTY(eliPRV(" a Listar",-1,1))
		SALIDA="LAMIX(RIGHT(MIX.TEXTO2,2),'PRVCOD')"+QW_SIGNO+'"'+LEFT(MIX.TEXTO2,2)+'"'+chr(250)+'Provincia'+QW_TEXTO+ALLTRIM(mix.texto1)
	ELSE
		STORE '.F.' TO SALIDA
	ENDIF
RETURN SALIDA
