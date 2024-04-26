********************************************************************************
*-- Programa: CABPRI.PRG
*-- Fecha   : 09/26/91 12:55pm
*-- Version : G. REINER
*-- Notas   : GENERA VARIABLES DE CABECERA
********************************************************************************
FUNCTION CABPRI
	#DEFINE NUL    0                               && NUL
  WAIT "IMPRIMIENDO..." WIND NOWA
	SET DEVICE TO PRINT
	SET CONSOLE OFF
	SET PRINTER ON
	_PEJECT="NONE"
	_PLENGTH=72
	_RMARGIN=255
	_PLINENO=NUL
	_PAGENO=1
	_PSCODE='{27}{64}{27}{67}{72}{27}{120}{0}{18}{27}{116}{1}{27}{82}{0}'
	SET MARGIN TO 0
	_PLOFFSET=NUL
	_ALIGNMENT='LEFT'
	_PADVANCE="LINEFEEDS"
RETURN .T.
