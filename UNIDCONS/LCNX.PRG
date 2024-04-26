************************************
*-- Programa: LCNX.PRG
*-- Fecha   : 01-22-92 05:19pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE UNIDADES DE CONSORCIOS
************************************
PARAMETER PORPAN
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE BAR()=1
	DO WHILE .T.
		STORE NUL TO RESPUESTA
		IF empty(eliCSS("a Listar",-1,1))
			EXIT
		ELSE
			STORE 'CNX.CODCLI="'+PER.CODCLI+'" .AND. !CNX.INQUILINO' TO fsc
			ttu='Listado del Consorcista: '+ALLTRIM(PER.cliente)
			=IIF(PORPAN,LCNXP2(),LCNXP2())
		ENDIF
	ENDDO
CASE BAR()=2
	DO WHILE .T.
		STORE NUL TO respuesta
		IF empty(elicns("a Listar",-1,1))
			EXIT
		ELSE
			STORE 'CNX.CONCOD="'+CNS.CONCOD+'"' TO fsc
			ttu='Listado del Consorcio: '+ALLTRIM(CNS.CONSORCIO)
			=IIF(PORPAN,LCNXP1(),LCNXi1())
		ENDIF
	ENDDO
ENDCASE
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
