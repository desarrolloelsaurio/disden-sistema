*******************************************
*-- Programa: CABPRI.PRG
*-- Fecha   : 09/26/91 12:55pm
*-- Version : G. REINER
*-- Notas   : GENERA VARIABLES DE CABECERA
*******************************************
FUNCTION CABPRIR
PARAMETER SHIT
    =UNWORK()
    =IMPRESOR()
    =MEN_LIN(IMPRIMIENDO)
	IF GETENV("USERNAME")#"GOYO" .AND. GETENV("USERNAME")#"BATA" .AND. GETENV("EQUIPO")#'MICASA'
		ON ERROR DO ABPR
	ENDIF
	SET DEVICE TO PRINT
	SET CONSOLE OFF
	=QUEIMP()
	SET PRINTER ON
	LARGOJA=IIF(TYPE("LARGOJA")="U",72,LARGOJA)
	_PEJECT="NONE"
	_PLENGTH=LARGOJA
	_RMARGIN=80
	_PLINENO=NUL
	_PAGENO=1
	_PSCODE='{27}{64}{27}{67}{'+ALLTRIM(STR(LARGOJA))+'}{27}{120}{0}{18}{27}{116}{1}{27}{82}{0}{27}{18}'
	_RMARGIN=255
	_PLOFFSET=NUL
	_ALIGNMENT='LEFT'
	_PADVANCE="LINEFEEDS"
RETURN .T.
