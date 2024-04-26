******************************************************************************
*-- Programa: LFACI1.PRG
*-- Fecha   : 12/02/91 03:09pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE FACTURAS
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*1 #\<Listados Facturas;
*2 #\<Costos Facturas;
*3 #\<Diferencia de Precios;
*4 #-;
*5 #Listados \<Documentaci¢n;
*6 #Costos D\<ocumentaci¢n;
*7 #Documentaci¢n \<Emitida;
*8 #Planilla;
*9 #Libro de \<IVA Ventas'
*****************************************************************************
PARAMETER INVOICE
TIT_INVO=IIF(INVOICE='FA','FACTURA',IIF(INVOICE='NC','NOTA DE CREDITO','NOTA DE DEBITO'))
TIT_INVOs=IIF(INVOICE='FA','Facturas',IIF(INVOICE='NC','Notas De Cr‚dito','Notas de D‚bito'))
fil_invo=IIF(INVOICE='FA','(empty(fac.tipo) .or. fac.tipo="FA")',IIF(INVOICE='NC','fac.tipo="NC"','fac.tipo="ND"'))
fisc='.T.'
tt='A'
diko=alltrim(prompt())
DO CASE
CASE diko="Listados Facturas"
	DO LFAC WITH .F.
CASE diko="Costos Facturas"
	DO LFAK WITH .F.
CASE diko="Diferencia de Precios"
		DO LFpr WITH .F.
CASE diko="Listados Documentaci¢n"
	TIT_INVO='DOCUMENTACION'
	TIT_INVOs='DOCUMENTACION'
	fil_invo=".T."
	fisc=".T."
	ABR_INVO="Doc. "
	DO LFAC WITH .F.
CASE diko="Costos Documentaci¢n"
	TIT_INVO='DOCUMENTACION'
	TIT_INVOs='DOCUMENTACION'
	fil_invo=""
	fisc=""
	ABR_INVO="Doc. "
	DO LFAK WITH .F.
CASE diko="Documentaci¢n Emitida"
	store nul to respuesta
	if !empty(ELIEMP('a Listar',-1,1))
		=OPFAC()
		STORE {} TO FECINI,FECFIN
		IF ENTRE_FE()
			fisc='fechaem>=fecini .and. fechaem<=fecfin'
			tt='Documentaci¢n Emitida entre el '+dtoc(fecini)+' y el '+dtoc(fecfin)
			PAGENO=1
			DO LIVAVI with .f.
		ENDIF
	endif
CASE diko="Planilla"
	DO LFACV
CASE diko="Libro de IVA Ventas"
	store nul to respuesta
	if !empty(ELIEMP('a Listar',-1,1))
		=OPFAC()
		STORE {} TO FECINI,FECFIN
		IF ENTRE_FE()
			STORE nul tO RESPUESTA
			IF INFIC("PAGINA INICIAL DEL LISTADO",999999)#0
				PAGENO=RESPUESTA
				fisc='fechaem>=fecini .and. fechaem<=fecfin'
				tt='Libro de IVA Ventas entre el '+dtoc(fecini)+' y el '+dtoc(fecfin)
				DO LIVAVI with .t.
			ENDIF
		ENDIF
	endif
ENDCASE
=MEN_LIN(BOTOM)
RETURN
