*
*                                ALTA DE MOVIMIENTO
*
* ALTAS.PRG
*
EXTERNAL ARRAY KMESES
DO WHILE .T.
	STORE "        " TO ZZ
	@8,31 GET ZZ PICT PICU2
	READ
	STORE VAL(ZZ) TO MCODIGO
	IF !EMPTY(MCODIGO)
		SELE BAL
		IF SEEK(MCODIGO)
			IF IMPUTABLE="I"
				@3,9 SAY NOMBRE PICT "@X"
				@4,9 SAY EVAL(DEB)-EVAL(HAB) PICT PICU1
				SELE MOV
				DO WHILE !EMPTY(MFECHA)
					@9,31 GET MFECHA PICT PICFEC
					READ
					@21,1 SAY SPACE(75)
					IF !EMPTY(MFECHA)
						IF MONTH(MFECHA)=KPERIODO
							@10,31 GET MCONCEPTO PICT "@X"
							READ
							@11,32 SAY SPACE(25)
							@12,32 SAY SPACE(25)
							STORE 0 TO MDEBE,MHABER
							@11,31 GET MDEBE PICT PICU1
							READ
							IF EMPTY(MDEBE)
								DO WHILE .T.
									@12,31 GET MHABER PICT PICU1
									READ
									IF EMPTY(MHABER)
										LOOP
									ENDIF
									EXIT
								ENDDO
							ENDIF
							SELE MOV
							APPEND BLANK
							REPLACE ASIENTO WITH NROASI,MOVIMIENTO WITH NROMOV,CODIGO WITH MCODIGO,DEBE WITH MDEBE,HABER WITH MHABER,FECHA WITH MFECHA,CONCEPTO WITH MCONCEPTO,PERIODO WITH KPERIODO
							=ASIGNA(MCODIGO,MDEBE,MHABER,KPERIODO)
							SELE MOV
							STORE TDEBE+MDEBE   TO TDEBE
							STORE THABER+MHABER TO THABER
							@21,15 SAY TDEBE PICT PICU1
							@21,42 SAY THABER PICT PICU1
							EXIT
						ELSE
							=CARTEL("EL MES",;
							"DEBE SER",;
							ALLTRIM(KMESES[KPERIODO]),;
							"Pulse <RETURN>")
						ENDIF
					ENDIF
				ENDDO
			ELSE
				=CARTEL("LA CUENTA",;
				ALLTRIM(BAL.NOMBRE),;
				"NO ES IMPUTABLE",;
				"Pulse <RETURN>")
				SELE MOV
				LOOP
			ENDIF
		ENDIF
	ELSE
		EXIT
	ENDIF
ENDDO
=MEN_LIN(SYSNOMBRE)
RETURN
