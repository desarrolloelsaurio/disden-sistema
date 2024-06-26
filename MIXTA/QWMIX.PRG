****************************************
*-- Programa: QWMIX
*-- Fecha   : 05-04-92 03:19pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE FISC PARA MIXTA
* 1.Todas las ?
* 2.Una ?
* 3.Todas Menos Una ?
* 4.Algunas ?
****************************************
FUNCTION QWMIX
PARAMETER Q_TROF,QW_CAMPO,QW_TITULO,QW_INDICE,QW_POPUP,QW_TEX
PRIVATE Q_TROF
CIU_Q_SAL=Q_TROF
=OPCIU()
Q_SAL='.F.'
DO CASE
CASE Q_TROF=1
	Q_SAL='.T.'+CHR(250)+QW_TITULO
CASE Q_TROF=2
	=QWMIXX("=",":")
CASE Q_TROF=3
	=QWMIXX("#"," NO ")
CASE Q_TROF=4
	STORE "" TO SAX,TIX
	DO WHILE .T.
		=QWMIXX("=",":")
		IF Q_SAL=".F."
			EXIT
		ELSE
			SAX=QW_FISCO(SAX,QW_CAMPO+'="'+LEFT(MIX.TEXTO2,2)+'"')
			TIX=TIX+IIF(EMPTY(TIX),"","-")+ALLTRIM(MIX.TEXTO1)
		ENDIF
	ENDDO
	Q_SAL=IIF(EMPTY(SAX),".F.","("+SAX+")"+CHR(250)+TIX)
CASE Q_TROF=5
	=QWCIU2("=",":")
CASE Q_TROF=6
	=QWCIU2("#"," NO ")
CASE Q_TROF=7
	STORE "" TO SAX,TIX
	DO WHILE .T.
		=QWCIU2("=",":")
		IF Q_SAL=".F."
			EXIT
		ELSE
			SAX=QW_FISCO(SAX,'LAMIX(RIGHT(MIX.TEXTO2,2),"'+QW_INDICE+'")="'+LEFT(MIX.TEXTO2,2)+'"')
			TIX=TIX+IIF(EMPTY(TIX),"","-")+ALLTRIM(MIX.TEXTO1)
		ENDIF
	ENDDO
	Q_SAL=IIF(EMPTY(SAX),".F.","("+SAX+")"+CHR(250)+TIX)
OTHERWISE
	STORE ".F." TO Q_SAL
ENDCASE
=MEN_LIN(BOTOM)
RETURN Q_SAL

FUNCTION QWMIXX
	PARAMETER QW_SIGNO,QW_TEXTO
	STOR NUL TO RESPUESTA
	IF EVAL(QW_POPUP)
		Q_SAL=QW_CAMPO+QW_SIGNO+;
		IIF(QW_TEX,'"'+LEFT(MIX.TEXTO2,2)+'"',ALLTRIM(STR(MIX.NU1)))+;
		CHR(250)+QW_TITULO+QW_TEXTO+ALLTRIM(MIX.TEXTO1)
	ELSE
		STORE '.F.' TO Q_SAL
	ENDIF
RETURN Q_SAL
