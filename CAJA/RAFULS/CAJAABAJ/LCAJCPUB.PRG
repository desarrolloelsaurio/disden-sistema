FUNCTION LCAJCPUB
	DO WHILE .T.
		FAC3=POPMENU(7,23,'LISTADOS DE CAJA',;
		"Resumen del d¡a por Pantalla",;
		"Resumen del d¡a por Impresora",;
		"Listado de Recibos por Pantalla",;
		"Listado de Recibos por Impresora",;
		"Men£ Principal")
		DO CASE
		CASE FAC3=1 .OR. FAC3=2
			STORE {} TO M.FECINI
			M.FECINI=INFEC("WIN","Fecha del Listado")
			IF !EMPTY(M.FECINI)
				DO OPCAJ
				=OPCCH()
				DO LRESCAJ WITH FAC3=1
			ENDIF
		CASE FAC3=3 .OR. FAC3=4
			DO OPCAJ
			=OPCCH()
			=QUERYREB(FAC3=3)
		CASE FAC3=5
			EXIT
		ENDCASE
	ENDDO
RETURN
