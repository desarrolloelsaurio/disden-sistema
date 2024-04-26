********************************************************************************
*-- Programa: QWRUB
*-- Fecha   : 05-04-92 03:19pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE FISC PARA CLIENTES
* 1.Todos los Rubros;;
* 2.Un Ciudad;;
* 3.Todas Menos Un Ciudad;;
* 4.AlgUns Rubros;;
********************************************************************************
PARAMETER TROFIL,QW_CAMPO
PRIVATE TROFIL
RUB_SALIDA=TROFIL
=OPRUB()
SALIDA='.F.'
DO CASE
CASE TROFIL=1
	SALIDA='.T.'+CHR(250)+'Todos los Rubros'
CASE TROFIL=2
	=QWRUB1("=",":")
CASE TROFIL=3
	=QWRUB1("#"," NO ")
CASE TROFIL=4
	STORE "" TO SAX,TIX
	DO WHILE .T.
		=QWRUB1("=",":")
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
FUNCTION QWRUB1
	PARAMETER QW_SIGNO,QW_TEXTO
	stor nul TO respuesta
	IF !EMPTY(eliRUB(" a Listar",-1,1))
		SALIDA=QW_CAMPO+QW_SIGNO+ALLTRIM(STR(rub.codrub))+chr(250)+'Rubro'+QW_TEXTO+ALLTRIM(rub.rubro)
	ELSE
		STORE '.F.' TO SALIDA
	ENDIF
RETURN SALIDA
