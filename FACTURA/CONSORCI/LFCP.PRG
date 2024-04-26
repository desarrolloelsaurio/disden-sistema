=MEN_LIN(IMPRIMIENDO)
=cabpri()
_PCOPIES=COPIAS
PRINTJOB
   M.NADA='CONSORCIO:'+ALLTRIM(cns.consorcio)
   ?M.NADA
   ?REPL('-',LEN(M.NADA))
   ?'PROVEEDOR:'+ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
   ?ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
   ?pro.localidad
   ?REPL('-',LEN(M.NADA))
   ?'NRO FACTURA:'+M.FACTURA
   ?'FECHA:'+DTOC(M.FECHAEM)
   ?'CONDICION DE PAGO:'
   ?? SAYMIX(m.condpago,"PAGCOD")
   ?'TIPO DE GASTO:'
   ?? SAYMIX(M.GASCOD,'CASCOD')
   ?'MONEDA:'+M.MONEDA
   ?'COTIZACION:'+TRAN(M.COTIZ,PICU)
   IF PRODUCTO
      M.TITU='|'+PADC('ARTICULO',16)+PAIP+PADC('DETALLE',29)+PAIP+PADC('CANTIDAD',10)+PAIP+PADC('PRECIO UNIT.',14)+PAIP+PADC('TOTAL',14)+'|'
      ?REPL('-',LEN(M.TITU))
      ?M.TITU
      ?REPL('-',LEN(M.TITU))
      susp
      SELE FAD
      SCAN FOR fad.factura=m.factura .AND. fad.procod=m.procod
         ??'|'
         ? articulo
         ??'|'
         ??detalle
         ??'|'
         ??TRANS(cantidad,"@Z 99999")
         ??'|'
         ??TRANS(monto / cantidad,"@Z 999999999.99")
         ??'|'
         ??TRANS(monto, "@Z 99999999999.99")
         ??'|'
      ENDSCAN
      ?REPL('-',LEN(M.TITU))
   ENDIF
   ?
   ?'TOTALES'
   ?"MONTO TOTAL FACTURA : "
   ??TRAN(M.MONTOTOT,PICU)
   ?"MONTO DESCUENTO     : "
   ??TRAN(M.DESCUENTO,PICU)
   ?"MONTO NETO GRAVADO  : "
   ??TRAN(M.MONTOBRU,PICU)
   ?"MONTO RETENCIONES   : "
   ??TRAN(M.MONTOIVA,PICU)
   ?"MONTO IMPUESTO 1)   : "
   ??TRAN(M.MONTOOT2,PICU)
   ?"MONTO IMPUESTO 2)   : "
   ??TRAN(M.MONTOOT3,PICU)
   ?"MONTO EXENTO        : "
   ??TRAN(M.MONTOEXE,PICU)
   ?"MONTO TOTAL FACTURA : "
   ??TRAN(M.MONTONET,PICU)
   ?REPL('-',LEN(M.NADA))
   ?'FORMAS DE PAGO:'
   FOR I=1 TO m.nrocuotas
      ?fechas[I]
      ??' - '
      ??TRAN(montocuot[i],picu)
   NEXT
ENDP
RETURN
