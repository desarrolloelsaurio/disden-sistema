FUNCTION MCORX
	PARA CONCO1,M_NOESPERA
	SELE COR
	SCAT MEMV
	DO COR.SPR WITH "ORDEN DE CORTE", .T., .F., .T.
	IF CONCO1
		IF !M_NOESPERA
			=men_lin("Buscando Orden de "+korte+" - Espere por Favor")
			SELE CO1
			SET ORDER TO TAG NUMERO
			=FLOCK("CO1") .or. flok("CO1")
			fisc=COR.NUMERO
			IF SEEK(FISC)
				=movewin(0,32,23,77,'win1','LISTA ORDEN DE '+UPPER(KORTE)+' N� '+alltrim(STR(FISC)))
				SET DELE OFF
				SET ORDER TO TAG SUECOD IN MIX
				SET RELA TO COLOR INTO MIX
				=MEN_LIN("Ctrl - H para Operaciones")
				BROW FIEL COLOR:H="COLOR":R,;
					MIX.TEXTO1:H="DENOMINACION":R,;
					TALLE:P="99.99":B=XATALMIN,XATALMAX:R,;
					CANTINI:P="9999":H="CANT.";
					TITL 'ORDEN DE '+UPPER(KORTE)+'/ARTICULO:'+ALLTRIM(MER.MERCA)+'-'+COR.ARTICULO ;
					wind win1 ;
					KEY FISC
				=relewin("WIN1")
				=REOPCOR()
				SET DELE ON
			ENDIF
		ENDIF
		=relewin("COR")
	ELSE
		=men_lin("TECLA PARA CONTINUAR",24,0,80,!M_NOESPERA)
		IF !M_NOESPERA
			=relewin("COR")
		ENDIF
	ENDIF
RETURN men_lin(botom)
