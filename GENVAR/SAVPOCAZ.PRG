function savpocaz
parameter poca
	IF GETENV("EQUIPO")="TEMACOLOR" .OR. GETENV("EQUIPO")="DISANTO"
		save to \SISTEMAS\CAJA\CAJAP\CAJAABAJ\POSIC 
    ELSE
     	IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("EQUIPO")='MICASA'
	    	save to (poca+'\posic') ADDI
	    ELSE
	    IF GETENV("EQUIPO")='ARROYO'
			  save to C:\SISTEMAS\VENTAS\VENTASA\POSIC 
		   ELSE
			  save to ('F:\usr\'+getenv("username")+"\posicCAZ") 
		   ENDIF
		ENDIF
	ENDIF
return .t.