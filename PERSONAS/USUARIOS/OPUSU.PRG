****************************************
*-- PROGRAMA: OPUSU.PRG
*-- FECHA   : 06/12/91 01:50PM
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO USUARIOS
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("PER")
	SELE PER
	SET ORDER TO TAG USUARIO
ELSE
	=MEN_LIN(ABA+'Usuarios')
	SELE 21
	USE (PATHPRO+'\PERSONAS') ORDER TAG USUARIO ALIAS PER
ENDIF
IF USUPOP
	=DEFPOPER(USUPOPR,USUPOPC)
ENDIF
=MEN_LIN(BOTOM)
RETURN
