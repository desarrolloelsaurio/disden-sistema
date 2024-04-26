*********************************************************************************
*-- Programa: Lfacp1.PRG
*-- Fecha   : 12/02/91 03:09pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE FACTURAS-NOTAS DE DEBITO-NOTAS DE CREDITO
********************************************************************************
PARAMETER INVOICE
TIT_INVO=IIF(INVOICE='FA','FACTURA',IIF(INVOICE='NC','NOTA DE CREDITO','NOTA DE DEBITO'))
TIT_INVOs=IIF(INVOICE='FA','Facturas',IIF(INVOICE='NC','Notas De Cr‚dito','Notas de D‚bito'))
fil_invo=IIF(INVOICE='FA','(empty(FAC.TIPO) .or. FAC.TIPO="FA")',IIF(INVOICE='NC','FAC.TIPO="NC"','FAC.TIPO="ND"'))
abr_invo=IIF(INVOICE='FA','Fact.',IIF(INVOICE='NC','N. Cr‚d.','N. D‚b.'))
fisc='.T.'
tt='A'
dijo=BAR()
DO CASE
CASE BAR()=1
	DO LFAC WITH .T.
CASE BAR()=2
	TIT_INVO='DOCUMENTO'
	TIT_INVOs='DOCUMENTOS'
	fil_invo='.T.'
	abr_invo='Docs.'
	DO LFAC WITH .T.
CASE BAR()=3
	STORE {} TO FECINI,FECFIN
	IF ENTRE_FE()
		fisc='fechaem>=fecini .and. fechaem<=fecfin'
		tt='Libro de IVA Ventas entre el '+dtoc(fecini)+' y el '+dtoc(fecfin)
		DO LIVAVP
	ENDIF
CASE BAR()=4
	DO LFACPU
ENDCASE
=MEN_LIN(BOTOM)
RETURN
