FUNCTION OPENCLOS
	CLOSE DATA
	=OPAUD()
	=OPSEG()
	=OPMIX()
	#IF "BOCHI" $ CURD()
	#ELSE
		=OPDOC()
	#ENDIF
RETURN .T.
