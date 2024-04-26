********************************************************************************
*-- Programa: QWSRU
*-- Fecha   : 05-04-92 03:19pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE FISC PARA CLIENTES
* 1.Todos los Subrubros;;
* 2.Un Ciudad;;
* 3.Todas Menos Un Ciudad;;
* 4.AlgUns Subrubros;;
********************************************************************************
PARAMETER TROFIL,QW_CAMPO
PRIVATE TROFIL
SRU_SALIDA=TROFIL
DO OPSRU
SALIDA='.F.'
DO CASE
CASE TROFIL=1
	SALIDA='.T.'+CHR(250)+'Todos los Subrubros'
CASE TROFIL=2
	=QWSRU1("=",":")
CASE TROFIL=3
	=QWSRU1("#"," NO ")
CASE TROFIL=4
	STORE "" TO SAX,TIX
	DO WHILE .T.
		=QWSRU1("=",":")
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
OTHERWISE
	STORE ".F." TO SALIDA
ENDCASE
=MEN_LIN(BOTOM)
RETURN SALIDA

FUNCTION QWSRU1
	PARAMETER QW_SIGNO,QW_TEXTO
	stor nul TO respuesta
	IF !EMPTY(eliSRU(" a Listar",-1,1))
		SALIDA=QW_CAMPO+QW_SIGNO+ALLTRIM(STR(SRU.codSRU))+chr(250)+'Subrubro'+QW_TEXTO+ALLTRIM(rub.rubro)
	ELSE
		STORE '.F.' TO SALIDA
	ENDIF
RETURN SALIDA
