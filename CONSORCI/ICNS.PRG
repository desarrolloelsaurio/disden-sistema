********************************************************************************
*-- Programa: ICNS.PRG
*-- Fecha   : 01-18-92 08:44am
*-- Version : R. 'EL BATA'
*-- Notas   : INGRESA consorcios
*-- Modificaci¢n GOYO 05-30-92 10:32am (reemp APPE y GATH por INSERT INTO)
********************************************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ME1    "Ingreso Consorcios - "           && ME1
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	=MOVEWIN(ICNSR,ICNSC,ICNSR+ICNSLA,ICNSC+ICNSAN,'WIN'," Ingreso Consorcios ")
	SELE CNS
	STOR 17 TO COL
	STOR NUL TO KOK
	DO WHIL .T.
		ACTI WIND WIN
		CLEA
		SCAT MEMV BLAN
		DO MCNS WITH .F.
		SET ORDER TO TAG CONCOD
		@ 1,COL GET m.concod ;
		PICT "@!" ;
		MESS ME1+'[ENTER] para Men£'  ;
		VALID (!SEEK(M.CONCOD)) ;
		ERROR 'CODIGO DE CONSORCIO EXISTENTE'
		READ
		SET ORDER TO TAG CONSORCIO
		IF !EMPTY(M.CONCOD).AND. LASTKEY()#27
			@ 2,COL GET M.CONSORCIO ;
			PICT "@!" ;
			VALID (!SEEK(M.CONSORCIO)) ;
			ERROR 'NOMBRE DE CONSORCIO EXISTENTE' ;
			MESS ME1+'[ENTER] para Men£'
			READ
			IF !EMPTY(M.CONSORCIO) .AND. LASTKEY()#27
				ACTI WIND WIN
				@ 3, COL GET M.DIRECCION PICT "@X"
				READ
				DO WHILE EMPTY(M.LOCALIDAD)
					STORE NUL TO RESPUESTA
					=ELICIU(" del Consorcio",4,COL)
					M.LOCALIDAD=MIX.NU1
					M.NADA=MIX.TEXTO1
				ENDDO
				@ 4,COL GET M.NADA
				CLEAR GETS
				=AGRABAR("CNS")
				=IAUD(ALLTRIM(M.CONSORCIO)+'-'+CNSCOD)
			ELSE
				EXIT
			ENDIF
		ELSE
			EXIT
		ENDIF
	ENDDO
	=RELEWIN('WIN')
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
