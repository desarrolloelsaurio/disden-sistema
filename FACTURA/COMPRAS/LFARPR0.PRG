* ÚÄ Funci¢n  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: LFARPR0                                                    ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-16-92                                                   ³
* ³ Time created: 03:47:30pm                                                 ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LFARPR0
	=WORKING()
	SET ORDER TO TAG PROCOD IN PRO
	SELE FAR
	SET RELA TO PROCOD INTO PRO
	IF FILFAC=3
		IF ".T."=FISC
			INDE ON montonet to (GENTMP()) comp
		ELSE
			INDE ON montonet to (GENTMP()) for eval(fisc) comp
		ENDIF
		acla=paip+padc("FECHA",8)+PAIP+;
		PADC("FACTURA",14)+PAIP+;
		PADC("PROVEEDOR",20)+PAIP+;
		PADC("MONTO",XACDIGI)+PAIP
	ELSE
		IF FILFEC=3
			IF ".T."=FISC
				INDE ON FECHAEM to (GENTMP()) comp
			ELSE
				INDE ON FECHAEM to (GENTMP()) for eval(fisc) comp
			ENDIF
			acla=paip+padc("FECHA EM",8)+PAIP+;
			PADC("CANTIDAD",XACDIGI)+PAIP+;
			PADC("MONTO",XACDIGI)+PAIP
			GO TOP
			ELCORTE=FECHAEM
			ELTEXTO=FECHAEM
		ELSE
			IF FILven=3
				IF ".T."=FISC
					INDE ON FECHAVE to (GENTMP()) comp
				ELSE
					INDE ON FECHAVE to (GENTMP()) for eval(fisc) comp
				ENDIF
				acla=paip+padc("FECHA VE",8)+PAIP+;
				PADC("CANTIDAD",XACDIGI)+PAIP+;
				PADC("MONTO",XACDIGI)+PAIP
				GO TOP
				ELCORTE=FECHAVE
				ELTEXTO=FECHAVE
			ELSE
				IF FILPRO=3
					IF TYPE("ORDPRO")='U' .OR. ORDPRO
						IF ".T."=FISC
							INDE ON PROCOD to (GENTMP()) comp
						ELSE
							INDE ON PROCOD to (GENTMP()) for eval(fisc) comp
						ENDIF
					ELSE
						IF ".T."=FISC
							INDE ON PRO.PROVEEDOR to (GENTMP()) Comp
						ELSE
							INDE ON PRO.PROVEEDOR to (GENTMP()) for eval(fisc) comp
						ENDIF
					ENDIF
					acla=paip+padc("CODIGO",10)+PAIP+;
					PADC("PROVEEDOR",30)+PAIP+;
					PADC("CANTIDAD",XACDIGI)+PAIP+;
					PADC("MONTO",XACDIGI)+PAIP
					GO TOP
					ELCORTE=FAR.PROCOD
					ELTEXTO=PRO.PROCOD+PAIP+PRO.PROVEEDOR
				ELSE
					IF FILGAS=3
						SET ORDER TO TAG GASCOD IN MIX
						SET RELA TO GASTO INTO MIX ADDI
						IF TYPE("ORDGAS")='U' .OR. ORDGAS
							IF ".T."=FISC
								INDE ON GASTO to (GENTMP()) comp
							ELSE
								INDE ON GASTO to (GENTMP()) for eval(fisc) comp
							ENDIF
						ELSE
							IF ".T."=FISC
								INDE ON MIX.TEXTO1 to (GENTMP()) comp
							ELSE
								INDE ON MIX.TEXTO1 to (GENTMP()) for eval(fisc) comp
							ENDIF
						ENDIF
						acla=paip+padc("CODIGO",11)+PAIP+;
						PADC("GASTO",20)+PAIP+;
						PADC("CANTIDAD",XACDIGI)+PAIP+;
						PADC("MONTO",XACDIGI)+PAIP
						GO TOP
						ELCORTE=FAR.GASTO
						ELTEXTO=FAR.GASTO+PAIP+MIX.TEXTO1
					ELSE
						IF FILPAG=3
							SET ORDER TO TAG PAGCOD IN MIX
							SET RELA TO CONDPAGO INTO MIX ADDI
							IF TYPE("ORDPAG")='U' .OR. ORDPAG
								IF ".T."=FISC
									INDE ON CONDPAGO to (GENTMP()) comp
								ELSE
									INDE ON CONDPAGO to (GENTMP()) for eval(fisc) comp
								ENDIF
							ELSE
								IF ".T."=FISC
									INDE ON MIX.TEXTO1 to (GENTMP()) comp
								ELSE
									INDE ON MIX.TEXTO1 to (GENTMP()) for eval(fisc) comp
								ENDIF
							ENDIF
							acla=paip+padc("CODIGO",11)+PAIP+;
							PADC("COND. PAGO",20)+PAIP+;
							PADC("CANTIDAD",XACDIGI)+PAIP+;
							PADC("MONTO",XACDIGI)+PAIP
							GO TOP
							ELCORTE=FAR.CONDPAGO
							ELTEXTO=FAR.CONDPAGO+PAIP+MIX.TEXTO1
						ENDIF
					ENDIF
				ENDIF
			ENDIF
		ENDIF
	ENDIF
	=UNWORK()
RETURN .T.
