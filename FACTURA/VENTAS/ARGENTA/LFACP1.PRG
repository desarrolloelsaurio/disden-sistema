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
fisc='.T.'
tt='A'
LOSA=ALLTRIM(PROMPT())
dijo=BAR()
DO CASE
CASE LOSA='Listados'
DO LFAC WITH .T.
CASE LOSA='Documentaci¢n Emitida'
TIT_INVO='DOCUMENTO'
TIT_INVOs='DOCUMENTOS'
fil_invo='.T.'
DO LFAC WITH .T.
CASE LOSA='Libro de IVA Ventas'
STORE {} TO FECINI,FECFIN
IF ENTRE_FE()
   fisc='fechaem>=fecini .and. fechaem<=fecfin'
   tt='Libro de IVA Ventas entre el '+dtoc(fecini)+' y el '+dtoc(fecfin)
   DO LIVAVP
ENDIF
CASE LOSA="Ultima Operaci¢n"
   DO LFACU with .t.
CASE LOSA="Planilla"   
   DO LFACV WITH .T.
ENDCASE
=MEN_LIN(BOTOM)
RETURN
