FUNCTION NADA3
	SELE CCL
	SET ORDER TO
	TMP1=gentmp()
	SORT ON FECHAOP TO (TMP1) FOR CODCLI=M.CODCLI AND RECN()<M.REC
	USE (TMP1) IN 0 ALIAS TMP
	SELE TMP
	REPL ALL GY_DEBE WITH 0,GY_HABER WITH 0
	REPL GY_DEBE WITH MONTO FOR COMPRRE="FA" .OR. ;   
		COMPRRE="ND" .OR. ;   
		COMPRRE="SD" 
	REPL GY_HABER WITH ABS(MONTO) FOR EMPTY(GY_DEBE)
	CALC SUM(GY_DEBE), SUM(GY_HABER) TO TGY_DEBE, TGY_HABER 
	STORE TGY_DEBE-TGY_HABER TO TGY_SALDO 
   
	TOTPAGO=TGY_HABER
	SCAN FOR !EMPTY(GY_DEBE) 
		IF GY_DEBE>TOTPAGO
			EXIT
		ENDIF
		TOTPAGO = TOTPAGO - GY_DEBE
	ENDSCAN
	LACOMI =  0
	IF !EOF()
		REPL GY_DEBE WITH GY_DEBE - TOTPAGO
		M.PAGARA = M.MONTO
		?"CONCEPTO"
		??"MONTO" AT 30
		??"TOT. COM" AT 50
		??"COMIS" AT 70
		??"PORC." AT 90
		DO WHILE !EOF()
			IF !EMPTY(GY_DEBE)
				?IIF(EMPTY(COMPR),DETALLE,COMPR)
				??MONTO AT 30
				??COMISION AT 50
				IF M.PAGARA > GY_DEBE
					LACOMI = LACOMI + (GY_DEBE * COMISION)/ MONTO
					??(GY_DEBE * COMISION)/ MONTO AT 70 PICT "99999.99"
					??GY_DEBE/MONTO*100 AT 90 PICT "99999.99"
					M.PAGARA = M.PAGARA - GY_DEBE
				ELSE
					LACOMI = LACOMI + (M.PAGARA * COMISION)/ MONTO
					??(M.PAGARA * COMISION)/ MONTO AT 70 PICT "99999.99"
					??M.PAGARA / MONTO*100 AT 90 PICT "99999.99"
					EXIT
				ENDIF
			ENDIF
			SKIP
		ENDDO
	ENDIF
	=OFF_TMP()
RETURN LACOMI
