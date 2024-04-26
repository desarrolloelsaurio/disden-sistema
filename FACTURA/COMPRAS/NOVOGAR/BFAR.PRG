FUNCTION BFAR
ULPR=PROGRAM()
IF CHEQSEG()		   
			IF ELIFAR("Factura de Compras")
				SELE FAR
				SCAT MEMV
				ABR=M.TIPO
				TIT_SIN=IIF(ABR='FA','Factura',iif(abr='NC',"Nota de Cr‚dito","Nota de D‚bito"))
                DO ifacd WITH .f.,'FA','Fact','FACT','Factura','Facturas',.T.
				if confirma("Borrar Documento",.t.,15,5)
					IF EMPTY(FAR.MES)
					    =WORKING()
					    =DOTALK()
						=men_lin("ESPERE POR FAVOR - BORRANDO")
						=IAUD(ALLTRIM(PRO.PROCOD)+"/"+FAR.FACTURA)
						SELE FAD
						=FLOCK() .OR. FLOK("FAD")
						SET ORDER TO
						DELE FOR FACTURA=FAR.FACTURA .AND. PROCOD=FAR.PROCOD
						UNLO IN FAD
						SELE CCP
						=FLOCK() .OR. FLOK("CCP")
						SET ORDER TO
						DELE FOR NUMERORE=FAR.FACTURA .AND. PROCOD=FAR.PROCOD
						UNLO IN CCP
						SELE FAR
						=FLOCK() .OR. FLOK("FAR")
						DELE
						UNLO IN FAR
						=UNTALK()
						=UNWORK()
					ELSE
						=CARTEL2("LA FACTURA PERTENECE AL IVA DEL MES DE",;
						QMES(LEFT(FAR.MES,3))+" DE 19"+RIGHT(FAR.MES,2),;
						"IMPOSIBLE BORRARLA DADO QUE SE HA CERRADO",;
						"EL MES DE I.V.A.")
					ENDIF
				endif
				=RELEWIN("win2")
			ENDIF
ELSE
=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)