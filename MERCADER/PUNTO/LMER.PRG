FUNCTION LMER
	PARAMETER PORPAN
	#DEFINE BOTOM  "  "+repl("°",78)              && BOTOM
	ULPR=HORA_ULP(PROGRAM())
	DIJO=BAR()
	respuesta='nada1#13#12#Tipo de Listado#3;
#\<Nombres;
#\<Descripciones;
#\<Caracter¡sticas;
#\<Agrupaci¢n;
#\<Sin Agrupaci¢n'
	=DEFPOP()
	ON SELE POPU NADA1 DO LMER2
	ACTI SCRE
	ACTI POPU NADA1
	RELE POPU NADA1
	ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
