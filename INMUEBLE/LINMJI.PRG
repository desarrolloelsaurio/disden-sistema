* 浜様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LINMJI.PRG           �
* 麺様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER             �
* � FECHA      : 10-31-93                �
* � HORA       : 01:39:15pm              �
* � COPYRIGHT  : 1993 by GREGORIO REINER �
* 藩様様様様様様様様様様様様様様様様様様夕
#DEFINE LINEA REPL("-",80)                       && LINEA
#DEFINE BOTOM "  "+repl("�",78)                  && BOTOM
FF=RECNO()
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	LARGOIM=80
	ACLA=SPACE(80)
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	IF !EMPTY(INM.LEGAJO)
		_PAGENO=1
		PRX=64
		DO CABPRI1
		? "COD.INMUEBLE : "
		?? INM.CODINM
		? "DOMICILIO    : "
		?? INM.DOMICILIO
		? "LOCALIDAD    : "
		?? SAYMIX(INM.LOCALIDAD,'CIUCOD')
		? "PROPIETARIO  : "
		?? SAYPER(INM.PROCOD,'PRPCOD')
		?
		?
		? REPL("-",80)
		ON PAGE AT LINE 69 DO pgh1
		? INM.LEGAJO
		? REPL("-",80)
		ON PAGE
		EJECT PAGE
	ENDIF
	?
	ENDP
	ON PAGE
	=FINIMP()
	=IAUD(ALLTRIM(INM.CODINM)+"-"+INM.DOMICILIO)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
