* 旼 FUNCION  컴컴컴컴컴컴컴컴컴컴커
* �    ARCHIVO: ESOPEN.PRG         �
* �       AUTOR: G. REINER         �
* � Date created: 01-21-93         �
* � Time created: 03:27:08pm       �
* �    Copyright: 1993 GOYO REINER �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION ESOPEN
PARAMETER O_TEXTO,O_AREA,O_ALIAS
#DEFINE ABA    "Abriendo Base de "               && ABA
	IF !EMPTY(O_TEXTO)
		=men_lin(ABA+O_TEXTO)
	ENDIF
	SELE (O_AREA)
RETURN ALIAS()#O_ALIAS
