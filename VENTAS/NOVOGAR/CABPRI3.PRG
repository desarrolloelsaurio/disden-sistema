* 旼 FUNCTION 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �  Description: CABPRI3                                      �
* �       Author: G. REINER                                    �
* � Date created: 10-26-92                                     �
* � Time created: 12:40:42pm                                   �
* �     Function: GENERA SETEOS DE IMPRESION PARA FORMULARIOS  �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
* VERSION NOVOGAR
FUNCTION CABPRI3
	PARAMETERS COPIAS,ELLARGO
	PRIVATE COPIAS,ELLARGO
	XA=''
	IF TYPE("ENASCII")#"U" .AND. ENASCII
		XA=ENASCII()
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
	IF SUCU="0003" .or. SUCU="0004" 
	_PSCODE='{27}{64}{27}{67}{'+ALLTRIM(STR(ELLARGO))+'}{27}{120}{0}'
	ELSE
	_PSCODE='{27}{64}{27}{67}{'+ALLTRIM(STR(ELLARGO))+'}{27}{120}{0}{18}{27}{116}{1}{27}{82}{0}{27}{69}'
	ENDIF
	_PLOFFSET=NUL
	_ALIGNMENT='LEFT'
	_PADVANCE="LINEFEEDS"
	_WRAP=.F.
	_RMARGIN=255
	_LMARGIN=NUL
	_PCOPIES=COPIAS
	IF SUCU="0003" .or. SUCU="0004" 
	   NLQ2=CHR(27)+CHR(120)+CHR(0)
	   NLQ2=CHR(27)+CHR(120)+CHR(0)
	ELSE
  	   NLQ2=CHR(27)+CHR(113)+CHR(0)+CHR(27)+CHR(120)+CHR(1)+CHR(27)+CHR(107)+CHR(0)+CHR(27)+CHR(52)
	   NLQ1=CHR(27)+CHR(113)+CHR(0)+CHR(27)+CHR(120)+CHR(2)+CHR(27)+CHR(107)+CHR(0)+CHR(27)+CHR(52)+CHR(27)+CHR(113)+CHR(1)
	ENDIF
RETURN .T.
