*:*********************************************************************
*-- Programa: LRECI.PRG
*-- Fecha   : 02-09-93 01:15pm
*-- Versi¢n : G. REINER
*-- Notas   : LISTA NOTA DE REMITO DE COMPRA POR IMPRESORA
*:**********************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
   SELE REC
   SCAT MEMV
   IF XSEEK(M.PROCOD,'PRO','PROCOD')
      m.procod = pro.procod
      STOR NUL TO CASOS
      =CABPRI()
      _PCOPIES=1
      PRINTJOB
         ACLA=PAIP+PADC("ARTICULO",20)+PAIP+;
           PADC("DETALLE",30)+PAIP+;
           PADC("RECIBIDO",XACDIGI)+PAIP+;
           PADC("Pcio UNITARIO",XACDIGI)+PAIP
         M.LINEA=REPL("=",LEN(ACLA))
         =cabpri1()
         ? "Ú"+REPL("Ä",77)+"¿"
         ? "³"
         ?? PADL(DTOC(m.fecharem),77)
         ?? "³"
         ? "³"
         ?? PADL("REMITO N§ "+REC.REMITO,77)
         ?? "³"
         ? "³"
         ?? PADL(ALLTRIM(PRO.PROVEEDOR)+" ("+ALLTRIM(PRO.PROCOD)+")",77)
         ?? "³"
         ? "³"
         ?? PADL(PRO.DOMICILIO+"- TEL:"+ALLTRIM(PRO.TELEFONO)+")",77)
         ?? "³"
         ? "³"
         =XSEEK(PRO.LOCAL,'MIX','CIUCOD')
         ?? PADL(ALLTRIM(MIX.TEXTO1),77)
         ?? "³"
         ? "Ã"+REPL("Ä",77)+"´"
         IF !EMPTY(REC.PEDIDO)
            ? "³"
            ?? PARSE("PEDIDO:"+REC.REMITO,"FECHA PEDIDO:"+DTOC(M.FECHAPED),77)
            ?? "³"
         ENDIF
         ? "³"
         IF EMPTY(REC.FACTURA)
            ?? PADC("*** PENDIENTE DE FACTURACION ***",77)
         ELSE
            ?? PARSE("FACTURA:"+REC.FACTURA,"FECHA FACTURA:"+DTOC(M.FECHAFAC),77)
         ENDIF
         ?? "³"
         ? "À"+REPL("Ä",77)+"Ù"
         ?
         sele RE1
         =seek(REC.REMITO+REC.procod)
         =_LIN(.T.)
         scan while RE1.NUMERO=REC.REMITO .and. RE1.procod=REC.procod
            ? paip
            ?? RE1.articulo
            ?? paip
            =xseek(RE1.articulo,'mer','articulo')
            ?? mer.merca
            ?? paip
            ?? str(RE1.cantidad,xacdigi)
            ?? paip
            ?? str(RE1.monto,xacdigi,2)
            ?? paip
         endscan
         =FIN_LIN(4,NUL)
      ENDP
      =FINIMP()
      =iaud(REC.REMITO+PAIP+pro.procod)
   ENDIF
ELSE
   =iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
