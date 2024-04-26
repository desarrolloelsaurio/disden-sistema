* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : QWRUB.PRG             บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 08-31-93                 บ
* บ HORA       : 08:13:34pm               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE NUL    0                                 && NUL

PARAMETER QW_TROFIL,qw_campo
PRIVATE QW_TROFIL
est_SALIDA=QW_TROFIL
SALIDA='.F.'
ttok=""
DO CASE
CASE QW_TROFIL=1
	SALIDA='.T.'+CHR(250)+'Todos los Conc. de Agrupaciขn'
CASE QW_TROFIL=2
	=QWRUB1("!EMPTY(AT(",":")
CASE QW_TROFIL=3
	=QWRUB1("EMPTY(AT("," NO ")
case QW_TROFIL=4
    STORE ".T." to SALIDA
	DO WHILE .T.
	   STORE NUL TO RESPUESTA
	   IF !EMPTY(ELIRUB('A LISTAR',-1,1))
		  SALIDA=QW_FISCO(SALIDA,"!EMPTY(AT('"+;
			LEFT(MIX.TEXTO2,3)+"',"+;
			CUAL+"))")
			TT=TT+ALLTRIM(MIX.TEXTO1)+' ข '
			ttok=ttok+alltrim(mix.texto1)+"/"
			=popcarte(ttok)
	   ELSE
		  EXIT
 	   ENDIF
	ENDDO
	IF SALIDA#".F."
		SALIDA="("+SALIDA+")"+CHR(250)+SINULT(TT,3)
	ENDIF
CASE QW_TROFIL=5
	store ".t." to salida
	DO WHILE .T.
	STORE NUL TO RESPUESTA
		IF !EMPTY(ELIRUB('A LISTAR',-1,1))
			SALIDA=QW_FISC(SALIDA,"!EMPTY(AT('"+;
			LEFT(MIX.TEXTO2,3)+"',"+;
			CUAL+"))")
			TT=TT+ALLTRIM(MIX.TEXTO1)+' Y '
			ttok=ttok+alltrim(mix.texto1)+"/"
			=popcarte(ttok)
		ELSE
			EXIT
		ENDIF
	ENDDO
	IF SALIDA#".F."
		SALIDA="("+SALIDA+")"+CHR(250)+SINULT(TT,3)
	ENDIF
ENDCASE
=RELEWIN("POPCARTE")
=MEN_LIN(BOTOM)
RETURN SALIDA

FUNCTION QWRUB1
	PARAMETER QW_SIGNO,QW_TEXTO
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIRUB('a Listar',-1,1))
		SALIDA=QW_SIGNO+"'"+;
		LEFT(MIX.TEXTO2,3)+;
		"',"+;
               QW_CAMPO+"))"+;
		CHR(250)+'Rubro:'+QW_TEXTO+ALLTRIM(MIX.TEXTO1)
	ELSE
		STORE '.F.' TO SALIDA
	ENDIF
RETURN SALIDA
