********************************************
* FUNCI�N: BUSCA LA BASE DE DATOS Y LA ABRE
*
* PAR�METROS: 1. NOMBRE DE LA BASE
*             2. ORDEN DE APERTURA
*
* ORDEN DE B�SQUEDA:
* 1. PATHPRO
* 2. PATHVEN
* 3. PATHCAJ
***********************************************
FUNCTION GETDBF
	PARAMETER G_BASE,G_TAG,G_ALIAS,G_INAREA,G_EXCL,G_AGAIN
	G_SALIDA=.T.
	G_MAXPATH=20
	DIME POSIB[G_MAXPATH]
	POSIB[1]="PATH"
	POSIB[2]="PATHPRO"
	POSIB[3]="PATHVEN"
	POSIB[4]="PATHCAJ"
	POSIB[5]="PATHCPR"
	POSIB[6]="PATHLAB"
	POSIB[7]="PATHSTOC"
	POSIB[8]='"..\VENTASA"'
	POSIB[9]='"..\COMPRASA"'
	POSIB[10]='"..\CAJAA"'
	POSIB[11]='"..\..\CAJAA"'
	POSIB[12]='"..\..\PRODUCA"'
	POSIB[13]='"\SISTEMAS\STOCK\STOCKA"'
	POSIB[14]='"..\ALQUILEA"'
	POSIB[15]='"..\..\ALQUILEA"'
	POSIB[16]='"..\EXPENSAA"'
	POSIB[17]='"..\..\EXPENSAA"'
	POSIB[18]='"..\..\COMPRAS\COMPRASA"'
	POSIB[19]="'.'"
	POSIB[20]="'.'"		
	G_PUNTO=AT('.',G_BASE)
	FOR G_XA=1 TO G_MAXPATH
		IF TYPE((POSIB[G_XA]))="C"
			IF EMPTY(G_PUNTO)
				ELPATH=EVAL(POSIB[G_XA])+"\"+G_BASE+".DBF"
			ELSE
				ELPATH=EVAL(POSIB[G_XA])+"\"+G_BASE
			ENDIF
			IF FILE(ELPATH)
				IF EMPTY(G_TAG)
					IF EMPTY(G_INAREA)
						IF G_EXCL
							IF G_AGAIN
								USE (ELPATH) ALIAS (G_ALIAS) AGAIN EXCL
							ELSE
								USE (ELPATH) ALIAS (G_ALIAS) EXCL
							ENDIF
						ELSE
							IF G_AGAIN
								USE (ELPATH) ALIAS (G_ALIAS) AGAIN
							ELSE
								USE (ELPATH) ALIAS (G_ALIAS)
							ENDIF
						ENDIF
					ELSE
						IF G_EXCL
							IF G_AGAIN
								USE (ELPATH) ALIAS (G_ALIAS) IN (G_INAREA) EXCL AGAIN
							ELSE
								USE (ELPATH) ALIAS (G_ALIAS) IN (G_INAREA) EXCL
							ENDIF
						ELSE
							IF G_AGAIN
								USE (ELPATH) ALIAS (G_ALIAS) IN (G_INAREA) AGAIN
							ELSE
								USE (ELPATH) ALIAS (G_ALIAS) IN (G_INAREA)
							ENDIF
						ENDIF
					ENDIF
				ELSE
					IF EMPTY(G_INAREA)
						IF G_EXCL
							IF G_AGAIN
								USE (ELPATH) ORDER TAG (G_TAG) ALIAS (G_ALIAS) EXCL AGAIN
							ELSE
								USE (ELPATH) ORDER TAG (G_TAG) ALIAS (G_ALIAS) EXCL
							ENDIF
						ELSE
							IF G_AGAIN
								USE (ELPATH) ORDER TAG (G_TAG) ALIAS (G_ALIAS) AGAIN
							ELSE
								USE (ELPATH) ORDER TAG (G_TAG) ALIAS (G_ALIAS)
							ENDIF
						ENDIF
					ELSE
						IF G_EXCL
							IF G_AGAIN
								USE (ELPATH) ORDER TAG (G_TAG) ALIAS (G_ALIAS) IN (G_INAREA) EXCL AGAIN
							ELSE
								USE (ELPATH) ORDER TAG (G_TAG) ALIAS (G_ALIAS) IN (G_INAREA) EXCL
							ENDIF
						ELSE
							IF G_AGAIN
								USE (ELPATH) ORDER TAG (G_TAG) ALIAS (G_ALIAS) IN (G_INAREA) AGAIN
							ELSE
								USE (ELPATH) ORDER TAG (G_TAG) ALIAS (G_ALIAS) IN (G_INAREA)
							ENDIF
						ENDIF
					ENDIF
				ENDIF
				EXIT
			ENDIF
		ENDIF
	NEXT
	IF G_XA>G_MAXPATH
		ULPR=PROGRAM()
		=IAUD(G_BASE+" NO FAUN")
		G_SALIDA=.F.
	ENDIF
RETURN G_SALIDA
