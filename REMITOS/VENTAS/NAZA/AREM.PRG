********************************************************************************
*-- Programa: AREM.PRG
*-- Fecha   : 11-09-91 07:10pm
*-- Version : G. REINER
*-- Notas   : ANULA REMITOS EMITIDOS Y NO FACTURADOS
*-- Modificaci¢n GOYO 10-02-92 12:48pm 
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO NUREM,NUMARCA
	IF BUSREM()
		STORE .F. TO EXISTE
		DO LREMP1 WITH NUREM,NUMARCA
		IF EXISTE
			if empty(rem.facturado)
				if confirma("Borrar el Remito N§ "+alltrim(str(nurem)),.t.,10,0)
					SELE REM
					=FLOCK("REM") .OR. FLOK("REM")
					=FLOCK("REX") .OR. FLOK("REX")
					SELE REM
					DELE FOR REMITO=NUREM
					UNLO IN REM
					SELE REX
					SEEK(NUREM)
					SCAN WHILE REMITO=NUREM
						SELE PRE
						IF XSEEK(FAX.ARTICULO,'PRE','ARTICULO')
							IF RLOCK() .OR. LOK(STR(RECNO()),"PRE")
								REPL STOCK WITH STOCK+REX.CANTIDAD
							ENDIF
						ENDIF
						UNLO IN PRE
						SELE REX
						DELE
					ENDSCAN
					UNLO IN REX
					=IAUD(NUREM)
				ENDIF
			ELSE
				do cartel with "IMPOSIBLE BORRAR EL REMITO N§ "+ALLTRIM(STR(NUREM)),"DADO QUE FUE FACTURADO","EL DIA "+DTOC(REM.FACTURADO),"POR EL USUARIO "+ALLTRIM(REM.USUARIO)
			ENDIF
		ENDIF
	ENDIF
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
