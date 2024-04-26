**************************************
*-- Programa: PAGEHEAD.PRG
*-- Fecha   : 29/9/89
*-- Version : G. REINER
*-- Notas   : CABECERA DE IMPRESION
**************************************
PROCEDURE PAGEHEAD
	? chr(14)                                        && ENSANCHA CARACTER
	??? CHR(27)                                      && CONTROL
	??? "~11"                                        && DOBLE ALTO
	??? CHR(27)                                      && CONTROL
	??? "~21"                                        && INVERSO
	?? "  DIS-DEN ODONTOLOGIA  "
	? chr(27)                                        && CONTROL
	??? "~10"                                        && ALTO SIMPLE
	?? " Importador Oficial para la Rep Argentina de: "
	? CHR(15)
	?? " UNIFLEX CC.CORD - BAYER - 3M - KERR SYBRON - AGFA GEVAERT - DEDECO - FAVODENT"
	? CHR(15)
	?? "       PREMIER DENTAL - MILES Inc. - BECHT - SDI - EDENTA - NOBIL METAL       "
	? chr(18)
	?? "Tel:041-384433 041-381836/ /FAX:(54)(41)381836"
	? "     Santa Fe 3135         (2000) ROSARIO     "
	? "             REPUBLICA  ARGENTINA             "
RETURN
