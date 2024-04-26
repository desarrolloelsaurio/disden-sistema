PROCEDURE CICLOS
	CLEA
	X=""
	FOR A=1 TO 12
		X=X+CHR(A)
	NEXT
	A=""
	PROGRAMA=GETFILE("PRG","PROGRAMA A ANALIZAR")
	IF !EMPTY(PROGRAMA) .AND. LAST()#27
		PROGRAMA=LEFT(PROGRAMA,AT(".",PROGRAMA)-1)
		FUENTE=PROGRAMA+".PRG"
		RESPALDO=PROGRAMA+".BAK"
		COPY FILE (FUENTE) TO (RESPALDO)
		FUENTE=PROGRAMA+".DIB"
		ERASE (FUENTE)
		FRESPALDO=FOPEN(RESPALDO,0)
		FFUENTE=FCREATE(FUENTE,0)
		? FUENTE
		COL='   '
		DO WHILE !FEOF(FRESPALDO)
			A=FGETS(FRESPALDO)
			A=CHRTRAN(A,X,"")
			A=ALLTRIM(A)
			IF !EMPTY(A)
				B=UPPER(A)
				IF B="IF "
					A=LEFT(COL,LEN(COL)-3)+' ÚÄ'+A
					? FPUTS(FFUENTE,A)
					COL=LEFT(COL,LEN(COL)-3)+' ³    '
				ELSE
					IF B="DO WH" .OR. B="SCAN"
						A=LEFT(COL,LEN(COL)-3)+' ÉÍ'+A
						? FPUTS(FFUENTE,A)
						COL=LEFT(COL,LEN(COL)-3)+' º    '
					ELSE
						IF B="PRIN" .OR. B="DO CASE"
							A=LEFT(COL,LEN(COL)-3)+' ÕÍ'+A
							? FPUTS(FFUENTE,A)
							COL=LEFT(COL,LEN(COL)-3)+' Ø    '
						ELSE
							IF B="FOR "
								A=LEFT(COL,LEN(COL)-3)+' ÖÄ'+A
								? FPUTS(FFUENTE,A)
								COL=LEFT(COL,LEN(COL)-3)+' ×    '
							ELSE
								IF B='ELSE'
									A=LEFT(COL,LEN(COL)-6)+' ÃÄ'+A
									? FPUTS(FFUENTE,A)
								ELSE
									IF B="ENDP" .OR. B="ENDC"
										COL=LEFT(COL,LEN(COL)-6)+'   '
										A=LEFT(COL,LEN(COL)-3)+' ÔÍ'+A
										? FPUTS(FFUENTE,A)
									ELSE
										IF B="ENDF" .OR. B="NEXT"
											COL=LEFT(COL,LEN(COL)-6)+'   '
											A=LEFT(COL,LEN(COL)-3)+' ÓÄ'+A
											? FPUTS(FFUENTE,A)
										ELSE
											IF B='ENDS' .OR. B='ENDD'
												COL=LEFT(COL,LEN(COL)-6)+'   '
												A=LEFT(COL,LEN(COL)-3)+' ÈÍ'+A
												? FPUTS(FFUENTE,A)
											ELSE
												IF B='ENDI'
													COL=LEFT(COL,LEN(COL)-6)+'   '
													A=LEFT(COL,LEN(COL)-3)+' ÀÄ'+A
													? FPUTS(FFUENTE,A)
												ELSE
													IF B="CASE "
														COL=LEFT(COL,LEN(COL)-3)
														A=LEFT(COL,LEN(COL)-3)+"<Ø>"+A
														? FPUTS(FFUENTE,A)
														COL=COL+'   '
													ELSE
														IF B="EXIT" .OR. B="LOOP"
															COSA=""
															FOR S=LEN(COL) TO 1 STEP -1
																XX=SUBSTR(COL,S,1)
																IF XX#"º" .AND. XX#"×"
																	IF XX='³'
																		COSA="Å"+COSA
																	ELSE
																		COSA="Ä"+COSA
																	ENDIF
																ELSE
																	EXIT
																ENDIF
															NEXT
															COSA='<'+COSA
															COSA=LEFT(COL,LEN(COL)-LEN(COSA))+COSA
															A=COSA+A
															? FPUTS(FFUENTE,A)
														ELSE
															*IF B="OPEN SOME COMMAND"
															*   A=LEFT(COL,LEN(COL)-3)+' **'+A
															*   ? FPUTS(FFUENTE,A)
															*   COL=LEFT(COL,LEN(COL)-3)+' *    '
															*ELSE
															*   IF B="CLOSE SOME COMMAND"
															*      COL=LEFT(COL,LEN(COL)-6)+'   '
															*      A=LEFT(COL,LEN(COL)-3)+' **'+A
															*      ? FPUTS(FFUENTE,A)
															*   ELSE
															A=COL+A
															? FPUTS(FFUENTE,A)
															*  ENDIF
															*ENDIF
														ENDIF
													ENDIF
												ENDIF
											ENDIF
										ENDIF
									ENDIF
								ENDIF
							ENDIF
						ENDIF
					ENDIF
				ENDIF
			ENDIF
		ENDDO
		? FCLOSE(FFUENTE)
		? FCLOSE(FRESPALDO)
	ENDIF
	CLEA
RETURN
