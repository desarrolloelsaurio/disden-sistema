* EGRESO
ULPR=HORA_ULP(PROGRAM())
EG_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE EG_DIJO="Paga Factura de Consorcio"
DO OPCNS
=OPMIX()
=OPPRO()
DO OPFAR
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
ELSE
   WAIT "FACTURA NO ENCONTRADA" WIND NOWA
ENDIF
CASE EG_DIJO="Paga Factura de Terceros"
respuesta='PAGF3#2#39#Paga Factura de Terceros#3;
#\<Por Propietario;
#\<Selecciona;
#-;
#\<Recibo Pago'
=defpop()
ON SELE POPU PAGF3 DO PAGF3
ACTI POPU PAGF3
RELE POPU PAGF3
ULPR=HORA_ULP(PROGRAM())
CASE EG_DIJO="Paga Factura de Administraci¢n"
CASE EG_DIJO="Egreso de Efectivo"
DO OPCAJ
DO OPCCP
=OPGAS()
=OPPRO()
DO ECAJ1
CASE EG_DIJO="Egreso de Cheques de Terceros"
if elicchp()
   =ECCHX1("CH")
endif
CASE EG_DIJO="Egreso de Cheques Propios"
DO ECAJ2
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE PAGF3
ULPR=HORA_ULP(PROGRAM())
PA_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE PA_DIJO="Por Propietario"
DO OPCNS
=OPMIX()
=OPPRO()
DO OPCAJ
DO OPFAR
DO OPCCP
DO PAGFA3
CASE PA_DIJO="Selecciona"
DO OPCNS
=OPMIX()
=OPPRO()
DO OPFAR
DO OPCCP
DO PAGFA3S
  CASE PA_DIJO="Recibo Pago"
DO OPCNS
=OPMIX()
=OPPRO()
DO OPCAJ
DO OPFAR
DO OPCCP
DO RECFA3
ENDCASE
RETURN MEN_LIN(BOTOM)

