FUNCTION LREMC0
	STORE NUL TO VEZ
	? PAIP
	?? STR(COR.NUMERO,10)
	?? PAIP
	?? COR.ARTICULO
	?? PAIP
	?? COR.FECHAINI
	?? PAIP
	SELE FAX
	SEEK(COR.NUMERO)
	SCAN WHILE FAX.NUMERO=COR.NUMERO
		VEZ=VEZ+1
		?? RIGHT(ALLTRIM(REMITO),8)
		?? "/"
		?? IIF(EMPTY(EF)," ","*")
		?? "/"
		?? IIF(EMPTY(SF)," ","*")
		?? PAIP
	endscan
	FOR A=VEZ+1 TO 8
		?? SPACE(12)
		?? PAIP
	NEXT
	SELE COR
	STORE CASOS+1 TO CASOS
RETURN
