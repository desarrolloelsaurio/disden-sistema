FUNCTION RELLENO
IF UPPER(SYS(2006))="VGA/MONO" .OR. !ISCOLOR()
	RETURN "�"
ENDIF
RETURN "�"