FUNCTION WAITSTOK
PARAMETER W_TIPO
DO CASE
CASE W_TIPO="T"
		WAIT WIND "STOCK: "+TRANS(TELS.STOCK,"9,999,999.99") NOWA
CASE W_TIPO="A"		
			WAIT WIND "STOCK: "+TRANS(AVIS.STOCK,"9,999,999.99") NOWA		
CASE W_TIPO="C"
			WAIT WIND "STOCK: "+TRANS(COMS.STOCK,"9,999,999.99") NOWA			
CASE W_TIPO="O"			
			WAIT WIND "STOCK: "+TRANS(OTRS.STOCK,"9,999,999.99") NOWA			
ENDCASE
RETURN .T.		