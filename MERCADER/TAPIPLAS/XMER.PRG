****************************************************************************
*-- Programa: XMER.PRG
*-- Fecha   : 06/11/91
*-- Version : V.LEEGSTRA
*-- Notas   : RESTAURA BASE DE Mercader¡as
********************************************************************************
ulpr=hora_ulp(PROGRAM())
stor "" TO tx
SELE mer
DO CASE
CASE BAR()=1
	DO WHIL .T.
		@ 24,nul SAY PADC('Reindexando el Archivo de Mercader¡as',80,'*') COLO SCHE 19
		IF FLOCK("MER")
			REINDEX
			UNLO IN mer
			tx='REINDEX '
			EXIT
		ELSE
			@ 24,nul SAY PADC(Espere,80,'*') COLO SCHE 19
		ENDIF
	ENDDO
CASE BAR()=2
	DO WHIL .T.
		IF FLOCK("MER")
			@ 24,nul SAY PADC('Generando Nuevo Indice de Mercader¡as',80,'*') COLO SCHE 19
			INDE ON merca TO (PATH+"\MERCA")
			INDE ON articulo TO (PATH+"\ARTICULO")
			INDE ON MODELO TO (PATH+"\MODELO")
			UNLO IN mer
			USE
			=OPMER()
			tx='CREA INDICE '
			EXIT
		ELSE
			@ 24,nul SAY PADC(Espere,80,'*') COLO SCHE 19
		ENDIF
	ENDDO
	REINDEX
CASE BAR()=4
	IF FILE("C:\PRODUC\PRODUC.EXE")
		STORE hora_ulp(PROGRAM()) to ULPR
		IF CHEQSEG()
			DO avdis
			SELE mer
			DO WHIL .T.
				IF FLOCK("MER")
					USE
					ERASE merca.dbf
					ERASE merca.idx
					ERASE articulo.idx
					! produc merca.*
					RELE WIND win
					UNLO IN mer
					=OPMER()
					tx='RECUP. BACKUP '
					EXIT
				ELSE
					@ 24,nul SAY PADC(Espere,80,'*') COLO SCHE 19
				ENDIF
			ENDDO																																											                                     																      REINDEX
		ELSE
			do iaud WITH 'ILEG. RECUP BACKUP Mercader¡as'
		ENDIF
	ENDIF
ENDCASE
IF !EMPTY(TX)
	do iaud WITH tx+' Mercader¡as'
ENDIF
RETURN
