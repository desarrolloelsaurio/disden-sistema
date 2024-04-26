********************************************
*-- Programa: LFACI1.PRG
*-- Fecha   : 12/02/91 03:09pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE FACTURAS
********************************************
PARAMETER INVOICE,PORMONIT

#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

TIT_INVO=IIF(INVOICE='FA','FACTURA',IIF(INVOICE='NC','NOTA DE CREDITO','NOTA DE DEBITO'))
TIT_INVOs=IIF(INVOICE='FA','Facturas',IIF(INVOICE='NC','Notas De Cr‚dito','Notas de D‚bito'))
fil_invo=IIF(INVOICE='FA','(empty(FAC.TIPO) .or. FAC.TIPO="FA")',IIF(INVOICE='NC','FAC.TIPO="NC"','FAC.TIPO="ND"'))
FA_DIJO=BAR()
IF ELTIPO='A'
	fiL_INVO='LEFT(FACTURA,1)="A" .AND. '+FIL_INVO
	TIT_INVOS=TIT_INVOS+' Tipo "A"'
ELSE
	IF ELTIPO='B'
		fiL_INVO='LEFT(FACTURA,1)="B" .AND. '+FIL_INVO
		TIT_INVOS=TIT_INVOS+' Tipo "B"'
	ENDIF
ENDIF
FA_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE FA_DIJO="Listados"
	DO LFAC WITH PORMONIT
CASE FA_DIJO="Documentaci¢n Emitida"
	TIT_INVO='DOCUMENTO'
	TIT_INVOS='DOCUMENTOS'
	FIL_INVO='.T.'
	STORE {} TO FECINI,FECFIN
	IF ENTRE_FE()
		FISC='FAC.FECHAEM>=FECINI .AND. FAC.FECHAEM<=FECFIN'
		tt='Documentaci¢n Emitida entre el '+dtoc(fecini)+' y el '+dtoc(fecfin)
		DO LFAC WITH PORMONIT
	ENDIF
CASE FA_DIJO="Libro de IVA Ventas por Producto"
	STORE {} TO FECINI,FECFIN
	IF ENTRE_FE()
		IF ELTIPO="A"
			FISC='LEFT(FACTURA,1)="A" .AND. '
			TT1='Documentos "A"'
		ELSE
			IF ELTIPO="B"
				FISC='LEFT(FACTURA,1)="B" .AND. '
				TT1='Documentos "B"'
			ELSE
				STORE "" TO FISC,TT1
			ENDIF
		ENDIF
		FISC=FISC+'FAC.FECHAEM>=FECINI .AND. FAC.FECHAEM<=FECFIN'
		tt='Libro de IVA Ventas por Producto'+chr(13)+chr(10)+;
		'entre el '+dtoc(fecini)+' y el '+dtoc(fecfin)+;
		IIF(EMPTY(TT1),"",chr(13)+chr(10)+TT1)
		DO GRL2 WITH 10,30," L¡mite del Listado "
		ON SELE POPU NADA DO LIVAVM WITH PORMONIT
		ACTI POPU NADA
		RELE POPU NADA
	ENDIF
CASE FA_DIJO="Libro de IVA Ventas"
	STORE {} TO FECINI,FECFIN
	IF ENTRE_FE()
		IF PORMONIT
			FISC='FECHAEM>=FECINI .AND. FECHAEM<=FECFIN'
			tt='Libro de IVA Ventas entre el '+dtoc(fecini)+' y el '+dtoc(fecfin)
			DO LIVAVP
		ELSE
			FISC='FECHAEM>=FECINI .AND. FECHAEM<=FECFIN'
			tt='Libro de IVA Ventas entre el '+dtoc(fecini)+' y el '+dtoc(fecfin)
			STORE NUL TO RESPUESTA
			IF !EMPTY(INFIC("PAGINA INICIAL DEL LISTADO",999999))
				PAGENO=RESPUESTA
				DO LIVAVI WITH .T.
			ENDIF
		ENDIF
	ENDIF
CASE FA_DIJO="Ultima Operaci¢n"
	DO LFACU WITH PORMONIT
CASE FA_DIJO="Planilla"
	DO LFACV WITH PORMONIT
CASE FA_DIJO="Costos"
	DO LFAK WITH PORMONIT
CASE FA_DIJO="Diferencia de Precios"
	DO LFPR WITH PORMONIT
CASE FA_DIJO="Facturas Faltantes"
	=OPFAC()
	SET ORDER TO TAG IIF(ELTIPO='A',('FACTURAA'),IIF(ELTIPO='B',('FACTURAB'),('FACTURA"))))
	=OPFAC() WITH JANNRO
	DO CONT_FAC
CASE FA_DIJO="M s de $ 15000 Trimestral"
do _f15000
CASE FA_DIJO="M s de $ 10000 Mensual"
do _f11000 
ENDCASE
RETURN MEN_LIN(BOTOM)
