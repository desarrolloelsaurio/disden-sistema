********************************************************************************
*-- Programa: skar.prg
*-- Fecha   : 08/22/91 04:22pm
*-- Version : G. REINER
*-- Notas   : salda kardex - calcula saldos anteriores
*-- Modificaci¢n GOYO 08-04-92 04:22pm (men_lin)
********************************************************************************
SELE seg
tx=""
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	DO CASE
	CASE BAR()=1
		IF confirma("Calcular Saldos (Borrando Operaciones) de Kardex COMPLETO ? ",.T.,10,2)
			=OPMER()
			SELE kar
			=FLOCK("KAR") .OR. FLOK("KAR")
			DELE ALL
			tx='ZAP '
			UNLO IN KAR
		ENDIF
	CASE BAR()=2
		IF confirma("Borrar "+abios+" del Archivo de Kardex ? ",.T.,10,2)
			SELE kar
			=FLOCK("KAR") .OR. FLOK("KAR")
			=MEN_LIN(" Borrando "+abios+" del Archivo de Kardex")
			DELE FOR tipo=LEFT(abio,1)
			tx='BORRA '+UPPER(abios)+' '
			UNLO IN KAR
		ENDIF
	CASE BAR()=3
		IF confirma("Borrar "+tellas+" del Archivo de Kardex ? ",.T.,10,2)
			SELE kar
			=MEN_LIN(" Borrando "+tellas+" del Archivo de Kardex")
			SELE kar
			=FLOCK("KAR") .OR. FLOK("KAR")
			DELE FOR tipo=LEFT(tella,1)
			tx='BORRA '+UPPER(tellas)+' '
			UNLO IN KAR
		ENDIF
	CASE BAR()=4
		STOR NUL TO respuesta
		IF !EMPTY(eliavi(" a Borrar"))
			IF confirma("Borrar "+ALLTRIM(avi->avios)+" del Archivo de Kardex ? ",.T.,10,2)
				=MEN_LIN("Borrando "+ALLTRIM(avi->avios)+" del Archivo de Kardex")
				SELE kar
				=FLOCK("KAR") .OR. FLOK("KAR")
				DELE FOR tipo=LEFT(abio,1) .AND. articulo=avi->avicod
				tx='BORRA '+UPPER(abio)+' '+avi->avios
				UNLO IN KAR
			ENDIF
		ENDIF
	CASE BAR()=5
		STOR NUL TO respuesta
		IF !EMPTY(elitel(" a Borrar"))
			IF confirma("Borrar "+ALLTRIM(tel->tela)+" del Archivo de Kardex ? ",.T.,10,2)
				SELE kar
				=MEN_LIN("Borrando "+ALLTRIM(tel->tela)+" del Archivo de Kardex")
				SELE kar
				=FLOCK("KAR") .OR. FLOK("KAR")
				DELE FOR tipo=LEFT(tella,1) .AND. articulo=tel->telcod
				tx='BORRA '+UPPER(tella)+' '+tel->tela
				UNLO IN KAR
			ENDIF
		ENDIF
	ENDCASE
	IF !EMPTY(tx)
		=iaud(tx)
	ENDIF
ELSE
	=relewin("WIN")
	=iaudi()
ENDIF
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
