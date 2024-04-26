* ÚÄ FUNCION  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    ARCHIVO: ESOPEN.PRG         ³
* ³       AUTOR: G. REINER         ³
* ³ Date created: 01-21-93         ³
* ³ Time created: 03:27:08pm       ³
* ³    Copyright: 1993 GOYO REINER ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION ESOPEN
PARAMETER O_TEXTO,O_AREA,O_ALIAS
#DEFINE ABA    "Abriendo Base de "               && ABA
	IF !EMPTY(O_TEXTO)
		=men_lin(ABA+O_TEXTO)
	ENDIF
	SELE (O_AREA)
RETURN ALIAS()#O_ALIAS
