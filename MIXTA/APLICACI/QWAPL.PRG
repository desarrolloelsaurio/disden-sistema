* 浜様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : QWAPL.PRG                      �
* � COMENTARIO    : GENERA QUERY PARA Aplicaciones �
* 藩様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION QWAPL
	PARAMETER Q_TROF,QW_CAMPO

	#DEFINE NUL    0                               && NUL
	#DEFINE BOTOM  "  "+repl("�",78)               && BOTOM
	#DEFINE FOLC  ".F."                            && FOLC

	Q_SALIDA=FOLC
	STORE Q_TROF TO M.APL_SALIDA
	DO CASE
	CASE Q_TROF=1
		Q_SALIDA=".T."+CHR(250)+"Todas las Aplicaciones"
	CASE Q_TROF=2
		=QWAPL1("=",":")
	CASE Q_TROF=3
		=QWAPL1("#"," NO ")
	case Q_TROF=4
		DO WHILE .T.
			STORE NUL TO RESPUESTA
			IF !EMPTY(ELIAPL("a Listar",REN,COL))
				Q_SALIDA=QW_FISCO(Q_SALIDA,CUAL+'="'+LEFT(MIX.TEXTO2,2)+'"')
				TT=TT+ALLTRIM(MIX.TEXTO1)+"/"
			ELSE
				EXIT
			ENDIF
		ENDDO
		IF Q_SALIDA#FOLC
			Q_SALIDA="("+Q_SALIDA+")"+CHR(250)+SINULT(TT)
		ENDIF
	ENDCASE
	=MEN_LIN(BOTOM)
RETURN Q_SALIDA

FUNCTION QWAPL1
	PARAMETER QW_SIGNO,QW_TEXTO
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIAPL("a Listar",REN,COL))
		Q_SALIDA=QW_CAMPO+QW_SIGNO+'"'+left(mix.texto2,2)+'"'+chr(250)+'Aplicaci�n'+QW_TEXTO+ALLTRIM(mix.texto1)
	ELSE
		STORE FOLC TO Q_SALIDA
	ENDIF
RETURN Q_SALIDA
