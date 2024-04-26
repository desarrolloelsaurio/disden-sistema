*****************************
*-- Programa: INFEC.PRG
*****************************
FUNCTION INFEC
	PARAMETER VENTAN,MSG
	IF TYPE("VENTAN")#"C" .OR. VENTAN="?"
		CLEA
		TEXT
ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
ฦอ> Funciขn : INFEC.PRG                                       ณ
ฦอ> Fecha   : 26/09/89                                        ณ
ฦอ> Version : G. REINER                                       ณ
ฦอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออต
ฦอ> Uso     : =INFEC(NOMBREVENTANA,MENSAJE)                   ณ
ณ             NOMBREVENTANA ES EL NOMBRE DE LA VENTANA DENTRO ณ
ณ                           DE LA QUE APARECERA LA PREGUNTA   ณ
ณ             MENSAJE ES EL TEXTO QUE PREGUNTARA EL GET       ณ
ฦอ> Salida  : FECHA                                           ณ
ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
		ENDT
		FEHCA=DATE()
	ELSE
		VENTAN=IIF(EMPTY(PARAMETER()),'WIN',VENTAN)
		MSG=IIF(PARAMETER()<2,'',MSG)
		=MOVEWIN(10,20,14,55,(VENTAN),' Ingrese Fecha '+msg)
		@ 1,2 SAY "FECHA " GET FEHCA ;
		DEFA DATE() ;
		mess 'Fecha '+msg
		READ
		=RELEWIN()
	ENDIF
   FEHCA=IIF(LAST()=27,{},FEHCA)
RETURN FEHCA
