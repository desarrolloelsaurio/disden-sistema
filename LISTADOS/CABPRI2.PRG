*********************************
*-- Programa: CABPRI2
*-- Fecha   : 09/26/91 12:57pm
*-- Version : G. REINER
*-- Notas   : IMPRIME CABECERAS
*********************************
FUNCTION CABPRI2
	??? CHR(18)
	? 'PROGRAMA :'
	?? ALLTRIM(ulpr)
	?? SPACE(50-LEN(ULPR))
	??'Usuario  :'
	?? USADOR
	? '          '
	?? SPACE(21)
	?? '          '
	?? SPACE(19)
	?? 'P g N§   :'
	?? STR(_PAGENO,5)
	?
	IF LARGO>LARGOIM
		_RMARGIN=IIF(largoim>80,233,132)
		??? CHR(15)
	ENDIF
RETURN .T.
