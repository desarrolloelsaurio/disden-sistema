DO OPCNS
=OPMIX()
=OPPRO()
DO OPFAR
DO WHILE .T.
FAC4=POPMENU(6,23,'PAGA FACTURA',;
     "Paga Factura de Consorcio",;
     "Paga Factura de Administraci¢n ",;
     "Paga Factura de Terceros",;
     "Men£ Principal")
DO CASE
CASE FAC4=1
DO OPCCG
IF ELIFCO()
   IF FAR.PAGADA
      =CARTEL("La factura "+far.factura,;
      "del proveedor "+ALLTRIM(per.cliente),;
      "figura pagada en el archivo",;
      "Pulse [ENTER] para contimuar")
   ELSE
   =IFACD("FA","Fact.","Fact","Fact.","Factura","Facturas",.t.)
   IF CONFIRMA("Pagar la factura "+far.factura,.t.,10,0)
		=OPCCH()
      DO OPCAJ
      DO OPCCP
      DO PAGFACNS.SPR
      ENDIF
   ENDIF
ENDIF
CASE FAC4=3
DO OPCCP
DO PAGFA3
CASE FAC4=4
EXIT
ENDCASE
ENDDO
RETURN
