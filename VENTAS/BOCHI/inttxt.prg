FUNCTION inttxt
PARAMETERS nume, long
tmp = ALLTRIM(STR(nume))
IF long > LEN(tmp)
	tmp = REPLICATE("0", long) + tmp
ENDIF
RETURN RIGHT(tmp, long)
 