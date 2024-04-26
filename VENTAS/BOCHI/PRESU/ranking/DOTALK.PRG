********************************************************************************
*-- Programa: DOTALK.PRG
*-- Fecha   : 06-14-92 03:21am
*-- Version : GOYO REINER
*-- Notas   : TALK ON Y VENTANA
********************************************************************************
FUNCTION DOTALK
SET TALK ON
#IF "Wind" $ VERS()
	DEFINE WINDOW TALK ;
		AT 10.429, 10.000 ;
		SIZE 4.071,60.222 ;
		FONT "MS Sans Serif", 8 ;
		FLOAT ;
		NOCLOSE ;
		MINIMIZE ;
		DOUB HALF SHAD 
#ELSE
DEFI WIND TALK FROM 10,1 TO 13,78 DOUB SHAD
#ENDIF
ACTI WIND TALK
SET TALK WIND TALK
RETURN .T.
