****************************************
*-- Programa: ABREV.PRG
*-- Fecha   : 05-31-92 02:26pm
*-- Version : G. REINER
*-- Notas   : ABREVIATURA
****************************************
FUNCTION ABREV
	PARAMETER PALABRA,SINPUNTO,CONESPAC,ELLARG
	IF TYPE('PALABRA')#'C' .OR. PALABRA='?'
		ABREV=''
		CLEA
		TEXT
			************************************************************
			* FUNCION ABREV.PRG                                        *
			* AUTOR: G. REINER                                         *
			* FECHA: 31/MAY/1992                                       *
			************************************************************
			* DEVUELVE ABREVIATURA                                     *
			************************************************************
			* USO  : ABREV (EXPRC1 [,EXPRL1 [,EXPRL2] ,[EXPRN1]] )     *
			*        EXPRC1= EXPRESION CARACTER A ABREVIAR             *
			*        EXPRL1= EXPRESION LOGICA (NO SEPARA CON PUNTOS)   *
			*                DEFAULT .F. (O SEA, SEPARA)               *
			*        EXPRL2= EXPRESION LOGICA (ESPACIOS ENTRE LETRAS)  *
			*                DEFAULT .F. (O SEA, NO PONE)              *
			*        EXPRN1= EXPRESION NUMERICA (LARGO DE LA SALIDA )  *
			*                DEFAULT LO QUE DIOS MANDE                 *
			*                MODIFICACION DEL 10 DE DICIEMBRE          *
			*                SALUDOS A ALFONSIN                        *
			************************************************************
		ENDTEXT
	ELSE
		PRIVATE PALABRA,ABREV
		PALABRA=ALLTRIM(PALABRA)+' #'
		ABREV=''
		DO WHILE PALABRA#"#"
			ABREV=abrev+LEFT(PALABRA,1)+IIF(SINPUNTO,'','.')+IIF(CONESPAC,' ','')
			PALABRA=SUBSTR(PALABRA,AT(' ',PALABRA)+1)
		ENDDO
		IF TYPE("ELLARG")="N"
			abrev=PADR(upper(abrev),ELLARG)
		ELSE
			abrev=upper(abrev)
		ENDIF
	ENDIF
RETURN ABREV
