* ÚÄ FUNCTION ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: CABPRI3                                                    ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-26-92                                                   ³
* ³ Time created: 12:40:42pm                                                 ³
* ³     Function: GENERA SETEOS DE IMPRESION PARA FORMULARIOS                ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
* VERSION RAFULS
FUNCTION cabpri3
	PARAMETERS copias,ELLARGO
	PRIVATE COPIAS,ELLARGO
	STORE (getenv("EQUIPO")="MICASA") TO ENASCII
	Xa=''
	IF TYPE("ENASCII")#"U" .AND. ENASCII
		XA=ENASCII()
	ENDIF
	IF GETENV("USERNAME")#"GOYO" .AND. GETENV("USERNAME")#"BATA" .AND. GETENV("EQUIPO")#'MICASA'
		ON ERROR DO abpr
	ENDIF
	SET DEVICE TO PRINT
	SET CONSOLE OFF
	=QUEIMP()
	SET PRINTER ON
	IF !EMPTY(XA)
		SET PRINTER TO (XA)
	ENDIF
	_PEJECT="NONE"
	_PLENGTH=ELLARGO
	_PLINENO=NUL
	_PAGENO=1
	_PSCODE='{27}{64}{27}{67}{'+ALLTRIM(STR(ELLARGO))+'}{27}{120}{0}{18}{27}{116}{1}{27}{82}{0}{27}{69}'
	_PLOFFSET=NUL
	_ALIGNMENT='LEFT'
	_PADVANCE="LINEFEEDS"
	_wrap=.F.
	_rmargin=255
	_lmargin=NUL
	_PCOPIES=COPIAS
	nlq2=chr(27)+chr(113)+chr(0)+chr(27)+chr(120)+chr(1)+chr(27)+chr(107)+chr(0)+chr(27)+chr(52)
	nlq1=chr(27)+chr(113)+chr(0)+chr(27)+chr(120)+chr(2)+chr(27)+chr(107)+chr(0)+chr(27)+chr(52)+chr(27)+chr(113)+chr(1)
RETURN .T.
