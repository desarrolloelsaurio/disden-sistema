FUNCTION CONDCOND
	PARAM ION
	??? CHR(27)
	??? CHR(40)
	??? CHR(115)
	??? CHR(56)
	IF ION
		??? CHR(83)
	ELSE
		??? CHR(115)
	ENDIF
RETURN .T.
