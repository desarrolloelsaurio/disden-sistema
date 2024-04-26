procedure ncrec
INVOICE='NC'
TIT_INVO=IIF(INVOICE='FA','FACTURA',IIF(INVOICE='NC','NOTA DE CREDITO','NOTA DE DEBITO'))
TIT_INVOs=IIF(INVOICE='FA','Facturas',IIF(INVOICE='NC','Notas De Cr‚dito','Notas de D‚bito'))
fil_invo=IIF(INVOICE='FA','(empty(FAR.TIPO) .or. FAR.TIPO="FA")',IIF(INVOICE='NC','FAR.TIPO="NC"','FAR.TIPO="ND"'))
abr_invo=IIF(INVOICE='FA','Fact.',IIF(INVOICE='NC','N. Cr‚d.','N. D‚b.'))
do case
case bar()=1
  =pro("Nota de Cr‚dito de Proveedores")
case bar()=3
   DO LFARZ WITH .T.
case bar()=4
   DO LFARZ
endcase
return
