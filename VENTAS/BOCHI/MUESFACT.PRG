=OPCCL()
=OPPER()
=OPMER()
=OPFAC()
store nul to respuesta
if elifac()
	m.elform = fac.tipo
	M.LAFACOK=FAC.FACTURA
	IF ELFORM=FAC.TIPO .OR. ELFORM="FA" .AND. EMPTY(FAC.TIPO)
		ELGIL=SAYPER(FAC.CODCLI,"CODCLI")
		HAIR=SAYMIX(PER.LOCALIDAD,"CIUCOD")
		LACONDIVA=SAYMIX(PER.CONDIVA,"IVACOD")
		ELNROIVA=PER.NROIVA
		ELTELEF=ALLTRIM(PER.TELEFONO)+" - "+ALLTRIM(PER.FAX)
		LACOPIA="ORIGINAL"
		SELE FAX
		SET ORDER TO TAG FACTURA
		M.HAYUNO=SEEK(FAC.FACTURA)
		m.numero = FAC.FACTURA
		SELE FAC
		SCAT MEMV
		SELE CCL
		SET ORDER TO TAG NUMERORE
		SEEK FAC.FACTURA
		M.DETALLE=CCL.DETALLE
		M.PAANULAR=CCL.COMPR
		SELE FAX
		M.FACTURA=FAC.FACTURA
		IF GETENV("ESTUD")="SI"
			IF ELFORM="NC"
           		IF M.HAYUNO
					SELE FAX
					repo form lDEVi PREV ;
					    for fax.factura=FAC.factura
				ELSE
					SELE FAC
					repo form lCREi PREV;
					    for faC.factura=M.factura
				ENDIF
			ELSE
				repo form NADA2 prev WHILE fax.factura=fac.factura
			ENDIF
		ELSE
			IF ELFORM="NC"
		                IF M.HAYUNO
					SELE FAX
					repo form lDEVA PREV ;
					    for fax.factura=FAC.factura
	                  	ELSE
	                     		SELE FAC
	                     		repo form lCREA PREV ;
	                     		    for faC.factura=M.factura
	                  	ENDIF
	               	ELSE
						sele FAX
****** porque no se *****   repo form NADAA prev for fax.factura=fac.factura
	                  	repo form NADA2 prev for fax.factura=fac.factura
	               	ENDIF
		ENDIF
	ENDIF
ENDIF
return
