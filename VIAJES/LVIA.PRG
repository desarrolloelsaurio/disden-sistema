#DEFINE PAIP   "|"                               && PAIP
FUNCTION LVIA
	=OPBUQ()
	=OPVIA()
	TT="Listado de Buques"
	acla=paip+"NUMERO"+;
		PAIP+;
		PADC("BUQUE",30)+;
		PAIP+;
		PADC("CLIENTE",30)+PAIP+;
		PADC("BANDERA",8)+PAIP
RETURN XPRN1(4,"VIA","LVIA0()","","LBUQ")
