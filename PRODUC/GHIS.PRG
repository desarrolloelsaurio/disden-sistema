**********************************
*-- PROGRAMA: GHIS.PRG
*-- FECHA   : 07/31/91 05:03PM
*-- VERSION : G. REINER
*-- NOTAS   : GENERA HISTORICO
**********************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	SELE fab
	STORE 0 TO respuesta
	STORE .T. TO sigue
	SEEK STR(nfab)
	IF FOUND()
		ff=RECNO()
		registro=STR(ff)
		=LOCK() .OR. LOK()
		DEFINE WINDOW win FROM 4,10 TO 17,70 TITL " Genera Hist¢rico Orden de "+favri+' ' SHAD COLOR SCHE 8
		ACTI WIND win
		COL=20
		SCAT MEMV
		DO mfab
		IF confirma("Generar Hist¢rico y Cerrar Orden de "+favri,.T.,16,0)
			SELE fax
			STORE .T. TO sigue
			SCAN FOR numero=nfab .AND. !avio
				IF EMPTY(fax.ffin)  .OR. EMPTY(fax.responsabe) .OR. EMPTY(fax.responsabr) .OR. EMPTY(fax.responsabe) .OR. EMPTY(fax.fini)
					STORE .F. TO sigue
					EXIT
				ENDIF
			ENDSCAN
			IF sigue
				ACTI WIND win
				m.fechafin=DATE()
				@ 4,COL+27 GET m.fechafin
				@ 7,COL GET m.term1 PICT '999999' MESS 'Cantidad de Art¡culos Terminados (1¦)'
				@ 8,COL GET m.term2 PICT '999999' MESS 'Cantidad de Art¡culos Terminados (2¦)'
				@ 9,COL GET m.term2e PICT '999999' MESS 'Cantidad de Art¡culos Terminados (2¦ Esp)'
				READ
				IF M.TERM1+M.TERM2+M.TERM2E<=M.CANTINI
					=OPHIS()
					SELE HIS
					=FLOCK("HIS") .OR. FLOK("HIS")
					APPE FROM (PATH+"\ORFAB") FOR numero=nfab
					UNLO IN HIS
					SELE HIX
					=FLOCK("HIX") .OR. FLOK("HIX")
					APPE FROM (PATH+"\ORFABDAT") FOR numero=nfab
					SCAN FOR numero=m.nfab .AND. !avio
						REPL remanente WITH cantent-cantsal
					ENDSCAN
					UNLO IN HIX
					DO IAUD WITH 'GEN HISTOR O.C. '+ALLTRIM(STR(nfab))
					=OPFAB()
					SET ORDER TO
					=FLOCK("FAB") .OR. FLOK("FAB")
					DELE FOR NUMERO=NFAB
					UNLO IN FAB
					SELE FAX
					SET ORDER TO
					=FLOCK("FAC") .OR. FLOK("FAC")
					DELE FOR NUMERO=NFAB
					UNLO IN FAX
				ELSE
					=cartel('Orden de '+favri+' N§ '+ALLTRIM(STR(nfab)),;
					'LA SUMA DE LOS PRODUCTOS TERMINADOS',;
					'ES MAYOR A LA CANTIDAD DE PRODUCTOS CORTADOR',;
					'RECUENTE E INTENTELO NUEVAMENTE')
				ENDIF
			ELSE
				=cartel('En la Orden de '+favri+' N§ '+ALLTRIM(STR(nfab)),;
				'HAY DATOS INCOMPLETOS',;
				'SOBRE INGRESO Y RECEPCION DE PRODUCTOS',;
				'COMPLETE E INTENTELO NUEVAMENTE')
			ENDIF
		ENDIF
	ELSE
		=cartel("",;
		'Orden de '+favri+' N§ '+ALLTRIM(STR(nfab)),;
		'NO EXISTE',;
		'IMPOSIBLE GENERAR HISTORICO')
	ENDIF
ELSE
	=IAUDI()
ENDIF
UNLO ALL
DEAC WIND ALL
RETURN MEN_LIN(BOTOM)
