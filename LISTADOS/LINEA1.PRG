FUNCTION LINEA1
	PARAMETER SHIT
	IF TYPE("M.LNS")#"U"
		?? M.LNS AT 0
	ELSE
		?? "" AT 0
	ENDIF
RETURN .T.
