*********************************************************************************
*-- Programa: Lfacp1.PRG
*-- Fecha   : 12/02/91 03:09pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE FACTURAS
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*  #Listados \<Facturas;
*  #\<Costos;
*  #\<Diferencia de Precios;
*  #-;
*  #Listados \<Documentaci¢n Emitida;
*  #Libro de \<IVA Ventas'
*
********************************************************************************
PARAMETER INVOICE
L_DIJO=PROMPT()
TIT_INVO=IIF(INVOICE='FA','FACTURA',IIF(INVOICE='NC','NOTA DE CREDITO','NOTA DE DEBITO'))
TIT_INVOs=IIF(INVOICE='FA','Facturas',IIF(INVOICE='NC','Notas De Cr‚dito','Notas de D‚bito'))
fil_invo=IIF(INVOICE='FA','(empty(fac.tipo) .or. fac.tipo="FA")',IIF(INVOICE='NC','fac.tipo="NC"','fac.tipo="ND"'))
fisc='.T.'
tt='Listado de '+tit_invos
dijo=BAR()
DO CASE
CASE BAR()=1
   DO LFAC WITH .T.
CASE BAR()=2
   DO LFAK WITH .T.
CASE BAR()=3
   DO LFpr WITH .T.
CASE BAR()=5
TIT_INVO='DOCUMENTACION'
TIT_INVOs='DOCUMENTACION'
fil_invo=".T."
FISC=".T."
ABR_INVO="Doc. "
TT="DOCUMENTACION EMITIDA"
DO LFAC WITH .T.
CASE BAR()=6
TIT_INVO='DOCUMENTACION'
TIT_INVOs='DOCUMENTACION'
fil_invo=".T."
ABR_INVO="Doc. "
DO LFAK WITH .T.
CASE BAR()=7
	DO LFACV WITH .T.
CASE BAR()=8
STORE NUL TO RESPUESTA
   if !empty(ELIEMP('a Listar',-1,1))
      =OPMER() with jannro
      =OPFAC() with jannro
      STORE {} TO FECINI,FECFIN
      IF ENTRE_FE()
         fisc='fechaem>=fecini .and. fechaem<=fecfin'
        tt='Libro de IVA Ventas entre el '+dtoc(fecini)+' y el '+dtoc(fecfin)
        DO LIVAVP
     ENDIF
   ENDIF
ENDCASE
RETURN MEN_LIN(BOTOM)
