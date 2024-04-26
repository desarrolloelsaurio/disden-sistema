********************************************************************************
*-- Programa: ELIMER.PRG
*-- Fecha   : 05/26/91 09:26am
*-- Version : G. REINER -
*-- Notas   : ELIGE MERCADERIA
********************************************************************************
FUNCTION elimer
PARA msg,r1,c1
priv msg,r1,c1,ventant
RETURN SEEKTECX(LEN(MER.MERCA),"MER","MER.MERCA","MER.ARTICULO","MERCA","MER",.F.,10,10,.T.,.t.)

SELE mer
IF merpop 
	**** OJO SQL ****
	SELECT ALL ARTICULO,MERCA FROM MER INTO CURSOR NADAS ORDER BY MERCA
	do elimerca.PRG
	SELE MER
	=SEEK(NADAS.ARTICULO)
	USE IN NADAS
	respuesta=(last()#27)
ELSE
	SET ORDER TO TAG ARTICULO
	LARGOR=10
	IF r1=-1
		DO infic1 WITH 'INGRESE ARTICULO DE PRODUCTO '+msg,LARGOR
	ELSE
		STORE SPACE(6) TO respuesta
		@ r1,c1 GET respuesta PICTURE REPL('9',LARGOR)
		READ
	ENDIF
	IF EMPTY(respuesta) .OR. LASTKEY()=27
      		STOR .F. TO respuesta
	ELSE
		SET ORDER TO TAG ARTICULO
		IF SSTM1="DIS-DEN"
			M.RESPUESTA=ZERO(M.RESPUESTA,10)
		ENDIF
		RESPUESTA=(SEEK(respuesta))
	ENDIF
ENDIF
RETURN respuesta
