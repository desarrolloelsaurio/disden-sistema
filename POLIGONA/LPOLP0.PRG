FUNCTION LPOLP0
	=WORKING()
	SELE POL
	inde on LISTA+NUMERO+STR(LIMITE,14,5) TO (GENTMP()) FOR EVAL(FISC) comp
	acla=PAIP+;
	PADC("L¡mite Inf.",14)+paip+;
	PADC("L¡mite Sup.",14)+paip+;
	PADC("Porcentaje",10)+paip
	tt='Listado de Poligonales'+chr(13)+CHR(10)+;
	LALIS+CHR(13)+CHR(10)+;
	'N£mero: '+right(lapol,2)
	m.LINEA=REPL("=",LEN(ACLA))
	STORE NUL TO UNI
	STORE "999,999,999.99" TO PICU
	GO TOP
	LIM1=LIMITE
	PORC=PORCENTAJE
	SKIP
	=UNWORK()
RETURN .T.
