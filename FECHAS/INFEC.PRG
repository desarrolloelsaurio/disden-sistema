*****************************
*-- Programa: INFEC.PRG
*****************************
FUNCTION INFEC
	PARAMETER VENTAN,MSG
	IF TYPE("VENTAN")#"C" .OR. VENTAN="?"
		CLEA
		TEXT
旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
팠> Funci줻 : INFEC.PRG                                       �
팠> Fecha   : 26/09/89                                        �
팠> Version : G. REINER                                       �
팠袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
팠> Uso     : =INFEC(NOMBREVENTANA,MENSAJE)                   �
�             NOMBREVENTANA ES EL NOMBRE DE LA VENTANA DENTRO �
�                           DE LA QUE APARECERA LA PREGUNTA   �
�             MENSAJE ES EL TEXTO QUE PREGUNTARA EL GET       �
팠> Salida  : FECHA                                           �
읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
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
