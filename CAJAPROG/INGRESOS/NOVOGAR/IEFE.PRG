*******************************************************************
*-- Programa: IEFE.PRG
*-- Fecha   : 08/10/92
*-- Versi¢n : V.LEEGSTRA - G. REINER - BATALAN
*-- Notas   : INGRESO EN EFECTIVO Y CHEQUES
*-- Modificaci¢n GOYO 12-10-92 01:09pm (icob_1)
*-- Agregado de Icch para ingreso de cheques y tarjetas
*-- VERSION NOVOGAR
*******************************************************************
ULPR=hora_ulp(PROGRAM())
IF CHEQSEG()
   m.mess1=" - [ESC] para Men£"
   =MOVEWIN(5,10,18,60,'WIN1'," Ingreso de Efectivo ")
   SELE CAJ
   SCAT MEMV BLAN
   STOR NUL TO cheques,efecaus,efecdol,sumpag,cheques,tarjeta
   STOR xacotiz to NADA10
   STORE '999999999.99' TO picu
   
   STORE date() to m.fechaem
   COL=20
   @ 1,1 SAY "FECHA OP."
   @ $+1,1 SAY "COTIZACION"
   @ $+1,1 SAY "COMPROBANTE "
   @ $+1,1 SAY "COMPROBANTE N§"
   @ $+1,1 SAY "GASTO"
   @ $+1,1 SAY ALLTRIM(UPPER(XAUSS))
   @ $+1,1 SAY ALLTRIM(UPPER(XADOLS))
   @ $+2,1 say 'TOTAL  '
   @ 1, COL GET m.fechaem ;
     MESS "Fecha de Operaci¢n"+m.mess1
   @ $+1, COL GET NADA10 ;
     pict picu ;
     MESS 'Cotizaci¢n del '+xadol+m.mess1
   @ $+1, COL GET m.compr ;
     MESS 'Descripcion del Comprobante de Referencia'+m.mess1
   @ $+1, COL GET m.NUMERE ;
     MESS 'N§ del Recibo o Planilla'
   read
   IF LAST()#27
      store nul to respuesta
      if !empty(eligas("",1,-1))
         m.gasto=left(mix.texto2,11)
         m.nada=mix.texto1
         @ $+1, COL GET m.nada
         clear gets
         @ $+1,COL GET efecaus PICTURE picu MESS 'Monto del ingreso de '+xauss
         @ $+1,COL GET efecdol PICTURE picu MESS 'Monto del ingreso de '+xadols
         READ
         sumpag=efecaus+efecdol*NADA10+cheques+tarjeta
         IF SUMPAG>0
            SUMPAG=EFECAUS+EFECDOL*NADA10
            @ $+2,COL GET sumpag PICT picu
            CLEA GETS
            if confirm1("los Datos Ingresados",.T.,20,30)
               *** EFECTIVO EN MONEDA NACIONAL
               m.caja='00'
               m.codcli=''
               m.fechaop=fechaem
               m.compre='RE'
               IF !empty(efecaus)
                  m.monto=efecaus
                  m.moneda=xauss
                  m.equivale=efecaus/NADA10
                  =AGRABAR("caj")
                  =IAUD("Ef."+xauss+" "+STR(M.MONTO))
               ENDIF
               *** EFECTIVO EN DOLARES
               IF efecdol#NUL
                  m.monto=efecdol*NADA10
                  m.moneda=xadols
                  m.equivale=efecdol
                  =AGRABAR("caj")
                  =IAUD("Ef."+xadols+" "+STR(M.MONTO))
               ENDIF
            ENDIF
         ENDIF
      ENDIF
   ENDIF
   =RELEWIN("win1")
ELSE
   =IAUDI()
ENDIF
RETURN
