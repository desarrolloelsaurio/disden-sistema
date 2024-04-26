*******************************************
*-- Programa: ELIPRC.PRG
*-- Fecha   : 05/26/91 09:26am
*-- Version : G. REINER -
*-- Notas   : ELIGE PROCESOS DE FABRICACION
*******************************************
FUNCTION eliprc
	PARA msg,r1,c1
	STORE SPACE(10) TO M.RESPUESTA
	SELE prc
	IF prcpop
		SET ORDER TO TAG PROCFAB
		IF EOF()
			GO TOP
		ENDIF
		ACTI POPUP prcpop REST
		STOR !empty(respuesta) TO respuesta
	ELSE
		IF r1=-1
			DO infic1 WITH 'Ingrese C¢digo de Proceso '+msg,10
		ELSE
			@ r1,c1 GET respuesta PICTURE '!!!!!!!!!!'
			READ
		ENDIF
		RESPUESTA=XSEEK(M.RESPUESTA,"PRC","PRCCOD") .or. ;
		XSEEK(ajcodper(M.RESPUESTA,5,""),"PRC","PRCCOD") 
	ENDIF
RETURN respuesta
