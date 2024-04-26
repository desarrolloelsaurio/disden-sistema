*************************************
*-- Programa: CSTO.PRG
*-- Fecha   : 03-30-92 02:14am
*-- Version : G. REINER
*-- Notas   : CORRECCION DE STOCK
*-- VERSION BALCALA/NOVOGAR
*************************************
C_DIJO=ALLTRIM(PROMPT())
ulpr=hora_ulp(program())
if cheqseg()
	IF HAYCAMPO("DISCRIM","MER")
	ON KEY LABEL Ctrl+D WAIT mer.articulo+'-'+mer.merca WIND NOWAIT	
	=MEN_LIN("Ctrl+D Denominaci¢n Producto - [ESC] Sale")
	    SELE MER
	    SET ORDER TO
	    =MOVEWIN(NUL,5,23,74,'WIN'," Correcci¢n Stock -"+alltrim(janname)+" ",ALLTRIM(JANNAME))	    	    
		BROW FIELD ARTICULO/R:p="!!!!!!!!!!",STOCK   :p="9999999":H="STOCK";
		,STOCKMIN   :p="9999999"    :H='ST. MINIMO';
		,STOCKMAX   :p="9999999"    :H='ST. MAXIMO';
		,STOCKRES   :p="9999999"    :H='RESERVADO ';
		,STOCKPES   :p="999999.99"  :H='PESO TOTAL';
		NOAPPEND NODELETE NOMENU IN win ;
        FOR &fisc
	ELSE
        =MOVECENT(NUL,NUL,23,72,'WIN'," Correcci¢n Stock -"+alltrim(janname)+" ",ALLTRIM(JANNAME))	    	    
	    SELE MER        
	    SET ORDER TO
	    DO CASE
        CASE C_DIJO="Stock Actual"
		BROW FIELD ARTICULO/R:p="@!",;
		MERCA:P="@!":H=PADC("DESCRIPCION",40):R ,;
		STOCK   :p="9999999":H="STOCK" ;
    	FREEZE STOCK ;
		NOAPPEND NODELETE NOMENU IN win ;
        FOR &fisc		
        CASE C_DIJO="Stock M ximo"
		BROW FIELD ARTICULO/R:p="@!",;
		MERCA:P="@!":H=PADC("DESCRIPCION",40):R ,;		
		STOCKMAX   :p="9999999"    :H='ST. MAXIMO' ;
    	FREEZE STOCKMAX ;		
		NOAPPEND NODELETE NOMENU IN win ;
        FOR &fisc		
        CASE C_DIJO="Stock M¡nimo"
		BROW FIELD ARTICULO/R:p="@!", ;
		MERCA:P="@!":H=PADC("DESCRIPCION",40):R ,;		
		STOCKMIN   :p="9999999"    :H='ST. MINIMO' ;
    	FREEZE STOCKMIN ;
		NOAPPEND NODELETE NOMENU IN win ;
        FOR &fisc		
        CASE C_DIJO="Stock Reservado"
		BROW FIELD ARTICULO/R:p="@!", ;
		MERCA:P="@!":H=PADC("DESCRIPCION",40):R ,;		
		STOCKRES   :p="9999999"    :H='RESERVADO ' ;
    	FREEZE STOCKRES ;
		NOAPPEND NODELETE NOMENU IN win ;
        FOR &fisc		
        ENDCASE
	ENDIF
	ON KEY LABEL Ctrl+D
	=relewin("win")
	=IAUD(FISC)
	FISC=""
	SET ORDER TO TAG ARTICULO IN MER
ELSE
	=IAUDI()
ENDIF
ulpr=PROGRAM()
RETURN MEN_LIN(BOTOM)
